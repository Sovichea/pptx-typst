# Agent skills

This repository includes two complementary Agent Skills:

- `skills/pptx-typst`: import, edit and validate existing PowerPoint presentations through Typst.
- `skills/pptx-typst-design`: plan and create designed presentations using the supported static Typst IR, then inspect PDF and PPTX outputs.

Copy `.agents/skills/` into a project that discovers repository-local Agent Skills. The host tool controls discovery; the directory alone does not enable a skill.

The design skill includes:

- A five-slide static-IR example in `pptx-typst-design/examples/main.typ`.
- A semantic component JSON-to-IR lowerer in `pptx-typst-design/scripts/lower_components.py`.
- A visual QA utility in `pptx-typst-design/scripts/inspect_deck.py` for rendered pages, conversion reports, and declared component-label alignment.
- A compiled semantic-component example under `pptx-typst-design/examples/semantic-layout/`.

The lowerer emits explicit `PptxPlace`, native shape and `PptxTextFrame` declarations; it does not add dynamic macros to Typst. The component QA matches searchable PDF text against supplied component geometry. It reports wrapped or ambiguous labels as unavailable and cannot prove editability or all PowerPoint rendering behavior.

See the included skill references for installation, supported primitives, design workflow, visual QA, asset provenance, and limitations. `pptx-typst` supports a bounded static subset, not arbitrary PowerPoint or Typst programs.

License: Apache-2.0 for these skill materials. The repository license applies to the converter.
