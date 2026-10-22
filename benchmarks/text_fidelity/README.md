# PPTX to Typst fidelity benchmark

This benchmark samples 100 `.pptx` files from [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K). Every selected record declares CC BY 4.0. `manifest.json` records the title, creator, DOI, source URL, license, expected size, and checksum for each file. The source presentations are downloaded to the ignored local directory `data/input/` and are not committed to this repository.

The frozen sample was selected with seed `20261021` from CC BY 4.0 PPTX records whose titles contain ASCII letters and whose files are between 100 KB and 40 MB. The files total about 948 MB. This is a broad sample, not a hand-picked set of known-supported decks; text reports both usable conversions and decks that fail to convert or compile.

## Run it again

On Windows, install Typst and desktop PowerPoint, then install the benchmark-only Python packages:

```powershell
python -m pip install pyarrow pywin32 PyMuPDF
python tools/install_benchmark_fonts.py
python tools/download_text_benchmark.py
python tools/run_text_fidelity_benchmark.py
```

The font installer downloads matching families only when the Google Fonts upstream includes a per-family SIL Open Font License, then installs them for the current Windows user. Font binaries and the machine-specific install report remain local and ignored. The downloader verifies each PPTX checksum and writes attribution details to `manifest.json`. The runner converts each file to Typst, compiles the result, exports the original through PowerPoint to PDF, and compares the PDFs. Intermediate projects and PDFs are removed after each deck. Use `--start N --end M` to run a manifest slice; completed rows are combined into `results.csv`.

For every successfully rendered deck, the runner also saves a side-by-side contact sheet in the ignored local `visual_comparisons/` directory. Each sheet shows the PowerPoint render on the left and Typst on the right for up to three font-supported slides with the lowest per-slide text fidelity. `visual_comparisons/index.md` lists the selected slide numbers and scores for quick review. Decks with fewer than two scoreable slides show the available slides only.

## Scores

- **Layout fidelity** compares full-slide rendered edges, foreground colors, and slide background after masking extracted text glyph regions in both PDFs. Text ink does not contribute to this score; images, shapes, fills, lines, charts, table geometry, and text-box fills/outlines remain part of the visual comparison.
- **Text fidelity** is the equal-weight mean of text ink edge F1 and text-start position accuracy. Ink F1 compares rendered glyph edges with a one-pixel tolerance. Start-position accuracy is based on matched rendered text blocks and falls linearly to zero at a 24 pt displacement; mean start-position error is also recorded.
- A slide contributes to text and full-slide scores only when every resolved source font family used on that slide is available to Typst. Major/minor theme fonts and inherited text styles are resolved and checked. Unsupported-font slides remain in layout measurements, with extracted text pixels masked, but are skipped in text metrics and full-slide scores.
- **Full-slide fidelity** is the equal-weight mean of layout and text fidelity on font-supported slides. A font-supported slide without text contributes its layout score alone.
- **Text wrap line-count match** is recorded as a diagnostic only. It is excluded from text and full-slide scores because PowerPoint and Typst may wrap differently.
- **Visible-word recall and precision**, **mean font-size difference**, and **available-font share** remain supplemental diagnostics, not components of the three fidelity scores.
- Score values are on a 0–1 scale. Per-deck scores and errors are in `results.csv`; aggregate means and medians are in `summary.md`.

Text boxes for masking and rendered glyph measurements come from PDF text extraction, so PDF text extraction issues can affect pixel metrics. PDF text blocks are matched by normalized text to compare starting positions; block matching and pixel thresholds are approximate corpus-level measures rather than a claim of exact visual equivalence.

The original 100-deck scores above are retained for historical comparison. Their greedy text-block matcher uses a text-similarity threshold but does not constrain matches by slide position; repeated titles, merged PDF blocks, and fragmented PDF text can therefore create misleading start-position errors. For targeted investigation, `tools/analyze_text_placement.py` reports three separate views: (1) structural PPTX-to-manifest text-object geometry joined by slide and shape ID, with content preservation; (2) rendered first-glyph positions, baselines, text bounds, line pitches, and frame overflow, assigned to source text objects using both text and spatial evidence, with ambiguous and unassigned spans counted; and (3) typographic diagnostics such as font availability, size differences, ink similarity, and wrap count. It does not combine those diagnostic measures into a new score. Run it on Windows with PowerPoint and Typst installed, for example:

```powershell
python tools/analyze_text_placement.py path\to\sample.pptx
```

The diagnostic is deliberately run on a small representative sample. The 22 corpus media-format compilation failures remain separate from text-placement measurements.

The PDFs are rendered on this Windows machine with PowerPoint and Typst using its installed fonts. Different PowerPoint versions, Typst versions, operating systems, and font installations can change the pixel-level results.
