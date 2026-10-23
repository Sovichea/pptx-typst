# Independent real-world validation

Run on 2026-10-23 using Windows, PowerPoint desktop, Typst 0.15.1, and the working-tree converter. These six open-licensed presentations were not part of the frozen 100-deck benchmark or the converter's development fixtures. The source files and PDFs were kept outside the repository; the source manifest records downloads and hashes in the release-preparation evidence folder.

All six presentations converted to Typst and compiled. Five PowerPoint PDF exports completed, with source pages deterministically aligned to the same original slide numbers; three slides per presentation were inspected side by side. The sixth deck (Hamburg course slides) converted and compiled to a 21-page Typst PDF, but PowerPoint returned an error while exporting its source PDF, so it has no visual score. This is a rendering-tool failure, not a converter failure.

| Presentation | License stated by source | Slides | Conversion and visual check | Comparison slides |
|---|---|---:|---|---|
| SERC, “OER PPT File” | CC BY-NC-SA 3.0 | 15 | Converted and compiled; all source pages aligned | 1, 8, 15 |
| UCL, “Open Science and Universities: managing the change” | CC Attribution (version not specified on record) | 32 | Converted and compiled; all source pages aligned | 1, 17, 32 |
| University of Cape Town, “Open Educational Resources” | CC BY 4.0 | 24 | Converted and compiled; all source pages aligned | 1, 13, 24 |
| University of Oslo, “NonNormalData” | CC BY-SA 4.0 | 36 | Converted and compiled; all source pages aligned; embedded chart preview fix rechecked on slide 19 | 1, 19, 36 |
| University of Maryland, “Open Access Presentation Template Slides” | CC BY-SA 3.0 US | 41 | Converted and compiled; all source pages aligned | 1, 21, 41 |
| Universität Hamburg, “Interdisziplinärer Grundkurs 1” | CC BY-SA 4.0 | 21 | Converted and compiled; PowerPoint source PDF export failed | — |

The visual comparisons showed recognizable composition, colors, image placement, and slide hierarchy across these academic, educational, and image-heavy decks. Typical remaining differences were text size, line wrapping, and paragraph spacing. In the Oslo deck, a large histogram was initially absent because its source was an embedded OLE object; its PPTX already contained a cached picture. The converter now uses that object-level preview, and the slide comparison confirms the chart artwork is present. The OLE data itself is not editable in Typst.

The University of Maryland slide 21 comparison revealed one significant known limitation: the source XML orders a body placeholder before two pictures, and the pictures cover its text in the PowerPoint PDF. The forward converter emits native placeholders as a separate layer after ordinary slide children, so “Gold OA on campus” and “Insert examples” appear over the pictures in Typst. The object order in source OOXML and both rendered slides confirm this layering cause. This remains a documented alpha limitation because preserving interleaved placeholder and ordinary-object z-order requires a broader change to the current slide representation.

The SERC project also completed an edit-and-compile check outside the source deck: changing “Open Educational Resources” to “Open Learning Resources” changed the PDF text, and changing a vector artwork width from 603.189pt to 590.189pt compiled successfully. This verifies that generated source remains practically editable for both text and placed artwork.

The comparison sheets are available in the local validation workspace at `%TEMP%\pptx-typst-independent-validation\results\`. They are not included in the repository because the source decks carry different attribution and share-alike terms. The focused corrected comparison is `uio-slide-19-ole-fix.png` in the same directory.

Source records and licenses:

- [SERC presentation and reuse terms](https://serc.carleton.edu/details/files/758191.html)
- [UCL presentation record](https://discovery.ucl.ac.uk/id/eprint/10052145/)
- [UCT presentation record](https://open.uct.ac.za/items/d6ac48cb-5016-4d29-bc8b-f623a1bcf17b/full)
- [UiO public-slides repository and CC BY-SA 4.0 terms](https://ocbe-uio.github.io/public-slides/)
- [University of Maryland presentation record and license](https://drum.lib.umd.edu/items/15a200fc-3613-4a71-8b01-f27b2df94bb9)
- [Hamburg course record and CC BY-SA 4.0 terms](https://zenodo.org/records/10630340)

This is a small usability sample, not a population-wide fidelity measurement. It does not change the frozen benchmark scores.
