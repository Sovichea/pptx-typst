"""Best-effort font dependency checks for the supported static Typst subset.

Font availability is environmental. This module reports separate Typst and
PowerPoint-facing inventories and never alters source typography or geometry.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import zipfile

from .typst_to_pptx import balanced, kwargs, txt_decode


SUPPORTED_FONT_CONSTRUCTS = (
    "PptxTextFrame", "PptxText", "PptxPlaceholderSlot", "PptxPlaceholder",
    "PptxParagraph", "PptxPlaceholderParagraph", "PptxPlaceholderRun",
)
_CALL = re.compile(r"(?<![\w-])#?(" + "|".join(SUPPORTED_FONT_CONSTRUCTS) + r")\s*\(")
_STYLE_SUFFIXES = re.compile(
    r"\s+(?:thin|extra\s*light|ultra\s*light|light|book|regular|normal|medium|"
    r"semi\s*bold|demi\s*bold|bold|extra\s*bold|ultra\s*bold|black|heavy|"
    r"italic|oblique|variable|condensed|narrow|expanded|[1-9]00)\s*$", re.I,
)


def _family_key(name: str) -> str:
    """Normalize family names without confusing unrelated similarly named fonts."""
    name = re.sub(r"([a-z])([A-Z])", r"\1 \2", name)
    value = name.strip().casefold()
    value = re.sub(r"^[a-z]{6}\+", "", value)  # PDF subset prefix
    value = re.sub(r"[-_,]+", " ", value)
    value = re.sub(r"\s+", " ", value)
    return value.strip()


def _families_match(requested: str, actual: str) -> bool:
    """Match family names while tolerating common PDF style suffixes."""
    left, right = _family_key(requested), _family_key(actual)
    if left == right:
        return True
    while _STYLE_SUFFIXES.search(right):
        right = _STYLE_SUFFIXES.sub("", right).strip()
    return left == right


def extract_typst_font_usages(source: str, source_name: str = "<memory>") -> dict:
    """Extract literal ``font:`` values from supported static calls only."""
    clean = list(source)
    in_string = False
    escaped = False
    index = 0
    while index < len(source):
        char = source[index]
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
            index += 1
            continue
        if char == '"':
            in_string = True
            index += 1
            continue
        if source.startswith("//", index):
            end = source.find("\n", index)
            if end < 0:
                end = len(source)
            for offset in range(index, end):
                clean[offset] = " "
            index = end
            continue
        index += 1
    searchable = "".join(clean)
    usages: dict[str, list[dict]] = defaultdict(list)
    calls = []
    unresolved = []
    dynamic = []
    position = 0
    while match := _CALL.search(searchable, position):
        kind = match.group(1)
        try:
            raw, end = balanced(searchable, match.end() - 1)
        except (AssertionError, ValueError):
            break
        calls.append((kind, raw, match.start(), end))
        # Keep scanning nested paragraph/run calls inside text-frame records so
        # explicit mixed-font runs are not hidden by their containing frame.
        position = match.end()

    for kind, raw, start, _end in calls:
        attrs = kwargs(raw)
        if kind in ("PptxTextFrame", "PptxText", "PptxPlaceholderSlot", "PptxPlaceholder") and "font" not in attrs:
            unresolved.append({"file": source_name, "line": source.count("\n", 0, start) + 1,
                               "construct": kind,
                               "reason": "font may come from a placeholder parent, Typst text default, or helper default"})
        if "font" not in attrs:
            continue
        raw_font = attrs["font"].strip()
        family = txt_decode(attrs["font"])
        # Symbolic/dynamic values aren't verifiable by this static preflight.
        if not family or family == "none":
            continue
        if not raw_font.startswith(('"', "'")):
            dynamic.append({"file": source_name, "line": source.count("\n", 0, start) + 1,
                            "construct": kind, "expression": raw_font})
            continue
        line = source.count("\n", 0, start) + 1
        usages[family].append({"file": source_name, "line": line,
                               "construct": kind, "field": "font"})

    defaults = dynamic
    for match in re.finditer(r"#set\s+text\s*\(", searchable):
        try:
            raw, _end = balanced(searchable, match.end() - 1)
        except (AssertionError, ValueError):
            continue
        attrs = kwargs(raw)
        value = attrs.get("font")
        if value:
            decoded = txt_decode(value)
            for family in re.findall(r"\"((?:[^\"\\]|\\.)*)\"", value):
                name = txt_decode('"' + family + '"')
                usages[name].append({"file": source_name,
                                     "line": source.count("\n", 0, match.start()) + 1,
                                     "construct": "set text default", "field": "font"})
            if not re.search(r"\"", value) and decoded not in ("none", ""):
                defaults.append({"file": source_name,
                                 "line": source.count("\n", 0, match.start()) + 1,
                                 "expression": value})

    return {
        "families": [{"family": name, "usages": rows}
                     for name, rows in sorted(usages.items(), key=lambda item: item[0].casefold())],
        "dynamic_font_expressions": defaults,
        "unresolved_font_owners": unresolved,
        "supported_constructs": list(SUPPORTED_FONT_CONSTRUCTS),
    }


def _run_inventory(command: list[str], timeout: int = 20) -> tuple[set[str] | None, dict]:
    try:
        result = subprocess.run(command, capture_output=True, text=True, timeout=timeout, check=False)
    except (OSError, subprocess.TimeoutExpired) as exc:
        return None, {"status": "unknown", "reason": str(exc), "command": command}
    if result.returncode:
        return None, {"status": "unknown", "reason": result.stderr.strip() or
                      f"command exited with status {result.returncode}", "command": command}
    names = {line.strip() for line in result.stdout.splitlines() if line.strip()}
    return names, {"status": "checked", "command": command, "family_count": len(names)}


def typst_font_inventory(executable: str = "typst", font_paths: list[Path] | None = None) -> tuple[set[str] | None, dict]:
    """Query the Typst compiler using the same additional font paths supplied by the user."""
    command = [executable, "fonts"]
    if font_paths:
        # Typst accepts the platform path-list separator in one --font-path value.
        command.extend(["--font-path", os.pathsep.join(str(path) for path in font_paths)])
    return _run_inventory(command)


def _windows_font_families() -> set[str]:
    import winreg

    result: set[str] = set()
    locations = (
        (winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"),
        (winreg.HKEY_CURRENT_USER, r"SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"),
    )
    for hive, key_name in locations:
        try:
            with winreg.OpenKey(hive, key_name) as key:
                for index in range(winreg.QueryInfoKey(key)[1]):
                    display = winreg.EnumValue(key, index)[0]
                    family = re.sub(r"\s*\((?:TrueType|OpenType|Type 1)\)\s*$", "", display, flags=re.I)
                    if family.strip():
                        # Keep the full name as some style words are part of a
                        # real family (for example, Arial Black); also add a
                        # style-stripped candidate for registry face names.
                        result.add(family.strip())
                    previous = None
                    while previous != family:
                        previous = family
                        family = _STYLE_SUFFIXES.sub("", family).strip()
                    if family:
                        result.add(family)
        except OSError:
            continue
    return result


def _powerpoint_installed() -> bool:
    candidates = [
        Path(os.environ.get("ProgramFiles", "C:/Program Files")) / "Microsoft Office/root/Office16/POWERPNT.EXE",
        Path(os.environ.get("ProgramFiles(x86)", "C:/Program Files (x86)")) / "Microsoft Office/root/Office16/POWERPNT.EXE",
        Path(os.environ.get("ProgramFiles", "C:/Program Files")) / "Microsoft Office/Office16/POWERPNT.EXE",
    ]
    if any(path.is_file() for path in candidates):
        return True
    try:
        import winreg
        with winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                            r"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\POWERPNT.EXE"):
            return True
    except OSError:
        return False


def powerpoint_font_inventory() -> tuple[set[str] | None, dict]:
    """Best-effort Office-visible font inventory; unknown where Office isn't verifiable."""
    if sys.platform == "win32":
        if not _powerpoint_installed():
            return None, {"status": "unknown", "method": "windows_font_registry",
                          "reason": "Microsoft PowerPoint was not detected; Office font availability was not inferred."}
        try:
            names = _windows_font_families()
        except (ImportError, OSError) as exc:
            return None, {"status": "unknown", "method": "windows_font_registry", "reason": str(exc)}
        return names, {"status": "checked", "method": "windows_font_registry",
                       "powerpoint_detected": True,
                       "note": "Windows installed-font registry is used as an Office-visibility proxy; PowerPoint was not automated."}

    if sys.platform == "darwin":
        app = Path("/Applications/Microsoft PowerPoint.app").exists()
        if not app:
            return None, {"status": "unknown", "method": "fontconfig",
                          "reason": "Microsoft PowerPoint was not detected in /Applications."}
        executable = shutil.which("fc-list")
        if not executable:
            return None, {"status": "unknown", "method": "fontconfig",
                          "reason": "fc-list is unavailable; installed fonts could not be inventoried."}
        names, metadata = _run_inventory([executable, "--format=%{family}\\n"])
        if names is not None:
            expanded = {name.strip() for row in names for name in row.split(",") if name.strip()}
            return expanded, {**metadata, "method": "fontconfig", "powerpoint_detected": True,
                              "note": "System font inventory is a best-effort proxy for PowerPoint availability."}
        return names, {**metadata, "method": "fontconfig"}

    return None, {"status": "unknown", "method": "not_applicable",
                  "reason": "A local desktop PowerPoint font inventory is not available on this platform."}


