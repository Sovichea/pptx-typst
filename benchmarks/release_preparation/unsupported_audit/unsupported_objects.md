# Unsupported object audit

- Presentations: 100
- Conversion failures: 0
- Unsupported object placements: 502
- Approximated or rasterized warning occurrences: 916

Visual significance is estimated from object area (at least 1% of slide area), text presence, a chart/table/SmartArt type, or a long connector. Objects without measurable bounds are marked unknown. Estimates are triage aids, not visual review.

| Source type | Occurrences | Decks | Slides | Significant estimate | Unknown |
|---|---:|---:|---:|---:|---:|
| chart | 3 | 3 | 3 | 3 | 0 |
| connector | 6 | 2 | 2 | 1 | 0 |
| placeholder:body | 48 | 14 | 41 | 40 | 0 |
| placeholder:center_title | 1 | 1 | 1 | 1 | 0 |
| placeholder:object | 73 | 20 | 71 | 73 | 0 |
| placeholder:picture | 23 | 4 | 23 | 23 | 0 |
| placeholder:slide_number | 11 | 1 | 11 | 0 | 11 |
| placeholder:subtitle | 2 | 2 | 2 | 2 | 0 |
| placeholder:title | 64 | 12 | 64 | 64 | 0 |
| shape | 271 | 50 | 132 | 123 | 0 |

## Documented fallbacks

| Source type | Occurrences | Decks | Slides | Issues |
|---|---:|---:|---:|---|
| connector | 29 | 5 | 11 | unsupported_line_marker |
| emf | 105 | 20 | 74 | legacy_vector_media_compatibility_fallback |
| image | 2 | 1 | 1 | approximate_group_transform |
| line | 2 | 1 | 2 | approximate_group_transform |
| ole_object | 20 | 6 | 16 | approximate_object |
| picture | 23 | 10 | 17 | unsupported_image_mask |
| placeholder:body | 140 | 23 | 85 | placeholder_layering_risk |
| placeholder:centered-title | 25 | 11 | 14 | placeholder_layering_risk |
| placeholder:date | 4 | 3 | 4 | placeholder_layering_risk |
| placeholder:footer | 5 | 5 | 5 | placeholder_layering_risk |
| placeholder:object | 169 | 28 | 116 | placeholder_layering_risk |
| placeholder:slide_number | 34 | 15 | 31 | placeholder_layering_risk |
| placeholder:subtitle | 17 | 12 | 12 | placeholder_layering_risk |
| placeholder:title | 275 | 51 | 231 | placeholder_layering_risk |
| smartart | 18 | 12 | 18 | smartart_materialized |
| vector_shape | 45 | 4 | 6 | approximate_group_transform |
| wmf | 3 | 3 | 3 | legacy_vector_media_compatibility_fallback |
