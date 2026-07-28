# Learning R for Management Research

**Release 0.2.0 — validated clean-deployment edition**

A clear, applied, and beginner-friendly introduction to **R and RStudio for
quantitative management research**.

This repository contains the complete teaching package:

- concise online lessons;
- editable R scripts;
- synthetic, documented management datasets;
- exercises and worked solutions;
- instructor lesson plans;
- Quarto slide decks;
- a reproducible GitHub Pages website;
- a research-informed design rationale.

## Audience

The materials are designed for students who know basic statistics but have
little or no previous programming experience. The emphasis is not on becoming
a software developer. It is on learning how to move from a research question
to an analysis, interpretation, and reproducible report.

## Course pathway

1. First steps in R and RStudio
2. Data cleaning, description, and visualization
3. Correlations, confidence intervals, and t-tests
4. Reliability and scale construction
5. Exploratory factor analysis and chi-square tests
6. Linear regression and diagnostics
7. Moderation and mediation
8. Logistic regression
9. Replication and reporting

## Start in RStudio

1. Download or clone the repository.
2. Open `r-for-management-research.Rproj`.
3. Run:

```r
source("R/install_packages.R")
source("R/check_setup.R")
```

4. Open a file in `code/`, beginning with `code/01-first-steps.R`.

## Build the website locally

Install [Quarto](https://quarto.org/) and run:

```bash
quarto preview
```

The website is configured for automatic publication through GitHub Pages
Actions in `.github/workflows/publish.yml`. No `gh-pages` branch is required.
See [DEPLOYMENT.md](DEPLOYMENT.md) for the complete repository and website
connection process.

## Repository structure

```text
.
├── modules/          # Full lesson chapters
├── code/             # Clean R scripts for students
├── exercises/        # Practice tasks
├── solutions/        # Worked solutions
├── data/             # Teaching datasets and dictionary
├── data-raw/         # Reproducible data-generation scripts
├── slides/           # Quarto RevealJS slide decks
├── instructor/       # Teaching plans and assessment material
├── templates/        # Reproducible report template
├── references/       # Benchmark and source notes
└── website-integration/ # Personal-site page and connection instructions
```

## Package contents

See [MANIFEST.md](MANIFEST.md) for a complete inventory and
[references/resource-benchmark.md](references/resource-benchmark.md) for the
research-informed design rationale.

## Data statement

The main datasets are **synthetic teaching datasets**. They were generated to
produce realistic research patterns without representing real employees,
customers, hotels, organizations, or Luiss students. This makes the materials
safe to share publicly and allows every lesson to be reproduced.

## Attribution and institutional status

Developed and maintained by **Maziyar Bahrami**.

The repository supports teaching and independent learning. It is not an
official Luiss University publication unless explicitly designated as such by
the university.

## Licence

- Teaching text, exercises, and slides: [CC BY 4.0](LICENSE-CONTENT.md)
- R code: [MIT](LICENSE-CODE)
