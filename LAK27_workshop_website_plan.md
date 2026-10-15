---
title: "LAK 2027 Workshop Website Plan"
type: planning-document
project: "[[Workshops/Problem Statements Workshop/Problem Statements Workshop]]"
event: "[[Conferences/LAK/LAK27/LAK 2027]]"
status: draft
created: 2026-10-15
tags:
  - website
  - learninganalytics
---

# LAK 2027 Workshop Website Plan

Planning document for the participant-facing website of the accepted LAK 2027 workshop "A Dataset for Studying the History of Learning Analytics: A Workshop Launching the LAK and JLA Archive". This document captures the purpose, content, and design decisions for a one-page site built with Jekyll and the `jekyll-nagymaros` theme.

## Purpose

The site has three jobs that one page must serve simultaneously.

1. **Recruitment.** Convert a researcher scanning the LAK workshop list into a registrant. The decision happens in under a minute, so the top of the page must state what the dataset is, what participants will do with it, and who should attend.
2. **Orientation.** Prepare confirmed participants before the workshop. By the morning of the event, everyone should know the schedule, what to bring, what the dataset contains, and ideally have already articulated a question they want to ask of the field.
3. **Lifecycle.** Survive the event. The same URL becomes the natural home for the post-workshop synthesis and the dataset's permanent link. The page is designed as an artifact with a lifecycle, not a disposable flyer.

**Audience:** learning analytics meta-researchers; early-career researchers and PhD candidates seeking systematic positioning and gap-finding.

## Content Plan

Single scroll page with anchor navigation, ordered to match the participant journey.

| # | Section | Content |
|---|---------|---------|
| 1 | Hero | Title, one-sentence value proposition, fact strip (full day, LAK 2027 Brazil, date and room when known, organisers), registration CTA, anchor link to schedule |
| 2 | What is this workshop? | Three short paragraphs in plain participant-facing language: an open bibliographic dataset of all LAK and JLA publications, one completed analysis as demonstration, a day built around participants' questions rather than ours |
| 3 | The dataset | What is in it (primary sources, metadata, incoming and outgoing citations, manually extracted problem statements coded by question type), who maintains it (Centre for Change and Complexity in Learning, Adelaide University), the yearly update commitment. Full de-blinded attribution, since anonymity ended with acceptance |
| 4 | What we found | The exemplar analysis as a teaser: the field's questions concentrate on describing and relating phenomena, with limited attention to explanation and intervention. Persuasive function: the dataset answered our question, now it can answer yours |
| 5 | Who should come | Meta-researchers, ECRs, PhD candidates. Honest expectation-setting about technical prerequisites (pending open decision 2) |
| 6 | The day | Schedule mapping the five workshop blocks: rationale and prior findings, dataset walkthrough, small-group question forming, group formation and collaborative work, synthesis and commitments. Rough timings with breaks; exact times once the conference programme is final |
| 7 | Before you arrive | Checklist: laptop and charger, any account needed for dataset access, optional advance skim of the exemplar analysis, optional question submission |
| 8 | What you will leave with | Persistent dataset access, scoped research questions, collaborator connections, concrete routes to LAK or JLA submissions, the post-workshop synthesis |
| 9 | Practicalities and FAQ | Room, language (English), connectivity expectations, LAK code of conduct link, accessibility contact, dataset licence. FAQ covers: do I need to code, will the dataset remain available, can I attend remotely |
| 10 | Contact | Both organisers' email addresses |

### The pre-workshop question form

A short form (Google Form or equivalent) linked from the hero and the "Before you arrive" section, asking: what do you want to know about the field of learning analytics? This does three things:

- Primes participants so the small-group question-forming block starts warm rather than cold
- Gives the organisers a read on the room's interests before the day, which allows deliberate group seeding
- Signals the workshop's core premise, that the dataset exists to answer other people's questions, in the medium of the page itself

Low cost, high fit with the workshop design.

## Design Principles

- **Static and lightweight.** Jekyll static output hosted on GitHub Pages. No custom JavaScript; Bootstrap's baseline JS is acceptable but the site adds none of its own.
- **Accessibility as a stated commitment.** Semantic headings, sufficient contrast, responsive layout, graceful behaviour without JavaScript. A workshop about open research should not have an inaccessible page.
- **Restrained visual register.** One accent colour, generous whitespace, no decorative imagery. Possibly one figure from the exemplar analysis if licensing permits.
- **TBD discipline.** Unknown values (room, times, registration link, dataset DOI) are marked neutrally in the source so they are trivial to fill in later. Unfilled theme fields simply do not render, which supports this.
- **One page, one lifecycle.** The page is written so post-workshop additions (synthesis, DOI, outputs) append naturally rather than requiring a redesign.

## Jekyll Implementation

### Theme selection

**Selected theme: `piazzai/jekyll-nagymaros`**

