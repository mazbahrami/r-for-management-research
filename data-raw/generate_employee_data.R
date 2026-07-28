# Generate fresh employee teaching datasets with the same structure and intended statistical patterns as the bundled CSV files.
# Running this R script is reproducible within R, but it will replace the distributed teaching samples with newly generated samples.

set.seed(20260723)

clip <- function(x, lower, upper) pmin(pmax(x, lower), upper)

make_likert <- function(latent, noise_sd = 0.75, reverse = FALSE) {
  x <- latent + rnorm(length(latent), 0, noise_sd)
  values <- cut(
    x,
    breaks = c(-Inf, -1.15, -0.35, 0.35, 1.15, Inf),
    labels = 1:5
  )
  values <- as.numeric(as.character(values))
  if (reverse) values <- 6 - values
  values
}

make_employee_sample <- function(n = 480, replication = FALSE, prefix = "E") {
  age <- as.integer(clip(round(rnorm(n, 38, 9.5)), 22, 65))
  tenure_years <- round(clip(rgamma(n, 2.2, rate = 1 / 2.2), 0.2, 25), 1)
  gender <- sample(
    c("Woman", "Man", "Non-binary / prefer not to say"),
    n, replace = TRUE, prob = c(.48, .48, .04)
  )
  department <- sample(
    c("Marketing", "Operations", "Finance", "Technology", "HR"),
    n, replace = TRUE, prob = c(.20, .25, .18, .24, .13)
  )
  remote_days <- sample(0:5, n, replace = TRUE,
                        prob = c(.12, .12, .28, .27, .14, .07))
  training_group <- sample(c("Control", "Training"), n, replace = TRUE)
  training <- ifelse(training_group == "Training", 1, 0)
  manager <- sample(c("No", "Yes"), n, replace = TRUE, prob = c(.72, .28))

  leadership_latent <- rnorm(n) + .12 * (manager == "Yes")
  workload_latent <- rnorm(n) +
    .15 * (department == "Operations") +
    .08 * (department == "Technology")
  support_latent <- .45 * leadership_latent + rnorm(n, 0, .85)
  role_latent <- .42 * leadership_latent + rnorm(n, 0, .85)
  engagement_latent <- .52 * leadership_latent +
    .30 * role_latent -
    .23 * workload_latent +
    ifelse(replication, .20, .26) * training +
    rnorm(n, 0, .72)

  workload <- clip(4 + workload_latent, 1, 7)
  organizational_support <- clip(4 + support_latent, 1, 7)
  engagement_score <- clip(4 + .95 * engagement_latent, 1, 7)
  role_score <- clip(4 + .95 * role_latent, 1, 7)

  workload_c <- workload - mean(workload)
  support_c <- organizational_support - mean(organizational_support)

  burnout <- clip(
    45 + 6 * workload_c - 4 * support_c -
      2 * workload_c * support_c + rnorm(n, 0, 6),
    15, 90
  )

  performance <- clip(
    52 + 5 * (engagement_score - 4) +
      2.1 * (role_score - 4) -
      1.4 * (workload - 4) +
      ifelse(replication, 2.3, 2.8) * training +
      rnorm(n, 0, 6.5),
    25, 95
  )

  job_satisfaction <- clip(
    4 + .48 * (engagement_score - 4) +
      .28 * (organizational_support - 4) -
      .22 * (workload - 4) + rnorm(n, 0, .7),
    1, 7
  )

  turnover_intention <- clip(
    4 - .55 * (job_satisfaction - 4) +
      .30 * (burnout - 45) / 10 -
      .15 * (organizational_support - 4) + rnorm(n, 0, .75),
    1, 7
  )

  result <- data.frame(
    employee_id = sprintf("%s%06d", prefix, seq_len(n)),
    age,
    gender,
    department,
    remote_days,
    tenure_years,
    manager,
    training_group,
    leadership_1 = make_likert(leadership_latent, .68),
    leadership_2 = make_likert(leadership_latent, .72),
    leadership_3 = make_likert(leadership_latent, .78),
    leadership_4_reverse = make_likert(leadership_latent, .72, TRUE),
    engagement_1 = make_likert(engagement_latent, .70),
    engagement_2 = make_likert(engagement_latent, .72),
    engagement_3 = make_likert(engagement_latent, .75),
    engagement_4_reverse = make_likert(engagement_latent, .72, TRUE),
    role_clarity_1 = make_likert(role_latent, .70),
    role_clarity_2 = make_likert(role_latent, .74),
    role_clarity_3 = make_likert(role_latent, .72),
    role_clarity_4 = make_likert(role_latent, .80),
    workload = round(workload, 2),
    organizational_support = round(organizational_support, 2),
    job_satisfaction = round(job_satisfaction, 2),
    performance = round(performance, 1),
    burnout = round(burnout, 1),
    turnover_intention = round(turnover_intention, 2)
  )

  # Add a small, reproducible amount of missingness for teaching.
  missing_columns <- c(
    "leadership_2", "leadership_4_reverse", "engagement_3",
    "engagement_4_reverse", "role_clarity_2", "job_satisfaction",
    "performance"
  )
  missing_n <- max(1, round(n * .017))
  for (variable in missing_columns) {
    result[sample(seq_len(n), missing_n), variable] <- NA
  }

  result
}

employees <- make_employee_sample(480, FALSE, "E")
replication <- make_employee_sample(360, TRUE, "E01")

readr::write_csv(employees, "data/employee_survey.csv", na = "")
readr::write_csv(replication, "data/employee_replication.csv", na = "")
