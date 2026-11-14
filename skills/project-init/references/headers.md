# Header templates per language

Substitute: `{{PURPOSE}}` (one line), `{{DOC_REF}}` (e.g. `docs/technical/api.md#auth`), `{{AUTHOR}}`, `{{ISO_DATE}}`.

Header goes **after** shebang/`<?php`/encoding-pragma lines, **before** everything else.

## Block comment `/** */` — JS, TS, JSX, TSX, Java, C, C++, C#, Go, Rust, Swift, Kotlin, Scala, PHP, CSS, SCSS, Groovy, Objective-C, Dart

```js
/**
 * {{PURPOSE}}
 * Docs: {{DOC_REF}}
 * Author: {{AUTHOR}}
 * Last-Updated: {{ISO_DATE}}
 */
```

## Line comment `//` — alternative for the same family (use block form unless the file already uses `//` headers)

```js
// {{PURPOSE}}
// Docs: {{DOC_REF}}
// Author: {{AUTHOR}}
// Last-Updated: {{ISO_DATE}}
```

## Hash `#` — Python, Ruby, Shell/Bash, Perl, R, YAML, TOML, PowerShell, Dockerfile, Makefile, .env, Nginx/conf

```python
# {{PURPOSE}}
# Docs: {{DOC_REF}}
# Author: {{AUTHOR}}
# Last-Updated: {{ISO_DATE}}
```

Python modules may *additionally* start a docstring after it — the header is still required; a docstring is not a substitute (it lacks Docs/Last-Updated fields).

## HTML/XML `<!-- -->` — .html, .xml, .svg, .vue templates, .md (alternative)

```html
<!--
  {{PURPOSE}}
  Docs: {{DOC_REF}}
  Author: {{AUTHOR}}
  Last-Updated: {{ISO_DATE}}
-->
```

## SQL / Lua / Haskell / Elm `--`

```sql
-- {{PURPOSE}}
-- Docs: {{DOC_REF}}
-- Author: {{AUTHOR}}
-- Last-Updated: {{ISO_DATE}}
```

## Semicolon `;` / `;;` — Lisp, Clojure, Assembly, .ini/.cfg

```lisp
;; {{PURPOSE}}
;; Docs: {{DOC_REF}}
;; Author: {{AUTHOR}}
;; Last-Updated: {{ISO_DATE}}
```

## Percent `%` — LaTeX, MATLAB/Octave, Erlang, Prolog

```latex
% {{PURPOSE}}
% Docs: {{DOC_REF}}
% Author: {{AUTHOR}}
% Last-Updated: {{ISO_DATE}}
```

## Pascal / OCaml / F# `(* *)`

```ocaml
(*
 * {{PURPOSE}}
 * Docs: {{DOC_REF}}
 * Author: {{AUTHOR}}
 * Last-Updated: {{ISO_DATE}}
*)
```

## Batch / VB

```bat
REM {{PURPOSE}}
REM Docs: {{DOC_REF}}
REM Author: {{AUTHOR}}
REM Last-Updated: {{ISO_DATE}}
```

```vb
' {{PURPOSE}}
' Docs: {{DOC_REF}}
' Author: {{AUTHOR}}
' Last-Updated: {{ISO_DATE}}
```

## Markdown & YAML frontmatter variant — *.md, *.markdown, *.yaml, *.yml

```yaml
---
doc: <doc name>
project: {{PROJECT_NAME}}
author: {{AUTHOR}}
last-updated: {{ISO_DATE}}
kb: docs/README.md
---
```

## Files that get NO header

`*.json` (strict), `*.lock`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml` (comments tolerated but regenerated — skip), `poetry.lock`, `Cargo.lock`, `composer.lock`, `Gemfile.lock`, `go.sum`, `*.min.*`, `*.map`, binaries, images, fonts, vendored/`third_party/` code, files marked `DO NOT EDIT` / `Code generated`. Document these in the folder's `README.md` contents table instead.
