# ============================================================
# Module 4: Reliability and scale construction
# ============================================================

library(tidyverse)
library(psych)

employees <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
)

# Reverse negatively worded items.
# For a 1-5 scale, reverse score = 6 - original score.
employees_scored <- employees |>
  mutate(
    leadership_4 = 6 - leadership_4_reverse,
    engagement_4 = 6 - engagement_4_reverse
  )

leadership_items <- employees_scored |>
  select(
    leadership_1,
    leadership_2,
    leadership_3,
    leadership_4
  )

engagement_items <- employees_scored |>
  select(
    engagement_1,
    engagement_2,
    engagement_3,
    engagement_4
  )

# Cronbach's alpha
alpha(leadership_items)
alpha(engagement_items)

# Create scales only when at least 3 of 4 items are answered
employees_scored <- employees_scored |>
  mutate(
    leadership_valid_items = rowSums(!is.na(leadership_items)),
    engagement_valid_items = rowSums(!is.na(engagement_items)),
    leadership = if_else(
      leadership_valid_items >= 3,
      rowMeans(leadership_items, na.rm = TRUE),
      NA_real_
    ),
    engagement = if_else(
      engagement_valid_items >= 3,
      rowMeans(engagement_items, na.rm = TRUE),
      NA_real_
    )
  )

employees_scored |>
  summarise(
    mean_leadership = mean(leadership, na.rm = TRUE),
    sd_leadership = sd(leadership, na.rm = TRUE),
    mean_engagement = mean(engagement, na.rm = TRUE),
    sd_engagement = sd(engagement, na.rm = TRUE)
  )
