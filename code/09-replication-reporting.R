# ============================================================
# Module 9: Replication and reporting
# ============================================================

library(tidyverse)
library(broom)

original <- read_csv(
  "data/employee_survey.csv",
  show_col_types = FALSE
) |>
  mutate(
    engagement_4 = 6 - engagement_4_reverse,
    engagement = rowMeans(
      across(
        c(
          engagement_1,
          engagement_2,
          engagement_3,
          engagement_4
        )
      ),
      na.rm = TRUE
    )
  )

replication <- read_csv(
  "data/employee_replication.csv",
  show_col_types = FALSE
) |>
  mutate(
    engagement_4 = 6 - engagement_4_reverse,
    engagement = rowMeans(
      across(
        c(
          engagement_1,
          engagement_2,
          engagement_3,
          engagement_4
        )
      ),
      na.rm = TRUE
    )
  )

original_model <- lm(
  performance ~ engagement + workload + training_group,
  data = original
)

replication_model <- lm(
  performance ~ engagement + workload + training_group,
  data = replication
)

comparison <- bind_rows(
  tidy(original_model, conf.int = TRUE) |>
    mutate(sample = "Original"),
  tidy(replication_model, conf.int = TRUE) |>
    mutate(sample = "Replication")
) |>
  select(
    sample,
    term,
    estimate,
    conf.low,
    conf.high,
    p.value
  )

comparison

# Save a transparent output table
write_csv(
  comparison,
  "replication_model_comparison.csv"
)