def _family_status(family: str, inventory: set[str] | None, metadata: dict) -> dict:
    if inventory is None:
        return {"status": "unknown", "reason": metadata.get("reason", "font inventory unavailable")}
    match = next((name for name in inventory if _families_match(family, name)), None)
    return {"status": "available" if match else "missing", "matched_family": match,
            "basis": metadata.get("method", "Typst compiler font inventory")}


def inspect_pptx_run_fonts(path: Path) -> dict:
    """Report explicit typefaces on text run properties in the PPTX package."""
    from lxml import etree

    families: dict[str, list[dict]] = defaultdict(list)
    with zipfile.ZipFile(path) as package:
        for part in package.namelist():
            if not part.endswith(".xml") or not re.search(r"(?:slide|layout|master)\d*\.xml$", part):
                continue
            try:
                root = etree.fromstring(package.read(part))
            except etree.XMLSyntaxError:
                continue
            for node in root.iter():
                if etree.QName(node).localname not in ("rPr", "defRPr", "endParaRPr"):
                    continue
                for child in node:
                    if etree.QName(child).localname == "latin" and child.get("typeface"):
                        family = child.get("typeface")
                        families[family].append({"part": part, "property": etree.QName(node).localname})
    return {"status": "checked", "explicit_run_families": [
        {"family": family, "occurrences": rows}
        for family, rows in sorted(families.items(), key=lambda item: item[0].casefold())],
        "note": "Only explicit DrawingML run/default-run font declarations are listed; inherited theme fonts may not appear here."}


