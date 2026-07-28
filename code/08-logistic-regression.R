# ============================================================
# Module 8: Logistic regression
# ============================================================

library(tidyverse)
library(broom)

hotel <- read_csv(
  "data/hotel_upgrades.csv",
  show_col_types = FALSE
) |>
  mutate(
    loyalty_status = factor(
      loyalty_status,
      levels = c("None", "Silver", "Gold", "Platinum")
    ),
    special_event = factor(special_event),
    direct_booking = factor(direct_booking)
  )

# Inspect the outcome
hotel |>
  count(upgrade) |>
  mutate(percent = 100 * n / sum(n))

# Estimate the model
upgrade_model <- glm(
  upgrade ~
    loyalty_status +
    prior_stays +
    occupancy_rate +
    total_spend_eur +
    special_event +
    direct_booking,
  data = hotel,
  family = binomial
)

summary(upgrade_model)

# Odds ratios and confidence intervals
tidy(
  upgrade_model,
  exponentiate = TRUE,
  conf.int = TRUE
)

# Predicted probabilities for two guest profiles
guest_profiles <- tibble(
  loyalty_status = factor(
    c("None", "Gold"),
    levels = c("None", "Silver", "Gold", "Platinum")
  ),
  prior_stays = c(0, 7),
  occupancy_rate = c(90, 65),
  total_spend_eur = c(250, 900),
  special_event = factor(
    c("No", "No"),
    levels = levels(hotel$special_event)
  ),
  direct_booking = factor(
    c("No", "Yes"),
    levels = levels(hotel$direct_booking)
  )
)

guest_profiles |>
  mutate(
    predicted_upgrade_probability = predict(
      upgrade_model,
      newdata = guest_profiles,
      type = "response"
    )
  )

# Probability curve across prior stays
probability_data <- tibble(
  loyalty_status = factor(
    "Silver",
    levels = levels(hotel$loyalty_status)
  ),
  prior_stays = 0:12,
  occupancy_rate = mean(hotel$occupancy_rate),
  total_spend_eur = median(hotel$total_spend_eur),
  special_event = factor(
    "No", levels = levels(hotel$special_event)
  ),
  direct_booking = factor(
    "Yes", levels = levels(hotel$direct_booking)
  )
)

probability_data <- probability_data |>
  mutate(
    probability = predict(
      upgrade_model,
      newdata = probability_data,
      type = "response"
    )
  )

probability_data |>
  ggplot(aes(x = prior_stays, y = probability)) +
  geom_line() +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Predicted upgrade probability",
    x = "Prior stays",
    y = "Predicted probability"
  )
