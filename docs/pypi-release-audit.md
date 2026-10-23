# PyPI 0.1.0 Release Audit

Audit date: 2026-10-23
Target: `pptx-typst` 0.1.0

## Decision

Package and starter-workflow checks passed locally. GitHub Actions run [39932560441](https://github.com/Sovichea/pptx-typst/actions/runs/39932560441) passed all 12 Windows, Linux, and macOS x Python 3.10-3.13 jobs on commit `c6e4b3b`, including the added font-command smoke check.

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
| Cross-platform CI | GitHub Actions run 39932560441 passed all 12 OS/Python matrix jobs on commit `c6e4b3b`. |
| Publication actions | No PyPI upload, release tag, or GitHub release was created. |

The sdist includes documentation screenshots under `docs/images/`, including the example comparison images. It does not include the full converted example project directories. The wheel contains runtime package files only.

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

## Publication procedure

1. Push/finalize the release commit and confirm the full Windows/Linux/macOS × Python 3.10–3.13 CI matrix is green.
2. Rebuild `dist/`, run `python -m twine check --strict dist/*`, repeat clean installation checks, and regenerate SHA-256 hashes.
3. Recheck that `pptx-typst` and version `0.1.0` remain unpublished on PyPI.
4. Publish only after a separate explicit authorization using `python -m twine upload dist/pptx_typst-0.1.0-py3-none-any.whl dist/pptx_typst-0.1.0.tar.gz`.
5. Create the GitHub release separately after verifying the uploaded artifacts and release notes.