def inspect_pdf_fonts(path: Path) -> dict:
    """Extract font family names from PDF text spans when PyMuPDF is installed."""
    try:
        import fitz
    except ImportError:
        return {"status": "unknown", "reason": "PyMuPDF is not installed; PDF font extraction was skipped."}
    families: dict[str, int] = defaultdict(int)
    try:
        with fitz.open(path) as document:
            for page in document:
                for block in page.get_text("dict").get("blocks", []):
                    for line in block.get("lines", []):
                        for span in line.get("spans", []):
                            family = str(span.get("font", "")).strip()
                            if family and span.get("text", "").strip():
                                families[family] += 1
    except Exception as exc:
        return {"status": "unknown", "reason": f"Could not read PDF font metadata: {exc}"}
    return {"status": "checked" if families else "unknown",
            "resolved_families": [{"family": family, "text_span_count": count}
                                  for family, count in sorted(families.items(), key=lambda item: item[0].casefold())],
            "reason": None if families else "No searchable text spans exposed font names."}


def classify_rendered_font(requested: str, resolved: list[str], requested_status: str = "unknown") -> str:
    """Classify font evidence without treating unavailable metadata as a confirmed miss."""
    if not resolved:
        return "unverified_or_ambiguous"
    matches = [name for name in resolved if _families_match(requested, name)]
    if matches:
        return "family_match_metrics_may_differ"
    if requested_status == "missing":
        return "missing_requested_font_and_detected_substitute"
    return "detected_substitution"


