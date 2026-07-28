# Teaching-data validation

The bundled CSV files were checked for classroom suitability using an
independent Python validation workflow. The instructional analyses themselves
remain written in R.

## Employee survey

- Correctly scored reliability: leadership alpha = **0.87**,
  engagement alpha = **0.85**, and role-clarity alpha = **0.84**.
- Workload and burnout show a clear positive correlation: **r = 0.66**.
- Mean performance is **51.97** in the control group and
  **55.61** in the training group; the Welch comparison is
  statistically distinguishable in the teaching sample.
- The workload × support coefficient in the burnout model is
  **-2.12**, producing a visible buffering
  pattern for the moderation lesson.
- The three item blocks have stronger average correlations within constructs
  than across constructs, supporting an interpretable introductory EFA.
- The remote-work/turnover chi-square example is intentionally not guaranteed
  to be significant. Students therefore practise reporting a null-compatible
  result rather than expecting every exercise to “work.”

## Marketing mix

- The multiple-regression adjusted R-squared is **0.66**.
- Advertising-channel coefficients are positive in the distributed sample.
- Week **121** has the largest Cook's distance by design, giving students
  a clear case for investigation and sensitivity analysis.

## Hotel upgrades

- The upgrade rate is **24.1%**, avoiding an excessively rare
  outcome.
- All four loyalty categories are present, including the `None` reference group.
- Loyalty coefficients are positive relative to no loyalty status in the distributed sample.
- Prior stays and spending are positive, while occupancy is negative in the
  fitted teaching model.
- The case is appropriate for explaining why odds ratios and predicted
  probabilities are different.

## Replication sample

The original and replication samples produce the same substantive directions
for engagement, workload, and training status in the performance model. Exact
estimates differ, enabling comparison of magnitude and uncertainty.

| Term | Original estimate | Replication estimate |
|---|---:|---:|
| Engagement | 4.86 | 4.11 |
| Workload | -1.54 | -1.43 |
| Training group | 2.45 | 2.46 |

## Boundary

These checks confirm that the files support the intended teaching exercises.
They do not convert synthetic data into empirical evidence about real
organizations. Static repository checks passed for release 0.2.0. The included GitHub Action
provides the definitive R/Quarto runtime build after repository upload.
