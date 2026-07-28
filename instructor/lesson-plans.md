# Lesson plans

## Reusable 90-minute format

1. **Question and intuition — 10 minutes**
   Introduce one realistic management problem and identify the outcome and
   predictors.
2. **Instructor live coding — 25 minutes**
   Type from a mostly blank script. Narrate errors and inspection steps.
3. **Guided modification — 20 minutes**
   Students change one variable, grouping, or model while following prompts.
4. **Independent task — 20 minutes**
   Students complete a short worksheet in pairs.
5. **Interpretation and exit check — 15 minutes**
   Discuss what can and cannot be concluded and collect one written sentence.

## Lab 1 — RStudio, cleaning, and descriptives

**Question:** What does the employee survey contain, and how should it be
prepared before analysis?

- Show Project, script, console, environment, files, plots, and help.
- Import the employee data with a relative path.
- Demonstrate `glimpse()`, `count()`, `filter()`, `mutate()`, `group_by()`, and
  `summarise()`.
- Create one histogram and one group comparison.
- Exit check: one descriptive claim and one claim the data cannot support.

## Lab 2 — Correlation and t-tests

**Question:** Is workload related to burnout, and do trained employees differ
in performance?

- Begin with variable type and design.
- Visualize before testing.
- Run correlation and independent t-test.
- Introduce confidence interval and effect size.
- Use the training experiment for a paired-test extension.

## Lab 3 — Measurement and categorical association

**Question:** Do survey items form useful scales and latent dimensions?

- Demonstrate reverse coding visibly.
- Compare alpha before and after correcting the reverse item.
- Create scale scores.
- Run a three-factor EFA and discuss interpretation rather than thresholds only.
- Finish with a chi-square table and row percentages.

## Lab 4 — Regression and diagnostics

**Question:** Which marketing activities are associated with weekly sales?

- Build from a bivariate plot to multiple regression.
- Translate each coefficient into original units.
- Use `broom` for clean tables.
- Inspect VIF, residual patterns, and Cook's distance.
- Discuss the intentionally influential week without automatically deleting it.

## Lab 5 — Conditional processes and replication

**Questions:** When does workload relate more strongly to burnout? Is the
engagement-performance pattern reproducible?

- Contrast moderation with mediation using diagrams.
- Estimate and plot one interaction.
- Run the mediation workflow but explicitly limit causal language.
- Re-estimate a model in the replication sample.
- End with a concise results paragraph.

## Optional lab — Logistic regression

**Question:** What predicts the probability of a hotel upgrade?

Focus on binary outcomes, odds ratios, predicted probabilities, and the ethical
limits of operational prediction.
