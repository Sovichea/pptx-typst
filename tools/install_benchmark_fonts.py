#!/usr/bin/env python3
"""Install missing, open-licensed Google Fonts used by the frozen PPTX corpus."""
from __future__ import annotations

import ctypes
import json
import os
from pathlib import Path
import shutil
import subprocess
import urllib.request
import winreg


ROOT = Path(__file__).resolve().parents[1]
FONT_CACHE = ROOT / "benchmarks" / "text_fidelity" / "fonts"
REPORT = ROOT / "benchmarks" / "text_fidelity" / "font_installation.json"
FONT_REGISTRY = r"Software\Microsoft\Windows NT\CurrentVersion\Fonts"
GOOGLE_FONTS_API = "https://api.github.com/repos/google/fonts/contents/ofl/{family}?ref=main"

# Families observed in the corpus. The Google Fonts repository is the upstream
# source; the installer verifies each family's own SIL Open Font License file.
FAMILIES = {
    "roboto": "Roboto",
    "nunito": "Nunito",
    "quicksand": "Quicksand",
    "opensans": "Open Sans",
    "ibmplexsans": "IBM Plex Sans",
    "akayakanadaka": "Akaya Kanadaka",
    "assistant": "Assistant",
    "plusjakartasans": "Plus Jakarta Sans",
    "montserrat": "Montserrat",
    "ptsansnarrow": "PT Sans Narrow",
    "playfairdisplay": "Playfair Display",
    "zillaslab": "Zilla Slab",
    "caveat": "Caveat",
    "saira": "Saira",
    "akayatelivigala": "Akaya Telivigala",
    "ibmplexserif": "IBM Plex Serif",
    "miriamlibre": "Miriam Libre",
    "barlow": "Barlow",
    "oswald": "Oswald",
    "inter": "Inter",
    "lato": "Lato",
    "sourcesans3": "Source Sans 3",
}


def get_listing(family: str):
    request = urllib.request.Request(
        GOOGLE_FONTS_API.format(family=family),
        headers={"User-Agent": "pptx-typst-text-fidelity-benchmark"},
    )
    with urllib.request.urlopen(request, timeout=60) as response:
        return json.load(response)


def download(url: str, target: Path):
    request = urllib.request.Request(url, headers={"User-Agent": "pptx-typst-text-fidelity-benchmark"})
    with urllib.request.urlopen(request, timeout=120) as response, target.open("wb") as stream:
        shutil.copyfileobj(response, stream)


def install_font(source: Path, user_font_dir: Path):
    user_font_dir.mkdir(parents=True, exist_ok=True)
    destination = user_font_dir / source.name
    shutil.copy2(source, destination)
    with winreg.CreateKey(winreg.HKEY_CURRENT_USER, FONT_REGISTRY) as key:
        winreg.SetValueEx(key, f"{source.stem} (TrueType)", 0, winreg.REG_SZ, str(destination))
    return destination


def notify_windows():
    HWND_BROADCAST = 0xFFFF
    WM_FONTCHANGE = 0x001D
    SMTO_ABORTIFHUNG = 0x0002
    ctypes.windll.user32.SendMessageTimeoutW(
        HWND_BROADCAST, WM_FONTCHANGE, 0, 0, SMTO_ABORTIFHUNG, 5000, None
    )


def main():
    FONT_CACHE.mkdir(parents=True, exist_ok=True)
    user_font_dir = Path(os.environ["LOCALAPPDATA"]) / "Microsoft" / "Windows" / "Fonts"
    try:
        current_families = {line.strip().casefold() for line in subprocess.run(
            ["typst", "fonts"], capture_output=True, text=True, check=True
        ).stdout.splitlines() if line.strip()}
    except (OSError, subprocess.CalledProcessError):
        current_families = set()
    installed = []
    failed = []
    for slug, display_name in FAMILIES.items():
        family_dir = FONT_CACHE / slug
        try:
            if display_name.casefold() in current_families:
                installed.append({"family": display_name, "source": "already installed", "files": []})
                continue
            entries = get_listing(slug)
            license_entries = [entry for entry in entries if entry["name"].casefold() in {"ofl.txt", "ofl"}]
            if not license_entries:
                failed.append({"family": display_name, "reason": "No per-family OFL license file"})
                continue
            license_path = family_dir / "OFL.txt"
            family_dir.mkdir(parents=True, exist_ok=True)
            if not license_path.exists():
                download(license_entries[0]["download_url"], license_path)
            license_text = license_path.read_text(encoding="utf-8", errors="replace")
            if "SIL OPEN FONT LICENSE" not in license_text.upper():
                failed.append({"family": display_name, "reason": "License file is not SIL OFL"})
                continue
            font_entries = [entry for entry in entries if entry["name"].lower().endswith((".ttf", ".otf"))]
            if not font_entries:
                failed.append({"family": display_name, "reason": "No installable TTF/OTF files"})
                continue
            files = []
            for entry in font_entries:
                font_path = family_dir / entry["name"]
                if not font_path.exists():
                    download(entry["download_url"], font_path)
                destination = install_font(font_path, user_font_dir)
                files.append({"file": entry["name"], "installed_path": str(destination)})
            installed.append({"family": display_name, "upstream": f"https://github.com/google/fonts/tree/main/ofl/{slug}",
                              "license": "SIL Open Font License 1.1", "files": files})
        except Exception as exc:
            failed.append({"family": display_name, "reason": f"{type(exc).__name__}: {exc}"})
    notify_windows()
    report = {"source": "Google Fonts official repository", "installed": installed, "failed": failed}
    REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Installed {sum(len(item['files']) for item in installed)} font files from {len(installed)} families to {user_font_dir}")
    print(f"Installation report: {REPORT}")
    for item in failed:
        print(f"Skipped {item['family']}: {item['reason']}")


if __name__ == "__main__":
    main()
