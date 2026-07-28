# ============================================================
# Module 3: Correlations, confidence intervals, and t-tests
# ============================================================

library(tidyverse)
library(effectsize)

employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
)

training <- read_csv(
  "data/training_experiment.csv",
  show_col_types = FALSE
)

# Correlation
cor.test(
  employees$job_satisfaction,
  employees$performance,
  use = "complete.obs"
)

# Independent-samples t-test
independent_test <- t.test(
  performance ~ training_group,
  data = employees
)

independent_test

# Effect size
cohens_d(
  performance ~ training_group,
  data = employees
)

# Paired-samples t-test
paired_test <- t.test(
  training$post_score,
  training$pre_score,
  paired = TRUE
)

paired_test

# Compare change scores across groups
t.test(
  change_score ~ group,
  data = training
)

# Visualize the change
training |>
  group_by(group) |>
  summarise(
    mean_change = mean(change_score),
    se = sd(change_score) / sqrt(n()),
    .groups = "drop"
  ) |>
  ggplot(aes(x = group, y = mean_change)) +
  geom_col() +
  geom_errorbar(
    aes(
      ymin = mean_change - 1.96 * se,
      ymax = mean_change + 1.96 * se
    ),
    width = .15
  ) +
  labs(
    title = "Average change after the intervention",
    x = NULL,
    y = "Mean change score"
  )