def compare_font_evidence(source_inventory: dict, pptx_fonts: dict | None = None,
                          typst_pdf_fonts: dict | None = None,
                          powerpoint_pdf_fonts: dict | None = None) -> dict:
    """Compare declared families with PPTX declarations and rendered PDF fonts."""
    rows = []
    pptx_names = [row["family"] for row in (pptx_fonts or {}).get("explicit_run_families", [])]
    typst_names = [row["family"] for row in (typst_pdf_fonts or {}).get("resolved_families", [])]
    office_names = [row["family"] for row in (powerpoint_pdf_fonts or {}).get("resolved_families", [])]
    for entry in source_inventory.get("families", []):
        family = entry["family"]
        pptx_matches = [name for name in pptx_names if _families_match(family, name)]
        typst_matches = [name for name in typst_names if _families_match(family, name)]
        office_matches = [name for name in office_names if _families_match(family, name)]
        row = {"family": family, "pptx_declared_run_match": bool(pptx_matches),
               "pptx_matching_families": pptx_matches,
               "typst_pdf_matching_families": typst_matches,
               "powerpoint_pdf_matching_families": office_matches}
        if powerpoint_pdf_fonts is not None:
            state = entry.get("availability", {}).get("powerpoint", {}).get("status", "unknown")
            row["powerpoint_render_classification"] = classify_rendered_font(family, office_names, state)
            if (typst_pdf_fonts is not None and powerpoint_pdf_fonts.get("status") == "checked"
                    and typst_pdf_fonts.get("status") == "checked"):
                if typst_matches and office_matches:
                    row["typst_vs_powerpoint"] = "same_family_observed"
                elif typst_matches:
                    row["typst_vs_powerpoint"] = "different_or_substituted_family"
                else:
                    row["typst_vs_powerpoint"] = "unverified_or_ambiguous"
            else:
                row["typst_vs_powerpoint"] = "unverified_or_ambiguous"
        rows.append(row)
    return {"families": rows,
            "note": "PDF font names are evidence from searchable text spans, not proof of exact font metrics or geometry."}


