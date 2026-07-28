# ============================================================
# Module 5: Exploratory factor analysis and chi-square
# ============================================================

library(tidyverse)
library(psych)

employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
) |>
  mutate(
    leadership_4 = 6 - leadership_4_reverse,
    engagement_4 = 6 - engagement_4_reverse,
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

survey_items <- employees |>
  select(
    leadership_1,
    leadership_2,
    leadership_3,
    leadership_4,
    engagement_1,
    engagement_2,
    engagement_3,
    engagement_4,
    role_clarity_1,
    role_clarity_2,
    role_clarity_3,
    role_clarity_4
  ) |>
  drop_na()

# Check whether factor analysis is reasonable
KMO(survey_items)
cortest.bartlett(cor(survey_items), n = nrow(survey_items))

# Optional: inspect suggested number of factors
fa.parallel(survey_items, fa = "fa")

# Estimate a three-factor solution
efa_model <- fa(
  survey_items,
  nfactors = 3,
  rotate = "oblimin",
  fm = "minres"
)

print(efa_model$loadings, cutoff = .30)

# Chi-square test
turnover_table <- table(
  employees$remote_mode,
  employees$high_turnover_intention
)

turnover_table
prop.table(turnover_table, margin = 1)

chi_result <- chisq.test(turnover_table)
chi_result
chi_result$expected
