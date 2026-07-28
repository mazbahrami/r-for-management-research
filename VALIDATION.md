# Validation report

**Release:** 0.2.0
**Files checked:** 87
**Errors:** 0
**Warnings:** 0

## Completed checks

- Parsed _quarto.yml
- Confirmed project-root code execution
- Confirmed _site output directory
- Workflow contains actions/checkout@v6
- Workflow contains actions/configure-pages@v5
- Workflow contains actions/upload-pages-artifact@v4
- Workflow contains actions/deploy-pages@v4
- Workflow contains pages: write
- Workflow contains id-token: write
- Workflow contains quarto render
- No branch-based Quarto publishing
- Checked 37 Quarto files
- Checked local Markdown and Quarto links
- Checked 5 referenced CSV paths
- Checked employee_survey.csv shape (480, 26)
- Checked employee_replication.csv shape (360, 26)
- Checked training_experiment.csv shape (220, 5)
- Checked marketing_mix.csv shape (156, 8)
- Checked hotel_upgrades.csv shape (900, 11)
- Confirmed all four hotel loyalty categories
- Confirmed usable hotel outcome balance
- Confirmed employee variables are documented
- Confirmed lesson/script pair 1
- Confirmed lesson/script pair 2
- Confirmed lesson/script pair 3
- Confirmed lesson/script pair 4
- Confirmed lesson/script pair 5
- Confirmed lesson/script pair 6
- Confirmed lesson/script pair 7
- Confirmed lesson/script pair 8
- Confirmed lesson/script pair 9
- Confirmed complete-case mediation in modules/07-moderation-mediation.qmd
- Confirmed complete-case mediation in code/07-moderation-mediation.R
- Confirmed complete-case mediation in solutions/05-06-solutions.qmd
- Declared package tidyverse
- Declared package janitor
- Declared package psych
- Declared package broom
- Declared package car
- Declared package performance
- Declared package interactions
- Declared package mediation
- Declared package effectsize
- Declared package scales
- Declared package downlit
- Declared package xml2
- Confirmed workload-burnout teaching pattern
- Confirmed training-group teaching pattern
- Confirmed diagnostic week 121

## Errors

- None detected.

## Warnings

- None detected.

## Runtime boundary

This validator checks configuration, paths, schemas, package declarations,
known lesson dependencies, and teaching-data patterns. The definitive
R/Quarto runtime test is the included GitHub Actions build.
