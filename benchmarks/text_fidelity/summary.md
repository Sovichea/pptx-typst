# PPTX to Typst text fidelity benchmark

- Corpus: [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K), sampled deterministically; all selected records are CC BY 4.0.
- Sample size: 100 downloaded decks; measurements recorded for 100.
- Successful conversions and renders: 74; failures: 26.
- Source slides rendered: 1631.
- Source PDF words: 81,029.
- Weighted visible-word recall: 93.6%.
- Mean per-deck visible-word recall: 93.9%; median 95.9%.
- Mean per-deck text-frame edge F1 (1 px tolerance): 44.2%; median 44.6%.
- Mean per-deck absolute PDF font-size difference: 0.80 pt; median 0.27 pt.
- Explicitly named text uses locally available fonts for 73.2% of characters across the sample; mean per-deck share 58.0%.
- Mean share of text inheriting a font from its theme/layout: 64.3%; inherited families are not counted as confirmed installed fonts.
- Text-frame edge F1 compares rendered edge pixels inside source text-frame rectangles, with a one-pixel tolerance. It includes frame backgrounds and outlines, and is a coarse visual proxy for text layout, wrapping, size and font-shape similarity rather than a pure glyph mask.
- Tables contribute to PDF word metrics but are excluded from the text-frame edge score; grouped text-frame bounds can also be approximate.
- Word recall compares text extracted from PowerPoint-exported PDFs and Typst PDFs. Differences in reading order are ignored; repeated or missing visible words lower the score.
- Font-size difference compares character-weighted average font sizes extracted from the two PDFs. These aggregate metrics are affected by unsupported objects and font substitution.
- Source attribution, license, DOI and download checksums are in [manifest.json](manifest.json). Per-deck measurements are in [results.csv](results.csv). PPTX files are in the ignored local `data/input/` directory.

## Failure categories

- Generated Typst syntax/structure error: 17 deck(s). Details are in `results.csv`.
- Typst rejected media format: 7 deck(s). Details are in `results.csv`.
- Unresolved Typst label/reference: 1 deck(s). Details are in `results.csv`.
- Unescaped text interpreted as Typst markup: 1 deck(s). Details are in `results.csv`.
