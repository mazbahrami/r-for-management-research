# Benchmark of R teaching resources

Reviewed July 2026. The goal was not to reproduce any one resource, but to
identify design patterns suitable for beginner management-research students.

| Resource | Strong feature | Limitation for this course | Design decision adopted here |
|---|---|---|---|
| [R for Data Science, 2e](https://r4ds.hadley.nz/) | Coherent import-transform-visualize-communicate workflow; open Quarto source | Broader and longer than the required statistics workshops | Use workflow-first organization and readable tidyverse code |
| [Data Carpentry: R for Social Scientists](https://datacarpentry.org/r-socialsci/) | Designed for people with no programming experience; strong instructor guidance | Focuses mostly on data skills rather than the full Luiss statistical sequence | Use live coding, one-row/one-variable language, exercises, and instructor notes |
| [ModernDive](https://moderndive.com/) | Connects tidy data, inference, regression, and interpretation | Its full inference pathway is larger than the available lab time | Use tidy model tables, confidence intervals, and visual regression interpretation |
| [Intro2R](https://intro2r.com/) | Clear R/RStudio setup and beginner progression; already referenced by the Luiss course | Not specifically management-research oriented | Provide a short setup path and direct students to it as an optional reference |
| [Applied Stats with R and RStudio](https://github.com/briatte/asr) | Recent first-year social-science structure with class files, exercises, and project templates | Different syllabus and datasets | Separate lessons, exercises, solutions, code, and template folders |
| [Introduction to Quantitative Analysis with R](https://github.com/Data-Science-Center-UB/Intro-Quantitative-Analysis-R) | Gentle, interpretation-focused training for researchers | Includes topics and a survey context beyond this course | Keep mathematical detail light and make interpretation explicit |
| [Practical Applications in R for Psychologists](https://github.com/katiecorker/R_Intro) | Applied notebook approach and psychological measurement examples | Domain-specific and more expansive | Use survey scales and measurement examples in a management context |
| [AppliedR Research](https://github.com/ccs-amsterdam/r-course-material) | Research-oriented workflow and reproducible materials | Some content assumes more independent learning | Include complete scripts and a replication/reporting module |

## Repository-design conclusions

1. A public Quarto site should be readable without installing R.
2. Students should also receive plain `.R` scripts and CSV files for RStudio.
3. The first page should state prerequisites, workflow, and learning boundaries.
4. Lessons, exercises, solutions, data, and instructor files should be separate.
5. A single recurring survey dataset reduces unnecessary cognitive switching.
6. Statistical output must always be followed by substantive interpretation.
7. Reproducibility should be present from the first project, not added at the end.

## Technical references

- [Quarto websites](https://quarto.org/docs/websites/)
- [Publishing Quarto to GitHub Pages](https://quarto.org/docs/publishing/github-pages.html)
- [Posit RStudio IDE guide](https://docs.posit.co/ide/user/ide/get-started/)
- [Posit R cheatsheets](https://posit.co/resources/cheatsheets/)
- [renv documentation](https://rstudio.github.io/renv/)
