# ============================================================
# Module 1: First steps in R and RStudio
# ============================================================

library(tidyverse)

# Import the employee survey
employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
)

# Inspect the data
head(employees)
glimpse(employees)
names(employees)
dim(employees)

# Select one variable
employees$performance

# Create simple objects
course_name <- "Research Project Design"
number_of_rows <- nrow(employees)

course_name
number_of_rows

# Ask R for help
?read_csv
?mean
