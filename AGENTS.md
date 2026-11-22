# AGENTS.md

## Purpose
learnac.dev = **learn anti-cheat** (not "learn C"). A free, blue-team learning platform for anti-cheat development,
in the style of boot.dev and TryHackMe: read a lesson, do a lab, get checked. Primary user: a student or
entry-level engineer who wants into anti-cheat work and has no on-ramp.

## Layout
- `web/`: Astro site on Cloudflare Pages. Renders lessons from `../content` (see `web/src/content.config.ts`).
- `api/`: Cloudflare Worker + D1 (users, progress, flag checks). Migrations in `api/migrations/`.
- `cli/`: Go `learnac` CLI that verifies local labs and submits proof.
- `content/`: lessons as MDX, frontmatter `title`, `track`, `order`. Licensed CC BY-SA 4.0.

The pnpm workspace covers `web` and `api`; `cli` is a separate Go module.

## Commands
- Site dev server: `pnpm --filter web dev`
- Worker tests: `pnpm --filter api test` (vitest + workers pool)
- CLI: `cd cli && go run .`

## How labs are checked
- Concepts: in-browser quiz.
- Detector-writing labs: Python in the browser (Pyodide) against hidden test data.
- Find-the-cheater labs: flag submission, hashed in D1.
- Local labs (game servers, VMs, hardware): the `learnac` CLI.

Student code never runs on our servers.

## Conventions
- **Learning mode is on.** The maintainer writes the code. Agents provide stubs, signatures, checklists and
  reviews, not full implementations, unless asked.
- **Defensive framing.** Cheats are studied only to build defenses. No working cheats against maintained games,
  no evasion walkthroughs against shipped anti-cheats, no hosting or linking cheat tools. Lab targets are
  open-source games, past builds, or bare graybox projects. See `web/src/pages/policy.mdx`.
- Third-party course material under non-commercial licenses (e.g. CC BY-NC) is linked, never copied into
  `content/`.
- Public prose is written by the maintainer.

## Licenses
Code: Apache-2.0 (`LICENSE`). Content: CC BY-SA 4.0 (`content/LICENSE`).

## Private notes
Planning notes live in `.context/` (gitignored, not in this repo). If it exists, read
`.context/project-brief.md` before planning work.
