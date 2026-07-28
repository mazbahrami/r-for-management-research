# ============================================================
# Module 2: Cleaning, describing, and visualizing data
# ============================================================

library(tidyverse)
library(janitor)

employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
) |>
  clean_names()

# Inspect missing values
employees |>
  summarise(
    missing_performance = sum(is.na(performance)),
    missing_satisfaction = sum(is.na(job_satisfaction))
  )

# Create useful categories
employees_clean <- employees |>
  mutate(
    remote_mode = case_when(
      remote_days == 0 ~ "On-site",
      remote_days <= 3 ~ "Hybrid",
      remote_days >= 4 ~ "Mostly remote"
    ),
    high_turnover_intention = if_else(
      turnover_intention >= 5,
      "High",
      "Not high"
    )
  )

# Frequency table
employees_clean |>
  count(department, sort = TRUE)

# Descriptive statistics
employees_clean |>
  summarise(
    n = n(),
    mean_performance = mean(performance, na.rm = TRUE),
    sd_performance = sd(performance, na.rm = TRUE),
    mean_satisfaction = mean(job_satisfaction, na.rm = TRUE)
  )

# Descriptives by group
employees_clean |>
  group_by(training_group) |>
  summarise(
    n = n(),
    mean_performance = mean(performance, na.rm = TRUE),
    sd_performance = sd(performance, na.rm = TRUE),
    .groups = "drop"
  )

# Histogram
ggplot(employees_clean, aes(x = performance)) +
  geom_histogram(binwidth = 5, boundary = 0) +
  labs(
    title = "Distribution of employee performance",
    x = "Performance score",
    y = "Number of employees"
  )

# Boxplot
ggplot(
  employees_clean,
  aes(x = training_group, y = performance)
) +
  geom_boxplot() +
  labs(
    title = "Performance by training group",
    x = NULL,
    y = "Performance score"
  )
