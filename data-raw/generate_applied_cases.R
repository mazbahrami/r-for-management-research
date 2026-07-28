set.seed(20260723)

clip <- function(x, lower, upper) pmin(pmax(x, lower), upper)

# Management-training experiment
n <- 220
group <- sample(c("Control", "Training"), n, replace = TRUE)
pre_score <- clip(rnorm(n, 62, 10), 30, 90)
improvement <- rnorm(n, 2.2, 4) + ifelse(group == "Training", 5.4, 0)
post_score <- clip(pre_score + improvement, 30, 100)

training_experiment <- data.frame(
  participant_id = sprintf("T%04d", seq_len(n)),
  group,
  pre_score = round(pre_score, 1),
  post_score = round(post_score, 1),
  change_score = round(post_score - pre_score, 1)
)

# Marketing-mix data
n <- 156
week <- seq_len(n)
date <- seq.Date(as.Date("2023-01-02"), by = "week", length.out = n)
base_demand <- 150 + 12 * sin(week / 8) + .18 * week
search_ads <- clip(rnorm(n, 38, 8) + .12 * week, 10, 75)
social_ads <- clip(.55 * search_ads + rnorm(n, 14, 7), 5, 70)
email_ads <- clip(rnorm(n, 12, 3.5), 2, 24)
discount <- clip(rnorm(n, 8, 3), 0, 20)
competitor <- clip(rnorm(n, 100, 4), 88, 112)
holiday_season <- ifelse(format(date, "%m") %in% c("11", "12"), 18, 0)

sales <- base_demand +
  1.35 * search_ads +
  .78 * social_ads +
  1.15 * email_ads +
  2.1 * discount -
  1.0 * (competitor - 100) +
  holiday_season +
  rnorm(n, 0, 10)

sales[121] <- sales[121] + 110  # purposeful campaign/event week for diagnostics

marketing_mix <- data.frame(
  week,
  date,
  search_ads_k_eur = round(search_ads, 1),
  social_ads_k_eur = round(social_ads, 1),
  email_ads_k_eur = round(email_ads, 1),
  discount_pct = round(discount, 1),
  competitor_price_index = round(competitor, 1),
  sales_k_eur = round(sales, 1)
)

# Hotel-upgrade data
n <- 900
loyalty_status <- sample(
  c("None", "Silver", "Gold", "Platinum"),
  n, replace = TRUE, prob = c(.48, .25, .18, .09)
)
loyalty_mean <- ifelse(
  loyalty_status == "Platinum", 9,
  ifelse(loyalty_status == "Gold", 5,
         ifelse(loyalty_status == "Silver", 2, .7))
)
prior_stays <- clip(rpois(n, loyalty_mean), 0, 30)
stay_nights <- clip(rpois(n, 2.1) + 1, 1, 10)
occupancy_rate <- clip(rnorm(n, 78, 14), 35, 100)
checkin_hour <- as.integer(clip(round(rnorm(n, 17, 3)), 8, 23))
special_event <- sample(c("No", "Yes"), n, replace = TRUE, prob = c(.83, .17))
direct_booking <- sample(c("No", "Yes"), n, replace = TRUE, prob = c(.38, .62))
booked_room <- sample(c("Standard", "Deluxe"), n, replace = TRUE,
                      prob = c(.72, .28))
total_spend_eur <- clip(
  110 * stay_nights + 35 * prior_stays +
    ifelse(booked_room == "Deluxe", 150, 0) + rnorm(n, 0, 120),
  60, 2500
)

log_odds <- -2.25 +
  .45 * (loyalty_status == "Silver") +
  .90 * (loyalty_status == "Gold") +
  1.35 * (loyalty_status == "Platinum") +
  .12 * prior_stays -
  .035 * (occupancy_rate - 75) +
  .0015 * (total_spend_eur - 500) +
  .55 * (direct_booking == "Yes") -
  .35 * (special_event == "Yes")

upgrade_probability <- plogis(log_odds)

hotel_upgrades <- data.frame(
  guest_id = sprintf("G%04d", seq_len(n)),
  loyalty_status,
  prior_stays,
  stay_nights,
  occupancy_rate = round(occupancy_rate, 1),
  checkin_hour,
  special_event,
  direct_booking,
  booked_room,
  total_spend_eur = round(total_spend_eur, 1),
  upgrade = rbinom(n, 1, upgrade_probability)
)

readr::write_csv(training_experiment, "data/training_experiment.csv")
readr::write_csv(marketing_mix, "data/marketing_mix.csv")
readr::write_csv(hotel_upgrades, "data/hotel_upgrades.csv")
