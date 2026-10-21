# Text fidelity benchmark

This benchmark samples 100 `.pptx` files from [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K). Every selected record declares CC BY 4.0. `manifest.json` records the title, creator, DOI, source URL, license, expected size, and checksum for each file. The source presentations are downloaded to the ignored local directory `data/input/` and are not committed to this repository.

The frozen sample was selected with seed `20261021` from CC BY 4.0 PPTX records whose titles contain ASCII letters and whose files are between 100 KB and 40 MB. The files total about 948 MB. This is a broad sample, not a hand-picked set of known-supported decks; text reports both usable conversions and decks that fail to convert or compile.

## Run it again

On Windows, install Typst and desktop PowerPoint, then install the benchmark-only Python packages:

```powershell
python -m pip install pyarrow pywin32 PyMuPDF
python tools/download_text_benchmark.py
python tools/run_text_fidelity_benchmark.py
```

The downloader verifies each PPTX checksum and writes attribution details to `manifest.json`. The runner converts each file to Typst, compiles the result, exports the original through PowerPoint to PDF, and compares the PDFs. Intermediate projects and PDFs are removed after each deck. Use `--start N --end M` to run a manifest slice; completed rows are combined into `results.csv`.

## Measures

- **Visible-word recall and precision** compare text extracted from PowerPoint-exported and Typst PDFs. They ignore reading order and case; missing and duplicated words affect the scores.
- **Text-frame edge F1** compares rendered edge pixels inside source text-frame rectangles, allowing a one-pixel offset. It includes frame backgrounds and outlines and is a coarse visual proxy for font shape, placement, size, wrapping, and line spacing, rather than a pure glyph or positioning score. Python-PPTX's bounds for text nested in groups can be local to the group, so treat this score as an approximate corpus-level signal.
- Table text contributes to PDF word metrics, but tables are excluded from the text-frame edge score.
- **Mean font-size difference** compares character-weighted font sizes extracted from each PDF. It can hide per-run differences.
- **Available-font share** is computed over explicitly named font text. Text that inherits its font from a theme or layout is reported separately because its resolved family is not always explicit in the slide XML.
- Compile and conversion failures are counted separately from fidelity scores. `results.csv` contains per-deck errors and measurements; `summary.md` contains aggregate results.

The PDFs are rendered on this Windows machine with PowerPoint and Typst using its installed fonts. Different PowerPoint versions, Typst versions, operating systems, and font installations can change the pixel-level results.
