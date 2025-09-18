# Repository Guidelines

## Project Structure & Module Organization
LaTeX sources live in the repository root. `__petrovCV__.tex` is the comprehensive CV; `__petrovCV__short.tex`, `__petrovCV__brief_2page.tex`, and `__petrovCV__brief_2page_one_more.tex` provide condensed views, while `__petrov__publ.tex` renders the standalone publication list. PDFs with matching stems stay versioned for downstream sharing. The short CV omits extensive talks and service history, so add longform details to the full CV first and curate the brief variants afterward.

## Build, Test, and Development Commands
All builds run locally through `latexmk` via the top-level `Makefile`; do not offload PDF generation to hosted agents. Key targets:
- `make` / `make all`: fetch `TEX_*.tex` publication lists, build every PDF, clean auxiliaries.
- `make cv-full`, `make cv-short`, `make cv-brief`, `make cv-brief-one-more`, `make publications`: rebuild a single artefact while refreshing data.
- `make clean`, `make clean-all`, `make rebuild`: remove intermediates, remove PDFs, or chain a clean + full build.
- `make build-and-commit`, `make deploy`: regenerate, stage, and optionally commit/push outputs.
Run download-dependent targets only when network access is available; cache lists for offline runs.

## Coding Style & Naming Conventions
Maintain the existing preamble order (packages, `\def` macros, geometry) and keep paragraphs unindented. Lists use the `[2025:]` label style inside `\begin{itemize}` or `\begin{etaremune}`; terminate entries with periods. Talks remain in the longtable format, and teaching, service, and organisation sections stay reverse chronological. Event entries follow:
```
\item[2025: ] \href{URL}{Event title}, Month 2025, City, Country.
```
Group related helper macros together instead of duplicating literals.

## Testing Guidelines
Treat a clean LaTeX build as the integration test. Run the relevant `make` target after edits, watch for missing-reference warnings, and review PDFs for layout regressions. If publication inputs are modified, confirm the fetched `TEX_*.tex` files are current and exclude them from commits unless intentionally snapshotting.

## Commit & Pull Request Guidelines
Recent commits use concise messages such as `__petrovCV__.tex: add 2025 conference entries`; follow the "scope: imperative action" pattern. Before submitting a PR, rerun the pertinent `make` target (or `make build-and-commit`), summarise the narrative change, list which PDFs were regenerated, link issues, and attach screenshots only when layout changes need quick review.

## External Data & Security Notes
Publication lists come from `https://lpetrov.cc/research/`. Validate replacements locally, prefer HTTPS, and avoid committing fetched data containing personal details without approval. Keep credentials and tokens out of LaTeX sources and comments; manage sensitive information through local environment settings.