Nagymaros is a Jekyll theme designed specifically for conferences, workshops, and meetings, which matches the artifact class exactly. It provides out of the box the pieces that would otherwise need hand-building:

- Landing page structure that maps onto the hero, description, and audience sections
- A programme component supporting single- or multi-day schedules with colour coding, covering the "The day" section with real structure rather than a markdown table
- Speaker and organiser presentation, covering the two organisers
- Bootstrap 5 underneath, so responsive behaviour and accessible base styling are handled
- Deployment on GitHub Pages via `remote_theme`

It is the lightest theme purpose-built for this case.

**Alternatives considered:**

| Theme | Assessment | When it would win |
|-------|-----------|-------------------|
| `DigitaleGesellschaft/jekyll-theme-conference` | Heavier: multi-day schedules, talk and speaker collections, room listings, live indications, offline PWA support. Actively maintained (activity as recent as April 2026) | Only if the page became a multi-page site managing full workshop logistics, which contradicts the one-page brief |
| `just-the-docs/just-the-docs` | Documentation theme with sidebar navigation and built-in search. Reads wrong as an event flyer | If the page is destined to become the dataset's permanent documentation home (release notes, yearly update announcements, synthesis as sub-pages) |
| GitHub Pages whitelisted themes (Cayman, Slate) | Zero-config deployment, generic single-column pages, hand-rolled schedule | If the simplest possible deployment path outweighs event-specific structure |

**Switch trigger:** if the dataset-home growth scenario is confirmed, migrate from nagymaros to Just the Docs. The markdown content migrates directly.

### Site structure

```text
lak27-workshop-site/
├── _config.yml
├── index.md                      # The one page, all sections
├── _data/
│   └── programme.yml             # Schedule: the five blocks with times and rooms
├── assets/
│   └── css/
│       └── custom.scss           # Accent colour and minor overrides
└── README.md                     # Repo-level notes: how to update, where things live
```

Exact front matter and data keys follow the nagymaros documentation; the structure above is the planning-level shape.

### Configuration sketch

```yaml
# _config.yml
remote_theme: piazzai/jekyll-nagymaros
plugins:
  - jekyll-remote-theme
title: A Dataset for Studying the History of Learning Analytics
description: Full-day workshop at LAK 2027 launching the LAK and JLA archive
# Theme-specific keys (venue, dates, programme, speakers) per nagymaros documentation
```

### Content mapping

| Plan section | Theme component |
|--------------|-----------------|
| Hero | Landing/announcement front matter and venue data |
| What is this workshop? / The dataset / What we found / Who should come | Markdown body of the landing page |
| The day | Programme data file, single-day schedule |
| Before you arrive / What you will leave with / Practicalities and FAQ / Contact | Markdown body plus footer/contact fields |
| Organisers | Speaker/organiser entries |

### Deployment

- Repository on GitHub (hosting location pending open decision 5)
- GitHub Pages builds Jekyll natively; `remote_theme` requires no GitHub Actions workflow
- Custom domain not anticipated; default `*.github.io` URL is sufficient unless the dataset home scenario changes the calculus

### Content inventory

Most of the page text can be adapted from existing vault material rather than written fresh:

- Abstract and section content from the camera-ready (`Workshops/Problem Statements Workshop/Problem Statements Workshop - Camera Ready.md`), rewritten from academic to participant-facing register
- Workshop structure (five blocks) and anticipated outcomes, already drafted in the proposal
- Target audience description, already drafted in the proposal
- De-blinded attribution (Centre for Change and Complexity in Learning at Adelaide University), already resolved in the camera-ready

## Launch Sequencing

1. Draft the page now with TBD placeholders
2. Publish when LAK announces acceptances and workshop registration opens; the page works hardest during the registration window
3. Fill in logistics as the conference programme finalises (room, times, registration link)
4. Add the dataset DOI once minted, ideally from launch rather than retrofitted (pending open decision 6)
5. Post-workshop: append the synthesis, DOI, and any outputs; the page becomes the workshop's citable record

## Open Decisions

1. **Dataset availability.** Is the dataset already public, or does the workshop constitute its launch? Assumed not yet public. If a repository already exists, section 3 should link it and the recruitment calculus changes
2. **Technical expectations.** Can participants work with the dataset at spreadsheet level, or does meaningful use require R or Python? Determines the FAQ answer and the wording of "Who should come"
3. **Registration mechanics.** Is workshop sign-up included in LAK registration, is there a separate cap, is remote participation possible? Shapes the hero CTA and FAQ
4. **Licence.** The dataset's licence must be stated explicitly on the page; it is a selling point
5. **Hosting home.** Personal GitHub account, CCCL organisational account, or the dataset repository itself
6. **Dataset DOI at launch.** Whether a Zenodo (or equivalent) DOI will exist by conference time
