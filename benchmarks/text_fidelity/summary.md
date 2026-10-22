# PPTX to Typst fidelity benchmark

- Corpus: [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K), sampled deterministically; all selected records are CC BY 4.0.
- Sample size: 100 downloaded decks; measurements recorded for 100.
- Successful conversions and renders: 89; failures: 11.
- Source slides rendered: 1980.
- Source PDF words: 60,600.
- Weighted visible-word recall: 95.2%.
- Mean per-deck visible-word recall: 94.0%; median 97.3%.
- Layout fidelity (text glyph pixels masked; all rendered slides): 89.9% mean per deck; 93.3% median.
- Text metrics include 1,249 of 1,910 source-text slides with all used font families available; 661 slides were skipped for unsupported fonts.
- Text fidelity (font-supported slides only): 47.1% mean per deck; 48.0% median.
- Full-slide fidelity (font-supported slides only; equal-weight layout + text): 69.2% mean per deck; 69.6% median.
- Text ink edge F1: 42.8%; mean start-position accuracy: 53.0%; mean start-position error: 38.59 pt.
- Text wrap line-count match (diagnostic only; excluded from scores): 78.7%.
- Low text-fidelity comparison sheets: 75 deck(s), in `visual_comparisons/index.md`; each sheet shows up to three font-supported slides with the lowest per-slide text score.
- Mean per-deck absolute PDF font-size difference: 1.05 pt; median 0.39 pt.
- Resolved source font families are locally available for 83.2% of text characters across the sample; mean per-deck share 82.5%.
- Mean share of text run characters without a direct run-level font name (resolved through inherited styles/theme): 64.3%.
- Layout score compares full-slide edges, foreground colors, and background color after masking extracted text glyph regions in both PDFs. Text itself does not contribute to this score. Layout includes slides with unsupported fonts because their text is masked.
- A slide is eligible for text fidelity only when every resolved source font family used on that slide is present in Typst's installed-font list. Resolved major/minor theme fonts are checked too. Unsupported-font slides are excluded from text, word, font-size, wrap, and full-slide metrics.
- Text fidelity is the mean of a one-pixel-tolerant rendered ink-edge F1 and a text-start position score. Position score falls linearly to zero at a 24 pt displacement.
- Wrap line-count match is recorded as a diagnostic and is excluded from text and full-slide scores because the renderers wrap differently.
- Full-slide score is the equal-weight mean of layout and text fidelity on font-supported slides. If a supported slide has no extractable text, its full-slide score equals its layout score. Word recall and font-size difference remain supplemental diagnostics and use only font-supported slides.
- Pixel scores use PDF output rendered locally by PowerPoint and Typst. Grouped text spans may be imperfectly extracted from PDFs.
- Word recall compares text extracted from PowerPoint-exported and Typst PDFs. Differences in reading order are ignored; repeated or missing visible words lower the score.
- Font-size difference compares character-weighted average font sizes extracted from the two PDFs. These aggregate metrics are affected by unsupported objects and font substitution.
- Source attribution, license, DOI and download checksums are in [manifest.json](manifest.json). Per-deck measurements are in [results.csv](results.csv). PPTX files are in the ignored local `data/input/` directory.

## Failure categories

- Typst rejected media format: 11 deck(s). Details are in `results.csv`.
