# PyPI 0.1.0 Release Audit

Audit date: 2026-10-23
Target: `pptx-typst` 0.1.0

## Decision

**Publication is blocked pending confirmation of redistribution rights for the template-derived example decks and comparison images.** Their rights were not verified in this audit, so no conclusion is made that the files are freely redistributable. The decks and images remain in the repository; this audit did not remove or replace them. Before publishing, obtain evidence that redistribution is allowed or make a separately authorized decision about the affected public materials.

All package and starter-workflow checks listed below passed locally. The cross-platform run for the added font-command smoke check must pass on the final commit before publication.

## Verified

| Check | Result |
|---|---|
| Package metadata | `pptx-typst`, version `0.1.0`, Python `>=3.10,<3.14`; Apache-2.0 metadata and root `LICENSE` agree. |
| Runtime dependencies and resources | Declared Python dependencies match runtime imports reviewed for this audit. The wheel contains the package modules, Typst templates, starter SVGs, metafile helper, and license. |
| Console scripts | All five entry points are registered: `pptx-typst`, `pptx-to-typst`, `typst-to-pptx`, `pptx-typst-validate`, and `pptx-typst-fonts`. |
| Build and metadata validation | `python -m build` produced the expected wheel and sdist; `python -m twine check --strict dist/*` passed. |
| Local tests | `python -m pytest -q`: 78 passed. |
| Clean wheel workflow | Installed the final wheel in a fresh Python 3.10 virtual environment outside the checkout. `pip check`, `pptx-typst-fonts --help`, and a synthetic PPTX-to-Typst conversion followed by Typst compilation passed. |
| Clean sdist workflows | Installed the final sdist in fresh Python 3.10 and 3.12 virtual environments outside the checkout. `pip check`, all five CLI help commands, `pptx-typst init`, Typst compilation, and editable PPTX export passed. |
| README | Rendered with the Markdown renderer; the five comparison images resolved successfully (HTTP 200), and repository links use absolute GitHub URLs. |
| Package name/version | PyPI JSON endpoints for `pptx-typst` and `pptx-typst/0.1.0` returned 404 on the audit date. Recheck immediately before publication. |
| Archive path scan | No developer-specific absolute Windows paths or private benchmark source locations were found in files in either archive. |
| Publication actions | No PyPI upload, release tag, or GitHub release was created. |

The sdist includes documentation screenshots under `docs/images/`, including the example comparison images. It does not include the full converted example project directories. The wheel contains runtime package files only.

## Blocker: redistribution rights

The repository includes template-derived presentation examples and comparison screenshots. Their source-template, photograph, illustration, and other third-party asset licenses were not independently established here. Microsoft notes that Office content may be owned by third parties and that Microsoft cannot grant rights to third-party content in its [copyright permissions guidance](https://www.microsoft.com/en-us/legal/intellectualproperty/copyright/permissions). That guidance does not determine the status of any particular asset in this repository.

The README discloses that licensing status is unconfirmed. Keep the example files in place unless their owner confirms rights or the repository owner separately directs a removal or replacement. This is a release gate because the requested release audit requires rights to be confirmed for redistributed material; it is not a finding that the materials are infringing.

## Non-blocking or pending

- **Final cross-platform CI:** the existing matrix covers Windows, Linux, and macOS on Python 3.10–3.13. A `pptx-typst-fonts --help` smoke check was added. The last successful run predates that one-line addition; verify the new run on the final commit before release.
- **Platform media tools:** ordinary conversion and starter export were tested on Windows. Linux Inkscape and macOS environments are covered by CI for tests, but platform-specific EMF/WMF rendering paths were not independently exercised in this release audit. Missing external renderers should be disclosed as best-effort limitations.
- **External Typst dependency:** Typst is required to compile previews; it is not a Python dependency. Inkscape or platform-specific metafile tools may be used for some media fallbacks.

## Artifacts

Built distributions:

```text
dist/pptx_typst-0.1.0-py3-none-any.whl
dist/pptx_typst-0.1.0.tar.gz
```

SHA-256 checksums are generated from the final artifacts and reported in the release handoff. Rebuild after any source or documentation change and regenerate them before publication.

## Publication procedure after blockers clear

1. Confirm redistribution rights for the included third-party materials, or obtain a separate explicit decision to change those materials.
2. Push/finalize the release commit and confirm the full Windows/Linux/macOS × Python 3.10–3.13 CI matrix is green.
3. Rebuild `dist/`, run `python -m twine check --strict dist/*`, repeat clean installation checks, and regenerate SHA-256 hashes.
4. Recheck that `pptx-typst` and version `0.1.0` remain unpublished on PyPI.
5. Publish only after a separate explicit authorization using `python -m twine upload dist/pptx_typst-0.1.0-py3-none-any.whl dist/pptx_typst-0.1.0.tar.gz`.
6. Create the GitHub release separately after verifying the uploaded artifacts and release notes.
