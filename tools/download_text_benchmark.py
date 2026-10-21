#!/usr/bin/env python3
"""Download a reproducible, attributed sample from the Zenodo10K PPTX corpus."""
from __future__ import annotations

import concurrent.futures
import hashlib
import json
import random
import re
import tempfile
import time
from pathlib import Path
from urllib.parse import quote
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "benchmarks" / "text_fidelity" / "data"
INPUT = DATA / "input"
MANIFEST = ROOT / "benchmarks" / "text_fidelity" / "manifest.json"
DATASET = "Forceless/Zenodo10K"
SEED = 20261021
LIMIT = 100
MIN_BYTES = 100_000
MAX_BYTES = 40_000_000
USER_AGENT = "pptx-typst-text-fidelity-benchmark/0.1"


def get_json(url: str):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    last_error = None
    for attempt in range(6):
        try:
            with urlopen(request, timeout=60) as response:
                return json.load(response)
        except Exception as exc:
            last_error = exc
            if attempt < 5:
                time.sleep(min(12, 1.5 * (attempt + 1)))
    raise last_error


def corpus_rows():
    import pyarrow.parquet as parquet

    url = (
        "https://huggingface.co/datasets/Forceless/Zenodo10K/resolve/main/"
        "data/pptx-00000-of-00001.parquet?download=true"
    )
    request = Request(url, headers={"User-Agent": USER_AGENT})
    with tempfile.NamedTemporaryFile(suffix=".parquet", delete=False) as temp:
        temp_path = Path(temp.name)
        with urlopen(request, timeout=180) as response:
            while chunk := response.read(1024 * 1024):
                temp.write(chunk)
    try:
        return parquet.read_table(temp_path).to_pylist()
    finally:
        temp_path.unlink(missing_ok=True)


def creator_for_doi(doi: str) -> str:
    record_id = doi.rsplit(".", 1)[-1]
    try:
        record = get_json(f"https://zenodo.org/api/records/{record_id}")
        creators = record.get("metadata", {}).get("creators", [])
        return "; ".join(item.get("name", "") for item in creators if item.get("name"))
    except Exception:
        return ""


def safe_name(name: str) -> str:
    name = re.sub(r"[^A-Za-z0-9._-]+", "_", Path(name).name).strip("._")
    return (name or "presentation.pptx")[:120]


def download_one(item):
    row, index = item
    filename = f"{index:03d}_{safe_name(row['filename'])}"
    path = INPUT / filename
    expected = row.get("checksum", "").removeprefix("md5:")
    if path.is_file() and path.stat().st_size == int(row["size"]):
        if not expected or hashlib.md5(path.read_bytes()).hexdigest().lower() == expected.lower():
            return path, ""
    digest = hashlib.md5()
    request = Request(quote(row["url"], safe=":/?&=%"), headers={"User-Agent": USER_AGENT})
    last_error = None
    for attempt in range(3):
        try:
            with urlopen(request, timeout=180) as response, path.open("wb") as target:
                while chunk := response.read(1024 * 1024):
                    target.write(chunk)
                    digest.update(chunk)
            if path.stat().st_size != int(row["size"]):
                raise IOError(f"size mismatch ({path.stat().st_size} != {row['size']})")
            if expected and digest.hexdigest().lower() != expected.lower():
                raise IOError("MD5 checksum mismatch")
            return path, ""
        except Exception as exc:
            last_error = str(exc)
            path.unlink(missing_ok=True)
            if attempt < 2:
                time.sleep(attempt + 1)
    return path, last_error or "download failed"


def main():
    INPUT.mkdir(parents=True, exist_ok=True)
    rows = corpus_rows()
    eligible = [
        row for row in rows
        if row.get("license") == "cc-by-4.0"
        and str(row.get("filename", "")).lower().endswith(".pptx")
        and MIN_BYTES <= int(row.get("size", 0)) <= MAX_BYTES
        and any(char.isascii() and char.isalpha() for char in row.get("title", ""))
    ]
    if len(eligible) < LIMIT:
        raise SystemExit(f"Only {len(eligible)} eligible CC BY 4.0 decks found")
    selected = random.Random(SEED).sample(eligible, LIMIT)
    selected.sort(key=lambda row: (row["title"].casefold(), row["doi"]))
    jobs = [(row, index) for index, row in enumerate(selected, 1)]

    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        downloaded = list(pool.map(download_one, jobs))
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        creators = list(pool.map(lambda row: creator_for_doi(row["doi"]), selected))

    manifest = {
        "corpus": DATASET,
        "corpus_url": "https://huggingface.co/datasets/Forceless/Zenodo10K",
        "selection_method": (
            f"Deterministic sample of {LIMIT} from CC BY 4.0 PPTX records with ASCII-letter titles "
            f"files between {MIN_BYTES} and {MAX_BYTES} bytes; seed {SEED}."
        ),
        "license": "CC BY 4.0",
        "files": [],
    }
    for (row, index), (path, error), creator in zip(jobs, downloaded, creators):
        entry = {
            "file": str(path.relative_to(ROOT)).replace("\\", "/"),
            "title": row["title"],
            "creator": creator,
            "doi": row["doi"],
            "license": "CC BY 4.0",
            "source_url": row["url"],
            "record_url": "https://doi.org/" + row["doi"],
            "expected_bytes": int(row["size"]),
            "checksum": row.get("checksum"),
            "download_error": error or None,
        }
        if not error:
            entry["actual_bytes"] = path.stat().st_size
        manifest["files"].append(entry)

    MANIFEST.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")
    success = sum(not entry["download_error"] for entry in manifest["files"])
    print(f"Downloaded {success}/{LIMIT} decks to {INPUT}")
    print(f"Attribution manifest: {MANIFEST}")
    if success == 0:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
