from __future__ import annotations

import re
from pathlib import Path

import numpy as np
import pandas as pd
import yaml

ROOT = Path(__file__).resolve().parents[1]
errors: list[str] = []
warnings: list[str] = []
checks: list[str] = []


def check(condition: bool, success: str, failure: str) -> None:
    if condition:
        checks.append(success)
    else:
        errors.append(failure)


# Project configuration
config_path = ROOT / "_quarto.yml"
try:
    config = yaml.safe_load(config_path.read_text(encoding="utf-8"))
    checks.append("Parsed _quarto.yml")
except Exception as exc:  # pragma: no cover
    config = {}
    errors.append(f"Could not parse _quarto.yml: {exc}")

project = config.get("project", {}) if isinstance(config, dict) else {}
check(
    project.get("execute-dir") == "project",
    "Confirmed project-root code execution",
    "project.execute-dir must equal 'project'",
)
check(
    project.get("output-dir") == "_site",
    "Confirmed _site output directory",
    "project.output-dir must equal '_site'",
)

# Workflow
workflow = (ROOT / ".github/workflows/publish.yml").read_text(encoding="utf-8")
for required in [
    "actions/checkout@v6",
    "actions/configure-pages@v5",
    "actions/upload-pages-artifact@v4",
    "actions/deploy-pages@v4",
    "pages: write",
    "id-token: write",
    "quarto render",
]:
    check(required in workflow, f"Workflow contains {required}", f"Workflow is missing {required}")
check("target: gh-pages" not in workflow, "No branch-based Quarto publishing", "Workflow still targets gh-pages")

# QMD front matter and local links
all_docs = list(ROOT.rglob("*.qmd")) + list(ROOT.rglob("*.md"))
for path in ROOT.rglob("*.qmd"):
    text = path.read_text(encoding="utf-8")
    if text.startswith("---\n"):
        try:
            yaml.safe_load(text.split("---\n", 2)[1])
        except Exception as exc:
            errors.append(f"Invalid front matter in {path.relative_to(ROOT)}: {exc}")
checks.append(f"Checked {len(list(ROOT.rglob('*.qmd')))} Quarto files")

link_pattern = re.compile(r"\[[^\]]*\]\(([^)]+)\)")
for path in all_docs:
    text = path.read_text(encoding="utf-8")
    for target in link_pattern.findall(text):
        if target.startswith(("http://", "https://", "mailto:", "#")):
            continue
        clean = target.split("#", 1)[0]
        if not clean:
            continue
        destination = (path.parent / clean).resolve()
        if not destination.exists():
            errors.append(
                f"Broken local link in {path.relative_to(ROOT)}: {target}"
            )
checks.append("Checked local Markdown and Quarto links")

# Data references in code and lessons
referenced_data = set()
pattern = re.compile(r'["\'](data/[^"\']+\.csv)["\']')
for path in list(ROOT.rglob("*.qmd")) + list(ROOT.rglob("*.R")):
    for ref in pattern.findall(path.read_text(encoding="utf-8")):
        referenced_data.add(ref)
        if not (ROOT / ref).exists():
            errors.append(f"Missing referenced data file {ref} in {path.relative_to(ROOT)}")
checks.append(f"Checked {len(referenced_data)} referenced CSV paths")

# Dataset schemas
expected = {
    "employee_survey.csv": (480, 26),
    "employee_replication.csv": (360, 26),
    "training_experiment.csv": (220, 5),
    "marketing_mix.csv": (156, 8),
    "hotel_upgrades.csv": (900, 11),
}
frames: dict[str, pd.DataFrame] = {}
for name, shape in expected.items():
    kwargs = {"keep_default_na": False} if name == "hotel_upgrades.csv" else {}
    df = pd.read_csv(ROOT / "data" / name, **kwargs)
    frames[name] = df
    check(df.shape == shape, f"Checked {name} shape {shape}", f"Unexpected shape for {name}: {df.shape}")

