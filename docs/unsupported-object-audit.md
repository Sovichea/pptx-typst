# Unsupported-object audit

The release-preparation audit converts the frozen 100-presentation corpus with the installed CLI and aggregates every `conversion_report.json`. The reproducible raw results are in [`benchmarks/release_preparation/unsupported_audit/unsupported_objects.json`](../benchmarks/release_preparation/unsupported_audit/unsupported_objects.json), with a compact category table in the adjacent Markdown report.

The audit separates unsupported objects from objects that were approximated or rasterized. Each record retains the source deck, slide, shape ID and name when available, original type, reason, fallback, bounds, and expected loss. Master and layout objects are attributed to their dependent slides through the asset manifest.

Visual significance is a triage estimate based on object area, text, object type, and connector extent. It is not a visual classifier. Objects with unresolved bounds are marked unknown, so the counts should guide review rather than imply equal impact.

The audit currently identifies three practically important limitations. Native chart objects remain unsupported. Some PowerPoint picture masks and non-orthogonal group transforms use approximations. Native placeholders can be emitted above later slide pictures because the current forward representation handles placeholders in a separate layer; the converter now reports this as `placeholder_layering_risk`, including the affected slide and source shape IDs. This known case can visibly change composition and should be reviewed in the generated report.

On the frozen corpus, the current warning-based pass found 502 unsupported warning placements across 100 decks, including 330 occurrences estimated as significant and 11 with unknown significance. It also recorded 916 approximation or rasterization warning occurrences; this includes one warning for each overlapping placeholder/picture pair, so it is not a unique-object count. The earlier stabilization report's 522 unsupported placements came from a different extraction pass and should not be compared as a measured change. The current audit completed all 100 conversions without a conversion failure.

Cached OLE preview images are preserved when present, while their embedded workbook or chart data remains non-editable. EMF/WMF derivatives are generated per platform when a supported renderer is available; original source media remains in the project assets. Unsupported media is retained in the assets and reported as omitted from Typst rendering.

Corpus source presentations are from the CC BY 4.0 Zenodo10K selection described in [`benchmarks/text_fidelity/manifest.json`](../benchmarks/text_fidelity/manifest.json). The audit does not add copies of those presentations.