def build_font_report(source_path: Path, *, font_paths: list[Path] | None = None,
                      typst_executable: str = "typst", pptx_path: Path | None = None,
                      typst_pdf: Path | None = None, powerpoint_pdf: Path | None = None) -> dict:
    source_path = Path(source_path)
    extracted = extract_typst_font_usages(source_path.read_text(encoding="utf-8"), str(source_path))
    typst_inventory, typst_meta = typst_font_inventory(typst_executable, font_paths)
    powerpoint_inventory, powerpoint_meta = powerpoint_font_inventory()
    entries = []
    for item in extracted["families"]:
        family = item["family"]
        entries.append({**item,
                        "availability": {
                            "typst": _family_status(family, typst_inventory, typst_meta),
                            "powerpoint": _family_status(family, powerpoint_inventory, powerpoint_meta),
                        },
                        "substitution_risk": {
                            "typst": "none_detected" if typst_inventory is not None and
                            _family_status(family, typst_inventory, typst_meta)["status"] == "available" else
                            "font_missing" if typst_inventory is not None else "unverified_or_ambiguous",
                            "powerpoint": "none_detected" if powerpoint_inventory is not None and
                            _family_status(family, powerpoint_inventory, powerpoint_meta)["status"] == "available" else
                            "font_missing" if powerpoint_inventory is not None else "unverified_or_ambiguous",
                        }})
    result = {
        "schema_version": 1,
        "generated_utc": datetime.now(timezone.utc).isoformat(),
        "interpretation": "Availability is based on font inventories. When a render PDF is supplied, its extracted font names provide separate evidence and may show substitution despite an available inventory entry.",
        "source": str(source_path),
        "platform": sys.platform,
        "families": entries,
        "typst_environment": {**typst_meta,
                              "font_paths": [str(path.resolve()) for path in (font_paths or [])]},
        "powerpoint_environment": powerpoint_meta,
        "dynamic_font_expressions": extracted["dynamic_font_expressions"],
        "unresolved_font_owners": extracted["unresolved_font_owners"],
        "checks_not_performed": [],
    }
    if not entries:
        result["checks_not_performed"].append(
            "No literal font family declarations were found in the supported static Typst constructs."
        )
    if extracted["dynamic_font_expressions"]:
        result["checks_not_performed"].append(
            "Dynamic or symbolic font expressions cannot be resolved by this bounded static preflight."
        )
    if extracted["unresolved_font_owners"]:
        result["checks_not_performed"].append(
            "Some text constructs omit a literal family and may inherit it from a master, layout, Typst default, or helper default; review unresolved_font_owners."
        )
    if typst_inventory is None:
        result["checks_not_performed"].append("Typst compiler font availability is unknown.")
    if powerpoint_inventory is None:
        result["checks_not_performed"].append("Local PowerPoint font availability is unknown.")
    if pptx_path:
        result["pptx"] = {"file": str(pptx_path), **inspect_pptx_run_fonts(pptx_path)}
    typst_pdf_fonts = inspect_pdf_fonts(typst_pdf) if typst_pdf else None
    powerpoint_pdf_fonts = inspect_pdf_fonts(powerpoint_pdf) if powerpoint_pdf else None
    if typst_pdf_fonts is not None:
        result["typst_pdf"] = {"file": str(typst_pdf), **typst_pdf_fonts}
    if powerpoint_pdf_fonts is not None:
        result["powerpoint_pdf"] = {"file": str(powerpoint_pdf), **powerpoint_pdf_fonts}
    if pptx_path or typst_pdf or powerpoint_pdf:
        result["render_comparison"] = compare_font_evidence(
            {**extracted, "families": entries},
            result.get("pptx"), typst_pdf_fonts, powerpoint_pdf_fonts)
        if powerpoint_pdf_fonts is not None:
            observed = {row["family"]: row["powerpoint_render_classification"]
                        for row in result["render_comparison"]["families"]}
            for row in entries:
                status = observed.get(row["family"])
                if status in ("detected_substitution", "missing_requested_font_and_detected_substitute"):
                    row["substitution_risk"]["powerpoint"] = "detected_in_powerpoint_pdf"
                elif status == "unverified_or_ambiguous":
                    row["substitution_risk"]["powerpoint"] = "unverified_or_ambiguous"
    return result


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Check required font availability for supported static Typst presentations.")
    parser.add_argument("source", type=Path, help="Typst source file (bounded static pptx-typst subset)")
    parser.add_argument("--report", type=Path, default=Path("font_report.json"), help="JSON output path")
    parser.add_argument("--typst", default="typst", help="Typst executable name or path")
    parser.add_argument("--font-path", action="append", type=Path, default=[],
                        help="Additional font directory; repeat or pass the same paths used for Typst compile")
    parser.add_argument("--pptx", type=Path, help="Optional exported PPTX for declaration comparison")
    parser.add_argument("--typst-pdf", type=Path, help="Optional Typst PDF for resolved-font extraction")
    parser.add_argument("--powerpoint-pdf", type=Path, help="Optional PowerPoint-rendered PDF")
    args = parser.parse_args(argv)
    for path in [args.source, args.pptx, args.typst_pdf, args.powerpoint_pdf]:
        if path is not None and not path.is_file():
            parser.error(f"File not found: {path}")
    report = build_font_report(args.source, font_paths=args.font_path, typst_executable=args.typst,
                               pptx_path=args.pptx, typst_pdf=args.typst_pdf,
                               powerpoint_pdf=args.powerpoint_pdf)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps({"families": [{"family": row["family"], "typst": row["availability"]["typst"]["status"],
                                    "powerpoint_inventory": row["availability"]["powerpoint"]["status"],
                                    "powerpoint_render_risk": row["substitution_risk"]["powerpoint"]}
                                   for row in report["families"]],
                      "report": str(args.report)}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
