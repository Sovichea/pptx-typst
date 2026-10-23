# Slide composition recipes

These are narrative/visual recipes, not mandates to create every slide. Work at 960 × 540 pt with default 48 pt horizontal margins and an approximately 24–32 pt gutter. Use whole-number token values. If content cannot fit with projector-first typography, revise the story or split the slide.

## 1. Editorial cover

**Goal:** establish subject and a distinctive tone. Place a 40–52 pt statement in the left two-thirds, a short category kicker above it, and a strong image or geometric motif at right. Keep the audience/action/date in low-emphasis text. Avoid cluttered institutional logos; use only authorized marks.

Typst pattern: master background + layout image accent + slide-specific `PptxText` headline and supporting line.

## 2. One-message statement

**Goal:** land a central insight or transition. One sentence, 40–52 pt, with large negative space and a subtle line or small visual cue. Better than three bullets saying the same thing.

## 3. Two-column argument

**Goal:** juxtapose observation with implications, or problem with solution. Left: 360–420 pt text claim/description. Right: 420–480 pt diagram, image, chart or callout. Keep all baselines aligned. Use a colored vertical rule only if it clarifies grouping.

## 4. Evidence chart

**Goal:** show a measurable difference or trend. Use direct labels; title with the takeaway; one highlighted series, others quiet. State units and source. For an editable simple bar visualization, build static `PptxRect` bars + `PptxText` labels, with true-scaled heights/widths. Do not call this an editable native PowerPoint chart.

## 5. Three-step process

**Goal:** explain how something works. Use three evenly spaced stages with short nouns, brief verb phrases, and numbered circles or boxes connected by thin lines. Highlight only the critical transfer or bottleneck. Do not use arrows unless they communicate direction.

## 6. Architecture diagram

**Goal:** show relationships and interfaces. Organize into 2–4 horizontal or vertical tiers; make nodes large enough for 18–22 pt text; label interfaces; distinguish control/data/physical flow by position or line treatment. Split detailed protocol diagrams into overview + subsystem slides. Use native shapes for editable blocks; SVG for intricate technical schematics only when acceptable.

## 7. Before/after comparison

**Goal:** demonstrate an observable change. Mirror two visual fields with matched scale and perspective. Use concise labels; emphasize a factual delta. Avoid misleading different chart axes or image crops. Provide a source when showing genuine field outcomes.

## 8. Four-card metric view

**Goal:** communicate a short scorecard. Large numbers (32–44 pt), concise metric names (18–22 pt), small definitions/sources. Keep baseline/target distinctions explicit. Cards are native rectangles and editable text. Avoid displaying invented values in a production presentation.

## 9. Timeline / roadmap

**Goal:** clarify sequence, duration, dependencies, and decisions. Use horizontally aligned milestones for 3–5 phases; each one has date/period, action, and outcome. If dates are uncertain, label them as estimates. For dense schedules, add a second slide rather than using 10 pt type.

## 10. Quote / customer voice

**Goal:** add qualitative evidence. Large meaningful quote with clear source and permission; avoid stock testimonial wording. Keep attribution visible but secondary. Do not fabricate quotes.

## 11. Technical detail / equation

**Goal:** teach a concept or validate a system. Claim heading, clean diagram, then 1–2 key equations with variables defined. Use a dedicated detail slide for derivation. If relying on Typst mathematical typesetting, verify whether its expression survives the bounded PPTX reverse exporter. For PPTX delivery, consider static vector rendering of complex math with noneditable content disclosed.

## 12. Conclusion / action

**Goal:** convert content into a decision. Summarize at most three implications, state the next action and owner or timing when known, and repeat the core thesis. End visually; do not rely on a generic "Thank you" slide unless appropriate.

## Sequencing and pacing

Example 10-slide decision deck:

1. Point-of-view cover
2. Problem/why now
3. Evidence of need
4. System or solution overview
5. How it works
6. Demonstrated result
7. Options and tradeoffs
8. Roadmap
9. Risks and mitigations
10. Recommendation and next action

Example 8-slide technical lecture:

1. Context and learning goal
2. Mental model
3. Architecture
4. Mechanism
5. Diagram with annotations
6. Worked example
7. Practical limitations
8. Recap/checkpoint

These sequences are starting points. Avoid repetitive layouts. If a chart, image or diagram does not meaningfully support a claim, remove it.

## Visual distinction between slides

- Alternate a high-impact statement slide with an evidence-heavy slide.
- Use occasional full-bleed visual with text-safe panels when the conversion path supports it.
- Change the dominant content geometry, not the brand identity, to maintain rhythm.
- Keep recurring elements like page numbering, section tags, and confidentiality text in master/layout where supported.
- Preserve true whitespace on technical slides. Adding more objects is not the same as explaining more.