hotel = frames["hotel_upgrades.csv"]
check(
    set(hotel["loyalty_status"].unique()) == {"None", "Silver", "Gold", "Platinum"},
    "Confirmed all four hotel loyalty categories",
    "Hotel loyalty categories are incomplete",
)
check(hotel["upgrade"].mean() > 0.15, "Confirmed usable hotel outcome balance", "Hotel upgrade outcome is too rare")

# Data dictionary coverage for employee dataset
dictionary = pd.read_csv(ROOT / "data/data_dictionary.csv")
employee_columns = set(frames["employee_survey.csv"].columns)
dictionary_columns = set(dictionary["variable"])
check(
    employee_columns.issubset(dictionary_columns),
    "Confirmed employee variables are documented",
    f"Undocumented employee variables: {sorted(employee_columns - dictionary_columns)}",
)

# Lesson/script pairing
for number in range(1, 10):
    prefix = f"{number:02d}-"
    lessons = list((ROOT / "modules").glob(prefix + "*.qmd"))
    scripts = list((ROOT / "code").glob(prefix + "*.R"))
    check(
        len(lessons) == 1 and len(scripts) == 1,
        f"Confirmed lesson/script pair {number}",
        f"Missing or duplicate lesson/script pair {number}",
    )

# Known corrected mediation condition
for relative in [
    "modules/07-moderation-mediation.qmd",
    "code/07-moderation-mediation.R",
    "solutions/05-06-solutions.qmd",
]:
    text = (ROOT / relative).read_text(encoding="utf-8")
    check(
        "mediation_data" in text and text.count("data = mediation_data") >= 2,
        f"Confirmed complete-case mediation in {relative}",
        f"Mediation models are not aligned in {relative}",
    )

# Package declarations
imports_text = (ROOT / "DESCRIPTION").read_text(encoding="utf-8")
for package in [
    "tidyverse", "janitor", "psych", "broom", "car", "performance",
    "interactions", "mediation", "effectsize", "scales", "downlit", "xml2",
]:
    check(re.search(rf"^\s*{re.escape(package)},?$", imports_text, re.MULTILINE) is not None,
          f"Declared package {package}", f"DESCRIPTION is missing {package}")

# Basic teaching-pattern checks
employees = frames["employee_survey.csv"].copy()
employees["leadership_4"] = 6 - employees["leadership_4_reverse"]
employees["engagement_4"] = 6 - employees["engagement_4_reverse"]
correlation = employees[["workload", "burnout"]].corr().iloc[0, 1]
check(correlation > 0.5, "Confirmed workload-burnout teaching pattern", "Weak workload-burnout pattern")
means = employees.groupby("training_group")["performance"].mean()
check(means["Training"] > means["Control"], "Confirmed training-group teaching pattern", "Training mean is not above control mean")
marketing = frames["marketing_mix.csv"]
check(int(marketing.loc[120, "week"]) == 121, "Confirmed diagnostic week 121", "Marketing diagnostic week is missing")

status = "0" if not errors else str(len(errors))
report = [
    "# Validation report",
    "",
    "**Release:** 0.2.0",
    f"**Files checked:** {sum(1 for p in ROOT.rglob('*') if p.is_file())}",
    f"**Errors:** {status}",
    f"**Warnings:** {len(warnings)}",
    "",
    "## Completed checks",
    "",
] + [f"- {item}" for item in checks]
report += ["", "## Errors", ""]
report += [f"- {item}" for item in errors] if errors else ["- None detected."]
report += ["", "## Warnings", ""]
report += [f"- {item}" for item in warnings] if warnings else ["- None detected."]
report += [
    "",
    "## Runtime boundary",
    "",
    "This validator checks configuration, paths, schemas, package declarations,",
    "known lesson dependencies, and teaching-data patterns. The definitive",
    "R/Quarto runtime test is the included GitHub Actions build.",
]
(ROOT / "VALIDATION.md").write_text("\n".join(report) + "\n", encoding="utf-8")

if errors:
    print("\n".join(errors))
    raise SystemExit(1)
print(f"Validation passed with {len(checks)} checks.")
