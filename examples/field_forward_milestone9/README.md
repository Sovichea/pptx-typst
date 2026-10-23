# FIELD / FORWARD — Milestone 9 semantic layout example

This example rebuilds the corrected eight-slide handoff deck while lowering slides 4–7 from semantic component JSON into the converter-supported static Typst subset. The handoff source is retained under `reference/before/` for comparison. Rebuild operations replace only the targeted groups on slides 4–7.

## Rebuild

From the repository root in PowerShell:

```powershell
$componentDir = "examples/field_forward_milestone9/components"
Get-ChildItem $componentDir -Filter "slide-?.json" | Sort-Object Name | ForEach-Object {
  $name = $_.BaseName
  python .agents/skills/pptx-typst-design/scripts/lower_components.py $_.FullName `
    --output "$componentDir/$name.typ" `
    --manifest-output "$componentDir/$name.qa.json"
}
python examples/field_forward_milestone9/rebuild.py
typst compile --ignore-system-fonts --font-path examples/field_forward_milestone9/fonts `
  examples/field_forward_milestone9/main.typ examples/field_forward_milestone9/preview.pdf
typst-to-pptx examples/field_forward_milestone9/main.typ `
  --output examples/field_forward_milestone9/exports/field_forward_milestone9.pptx
python .agents/skills/pptx-typst-design/scripts/inspect_deck.py `
  --pdf examples/field_forward_milestone9/preview.pdf `
  --pptx examples/field_forward_milestone9/exports/field_forward_milestone9.pptx `
  --report examples/field_forward_milestone9/exports/conversion_report.json `
  --components examples/field_forward_milestone9/components/all.qa.json `
  --expect-pages 8 --out examples/field_forward_milestone9/qa/final
```

The bundled Inter v4.0 fonts are from the official Inter project and distributed under the SIL Open Font License; see [`fonts/LICENSE.txt`](fonts/LICENSE.txt). The font files are used to render the Typst preview and are not embedded in the exported PowerPoint. Install them on the viewing system if a consistent Office rendering is needed.

## Validation status

The Typst output and semantic component alignment have been visually checked against the handoff PDF. Microsoft PowerPoint rendered the exported PPTX to [`exports/field_forward_milestone9-powerpoint.pdf`](exports/field_forward_milestone9-powerpoint.pdf), and the eight-slide comparison is under [`qa/powerpoint`](qa/powerpoint/). Major geometry and artwork are preserved without clipping. This PowerPoint environment substituted Calibri for Inter, causing measurable text ink-position differences; see the QA report for per-component measurements. The PPTX still contains editable native text and shapes. See [the Milestone 9 report](../../docs/milestone-9-semantic-layout.md).
