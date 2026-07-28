required_packages <- c(
  "tidyverse", "janitor", "psych", "broom", "car",
  "performance", "effectsize", "interactions", "mediation",
  "knitr", "rmarkdown", "scales", "downlit", "xml2"
)

status <- data.frame(
  package = required_packages,
  installed = required_packages %in% rownames(installed.packages())
)

print(status)

if (all(status$installed)) {
  message("Setup complete: all required packages are available.")
} else {
  message("Run source('R/install_packages.R') to install missing packages.")
}

required_files <- c(
  "data/employee_survey.csv",
  "data/training_experiment.csv",
  "data/marketing_mix.csv",
  "data/hotel_upgrades.csv",
  "data/employee_replication.csv"
)

missing_files <- required_files[!file.exists(required_files)]

if (length(missing_files) == 0) {
  message("All teaching datasets were found.")
} else {
  stop("Missing data files: ", paste(missing_files, collapse = ", "))
}
