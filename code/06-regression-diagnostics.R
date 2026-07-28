# ============================================================
# Module 6: Linear regression and diagnostics
# ============================================================

library(tidyverse)
library(broom)
library(car)
library(performance)

marketing <- read_csv(
  "data/marketing_mix.csv",
  show_col_types = FALSE
)

# Start with visual relationships
marketing |>
  ggplot(aes(x = search_ads_k_eur, y = sales_k_eur)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Search advertising and weekly sales",
    x = "Search advertising (thousand EUR)",
    y = "Sales (thousand EUR)"
  )

# Multiple linear regression
marketing_model <- lm(
  sales_k_eur ~
    search_ads_k_eur +
    social_ads_k_eur +
    email_ads_k_eur +
    discount_pct +
    competitor_price_index,
  data = marketing
)

summary(marketing_model)

# Cleaner model tables
tidy(marketing_model, conf.int = TRUE)
glance(marketing_model)

# Multicollinearity
vif(marketing_model)

# Diagnostic plots
check_model(marketing_model)

# Identify observations with larger Cook's distance
marketing_diagnostics <- augment(marketing_model) |>
  mutate(row_number = row_number()) |>
  arrange(desc(.cooksd))

marketing_diagnostics |>
  select(
    row_number,
    .fitted,
    .resid,
    .std.resid,
    .cooksd
  ) |>
  slice_head(n = 5)
