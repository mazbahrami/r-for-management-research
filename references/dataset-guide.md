# Dataset strategy and open-data guide

## Why the core course uses simulated data

The main datasets are simulated specifically for teaching. This permits:

- one coherent management story across multiple methods;
- known measurement structure and model relationships;
- purposeful missing values and diagnostic issues;
- no privacy or confidentiality risk;
- unrestricted redistribution with the repository;
- transparent regeneration from scripts in `data-raw/`.

Simulated data must never be presented as evidence about real employees,
organizations, customers, or hotels.

## Included datasets

| File | Case | Methods |
|---|---|---|
| `employee_survey.csv` | Organizational survey | Cleaning, descriptives, reliability, EFA, t-tests, chi-square, regression, moderation, mediation |
| `employee_replication.csv` | Independent organizational survey | Replication and reporting |
| `training_experiment.csv` | Management-training intervention | Independent and paired t-tests |
| `marketing_mix.csv` | Weekly marketing allocation | Multiple regression and diagnostics |
| `hotel_upgrades.csv` | Service decision | Logistic regression and predicted probabilities |

## Recommended real open datasets for optional projects

Always verify the source page and licence again before redistribution.

| Dataset | Why useful | Beginner use | Licence noted by source |
|---|---|---|---|
| [UCI Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank+marketing) | Real direct-marketing campaign data with a binary subscription outcome | Descriptives, chi-square, logistic regression | CC BY 4.0 |
| [UCI Online Retail](https://archive.ics.uci.edu/dataset/352/online+retail) | Transactional data from a UK non-store retailer | Cleaning, aggregation, customer/product summaries | CC BY 4.0 |
| [UCI Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii) | Larger transactional retail dataset | Advanced cleaning and replication extensions | CC BY 4.0 |
| [UCI Wholesale Customers](https://archive.ics.uci.edu/dataset/292/wholesale+customers) | Annual spending by channel and region | Descriptives, correlations, exploratory clustering extension | CC BY 4.0 |
| [UCI Sales Transactions Weekly](https://archive.ics.uci.edu/dataset/396/sales+transactions+dataset+weekly) | Weekly product sales | Time plots and sales comparison | CC BY 4.0 |

## Selection checklist

Before using a real dataset, check:

1. Is the licence explicit and compatible with teaching redistribution?
2. Is the provenance documented?
3. Does the dataset contain personal or sensitive information?
4. Is the outcome ethically appropriate for classroom modelling?
5. Can the research question be answered with methods students know?
6. Is the dataset small and clean enough for the available time?
7. Can students explain what one row and one column represent?

## Datasets intentionally avoided

Many popular “HR analytics” datasets circulate on Kaggle or copied GitHub
repositories without clear provenance or redistribution rights. They should not
be bundled merely because they look realistic. A transparent simulated dataset
is preferable to a legally or methodologically ambiguous one.
