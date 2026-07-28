# Teaching notes for beginners

## Principles

- Start with a research question, not a function name.
- Type code in short blocks and run after every meaningful step.
- Keep the script as the source of truth; the console is temporary.
- Use one main dataset repeatedly so cognitive effort goes to the method.
- Ask students to predict the output before running a line.
- Normalize errors: read the final line, identify the object or argument, and
  check spelling and file paths.
- Require an interpretation sentence after every statistical result.
- Revisit variable types and study design before selecting a method.

## Language to model

Prefer:

- "is associated with" rather than "causes";
- "the estimate suggests" rather than "R proves";
- "the confidence interval indicates uncertainty" rather than treating the
  p-value as a verdict;
- "in this sample" rather than universal claims.

## Common beginner obstacles

| Problem | Teaching response |
|---|---|
| Running code from the wrong working directory | Open the `.Rproj` file and use relative paths |
| Object not found | Run the import/preparation lines in order |
| Package not found | Run `R/install_packages.R` once |
| Unexpected missing values | Inspect with `is.na()` and explain the chosen strategy |
| Pasted code without understanding | Ask the student to alter one variable and predict the result |
| Confusing output volume | Use `broom::tidy()` and point to only the needed columns |
| Causal overstatement | Return to the design and ask what alternative explanations remain |

## Live-coding preparation

- Use a clean copy of the repository.
- Increase editor and console font size.
- Close unrelated panes and files.
- Keep a complete instructor script open only as backup.
- Test internet-independent operation.
- Keep exercises and solutions in separate folders.

## Accessibility

- Read important code and output aloud.
- Do not rely on colour alone.
- Explain abbreviations on first use.
- Share materials before class.
- Allow students to work from a downloaded ZIP rather than requiring Git.
