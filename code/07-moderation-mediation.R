# ============================================================
# Module 7: Moderation and mediation
# ============================================================

library(tidyverse)
library(psych)
library(broom)
library(interactions)
library(mediation)

employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
) |>
  mutate(
    leadership_4 = 6 - leadership_4_reverse,
    engagement_4 = 6 - engagement_4_reverse
  )

leadership_items <- employees |>
  dplyr::select(
    leadership_1,
    leadership_2,
    leadership_3,
    leadership_4
  )

engagement_items <- employees |>
  dplyr::select(
    engagement_1,
    engagement_2,
    engagement_3,
    engagement_4
  )

employees <- employees |>
  mutate(
    leadership = rowMeans(leadership_items, na.rm = TRUE),
    engagement = rowMeans(engagement_items, na.rm = TRUE),
    workload_c = workload - mean(workload, na.rm = TRUE),
    support_c = organizational_support -
      mean(organizational_support, na.rm = TRUE)
  )

# ------------------------------------------------------------
# Moderation
# Does organizational support weaken the relationship
# between workload and burnout?
# ------------------------------------------------------------

moderation_model <- lm(
  burnout ~ workload_c * support_c + age + tenure_years,
  data = employees
)

summary(moderation_model)
tidy(moderation_model, conf.int = TRUE)

interact_plot(
  moderation_model,
  pred = workload_c,
  modx = support_c,
  plot.points = TRUE,
  interval = TRUE
)

# ------------------------------------------------------------
# Mediation
# Does engagement statistically mediate the relationship
# between leadership and performance?
# ------------------------------------------------------------

mediation_data <- employees |>
  drop_na(leadership, engagement, performance, age, tenure_years)

mediator_model <- lm(
  engagement ~ leadership + age + tenure_years,
  data = mediation_data
)

outcome_model <- lm(
  performance ~ leadership + engagement + age + tenure_years,
  data = mediation_data
)

mediation_result <- mediate(
  mediator_model,
  outcome_model,
  treat = "leadership",
  mediator = "engagement",
  boot = TRUE,
  sims = 500
)

summary(mediation_result)
plot(mediation_result)
