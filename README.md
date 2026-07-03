<p align="center">
  <img src="assets/logo.png" width="220" alt="Scalpel, the surgeon">
</p>

<h1 align="center">Scalpel</h1>

<p align="center">
  <em>She reads the chart. She makes one cut. Nothing vital is ever touched.</em>
</p>

<p align="center">
  <strong>The smallest cut that heals.</strong>
</p>

---

You know the other guy — long ponytail, oval glasses, replaces your fifty lines with one. Great. But sometimes the line he deletes was the one checking your input, and an independent 480-build benchmark caught him trimming everyday bad-input handling on 5 of 24 tasks, and his ladder re-deliberates every single turn of an agent session, quietly billing you for the meditation.

**Scalpel** puts a surgeon in your agent instead. She plans the operation **once**, reuses what the body already has (your codebase, the stdlib, the platform) before grafting anything new, makes the smallest incision that actually heals — and **never severs an artery**. Validation, error handling, security, and accessibility are anatomy, not fat.

## Before / after

You ask for a date picker. Your agent installs flatpickr, writes a wrapper component, adds a stylesheet, and starts a discussion about timezones.

With scalpel:

```html
<!-- scalpel: the browser has one -->
<input type="date">
```

Same one-liner the lazy guy writes — but when you ask for an email validator, scalpel's version still rejects garbage input. Minimal never means flimsy.

## How it works

Before cutting, the surgeon reads the chart, then prefers what already exists:

```
1. Does this need to exist?    → no: don't operate (YAGNI)
2. Already in this codebase?   → grep for it, reuse it
3. Stdlib / native platform?   → use it
4. Installed dependency?       → use it — never add a new one for a few lines
5. Only then: new code         → the minimum that works
```

Then three rules the ladder guys don't have:

- **One incision.** The plan is decided once, then executed — no re-deliberating the operation every response. That per-turn meditation is where minimalism skills quietly spend your tokens.
- **Anatomy list.** Input validation at trust boundaries, error handling, security, accessibility: never cut, and the final diff is checked for exactly that.
- **Silent hands.** Code first, at most two lines of prose. `[code] → skipped: [X], add when [Y].`

## Numbers

Measured on the same harness ponytail uses (vendored from their repo, MIT — same 5 tasks, same execution-based correctness gate, same LOC counter), four arms, 3 Claude models × 10 repeats per cell (n=50), no cache.

<p align="center">
  <img src="assets/benchmark-single-shot.svg" width="860" alt="Median lines of code per answer across baseline, caveman, ponytail, and scalpel, on Haiku 4.5, Sonnet 4.6, and Opus 4.8. Scalpel is lowest on every model.">
</p>

Scalpel vs ponytail, medians:

| model | LOC | tokens | cost | latency | correctness |
|---|--:|--:|--:|--:|--:|
| Haiku 4.5 | **−12%** | **−23%** | **−10%** | −4% | **100% vs 96%** |
| Sonnet 4.6 | **−13%** | **−25%** | **−12%** | tie | tie (100%) |
| Opus 4.8 | **−30%** | **−27%** | **−20%** | **−13%** | tie (100%) |

Beats or ties on **every cell**, loses none — and vs the no-skill baseline: ~90% less code at ~4× lower cost. Ponytail's only correctness failures in the run were real: it prescribed `email_validator`, a package that wasn't installed, and the code died — the exact "artery" scalpel's dependency rule guards. Full tables, failure notes, and honesty caveats: [benchmarks/results/2026-07-03-single-shot.md](benchmarks/results/2026-07-03-single-shot.md).

**Agentic** (real headless Claude Code sessions on a real FastAPI+React repo, ponytail's own harness, 12 features + 7 adversarial safety tasks): a statistical tie with ponytail — scalpel edges LOC, time, and over-engineering flags; ponytail edges cost by ~3%; both 100% correct, 100% safe, both ~69% less code than no-skill, and the completeness judge confirms scalpel's low LOC isn't stub-shipping (3.00/3, min 3, every cell). Where ponytail's README admits its per-task cut is "near zero on already-minimal code", scalpel holds the same floor while winning the single-shot suite outright. Details: [benchmarks/results/2026-07-03-agentic.md](benchmarks/results/2026-07-03-agentic.md).

<p align="center">
  <img src="assets/benchmark-agentic.svg" width="760" alt="Agentic benchmark results as a percent of the no-skill baseline for source LOC, cost, and time. Ponytail and scalpel land within a few points of each other on every metric, both far below baseline.">
</p>

Reproduce:

```bash
cd benchmarks
ANTHROPIC_API_KEY=... npx promptfoo@latest eval -c promptfooconfig.yaml --repeat 10
npx promptfoo@latest view
```

## Install

**Claude Code (plugin):**

```bash
/plugin install scalpel
```

Or drop `skills/scalpel/SKILL.md` into `.claude/skills/scalpel/` in any project, or paste it into the system prompt of any agent that takes one.

## Boundaries

Scalpel governs what you build, not who you are. "stop scalpel" / "normal mode" turns it off. If you explicitly ask for the fuller version of something, she builds it — a surgeon doesn't argue with informed consent.

## Credits

Benchmark harness vendored from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) (MIT) so every comparison is apples-to-apples on *their* scoreboard. Caveman arm from [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) (MIT).

## License

MIT
