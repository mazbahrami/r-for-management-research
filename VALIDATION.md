# Validation report

**Release:** 0.2.2
**Files checked:** 88
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
- Confirmed prediction data reference in 404.qmd
- Confirmed prediction data reference in datasets.qmd
- Confirmed prediction data reference in course-map.qmd
- Confirmed prediction data reference in getting-started.qmd
- Confirmed prediction data reference in resources.qmd
- Confirmed prediction data reference in index.qmd
- Confirmed prediction data reference in exercises/08-replication.qmd
- Confirmed prediction data reference in exercises/06-moderation-mediation.qmd
- Confirmed prediction data reference in exercises/05-regression.qmd
- Confirmed prediction data reference in exercises/02-clean-describe.qmd
- Confirmed prediction data reference in exercises/04-measurement.qmd
- Confirmed prediction data reference in exercises/07-logistic.qmd
- Confirmed prediction data reference in exercises/03-tests.qmd
- Confirmed prediction data reference in exercises/01-first-steps.qmd
- Confirmed prediction data reference in exercises/index.qmd
- Confirmed prediction data reference in modules/04-reliability-scales.qmd
- Confirmed prediction data reference in modules/06-regression-diagnostics.qmd
- Confirmed prediction data reference in modules/02-clean-describe.qmd
- Confirmed prediction data reference in modules/07-moderation-mediation.qmd
- Confirmed prediction data reference in modules/08-logistic-regression.qmd
- Confirmed prediction data reference in modules/09-replication-reporting.qmd
- Confirmed prediction data reference in modules/05-efa-chi-square.qmd
- Confirmed prediction data reference in modules/01-first-steps.qmd
- Confirmed prediction data reference in modules/03-correlations-t-tests.qmd
- Confirmed prediction data reference in slides/05-conditional-replication.qmd
- Confirmed prediction data reference in slides/06-logistic.qmd
- Confirmed prediction data reference in slides/03-measurement.qmd
- Confirmed prediction data reference in slides/04-regression.qmd
- Confirmed prediction data reference in slides/02-tests.qmd
- Confirmed prediction data reference in slides/01-rstudio-data.qmd
- Confirmed prediction data reference in slides/00-orientation.qmd
- Confirmed prediction data reference in solutions/07-08-solutions.qmd
- Confirmed prediction data reference in solutions/01-02-solutions.qmd
- Confirmed prediction data reference in solutions/03-04-solutions.qmd
- Confirmed prediction data reference in solutions/index.qmd
- Confirmed prediction data reference in solutions/05-06-solutions.qmd
- Confirmed prediction data reference in templates/research-report.qmd
- Confirmed prediction data reference in data-raw/generate_employee_data.R
- Confirmed prediction data reference in data-raw/generate_applied_cases.R
- Confirmed prediction data reference in code/02-clean-describe.R
- Confirmed prediction data reference in code/04-reliability-scales.R
- Confirmed prediction data reference in code/08-logistic-regression.R
- Confirmed prediction data reference in code/05-efa-chi-square.R
- Confirmed prediction data reference in code/03-correlations-t-tests.R
- Confirmed prediction data reference in code/01-first-steps.R
- Confirmed prediction data reference in code/07-moderation-mediation.R
- Confirmed prediction data reference in code/06-regression-diagnostics.R
- Confirmed prediction data reference in code/09-replication-reporting.R
- Confirmed prediction data reference in R/check_setup.R
- Confirmed prediction data reference in R/install_packages.R

## Errors

- None detected.

## Warnings

- None detected.

## Runtime boundary

This validator checks configuration, paths, schemas, package declarations,
known lesson dependencies, and teaching-data patterns. The definitive
R/Quarto runtime test is the included GitHub Actions build.
