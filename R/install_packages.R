# Run this file once before starting the course.

course_packages <- c(
  "tidyverse",
  "janitor",
  "knitr",
  "psych",
  "broom",
  "car",
  "performance",
  "effectsize",
  "interactions",
  "mediation",
  "rmarkdown",
  "scales",
  "downlit",
  "xml2"
)

missing_packages <- course_packages[
  !course_packages %in% rownames(installed.packages())
]

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
} else {
  message("All course packages are already installed.")
}
