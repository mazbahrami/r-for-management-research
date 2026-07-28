# GitHub and website deployment

This repository uses **GitHub Pages Actions**. It does not require a
`gh-pages` branch and should not use “Deploy from a branch.”

## Recommended method: GitHub Desktop

Using GitHub Desktop is the safest method because it preserves hidden folders
such as `.github/workflows/`, which can be missed during browser uploads.

1. Create or keep the public repository named `r-for-management-research`.
2. In GitHub Desktop, choose **File → Clone repository** and clone it.
3. Extract the release ZIP.
4. Copy **the contents inside** the extracted `r-for-management-research`
   folder into the cloned repository folder. Do not copy the outer folder as an
   extra directory level.
5. In GitHub Desktop, commit all changes with a message such as
   `Reset repository with validated release 0.2.0`.
6. Select **Push origin**.

The repository root must contain files such as:

```text
_quarto.yml
README.md
DESCRIPTION
.github/workflows/publish.yml
modules/
data/
code/
```

## Configure GitHub Pages

On GitHub, open:

```text
Settings → Pages → Build and deployment → Source
```

Choose:

```text
GitHub Actions
```

Do not choose **Deploy from a branch**.

## Run and inspect the workflow

A push to `main` automatically starts:

```text
Render and deploy Quarto website
```

The workflow performs two jobs:

1. **build** — installs R packages, renders the Quarto project, and uploads
   `_site` as a Pages artifact;
2. **deploy** — publishes that artifact to GitHub Pages.

The expected address is:

```text
https://mazbahrami.github.io/r-for-management-research/
```

## Browser-only alternative

Browser upload is possible, but verify that this file exists afterward:

```text
.github/workflows/publish.yml
```

If the hidden `.github` folder is missing, create the workflow file directly on
GitHub using **Add file → Create new file** and enter the complete path above.

## Verify before linking publicly

Check that:

- the Home, Course map, Lessons, Data, and Resources pages open;
- executable lessons display code and results;
- CSV and R files are present in the repository;
- Exercises and Solutions are separated;
- simulated datasets are clearly identified;
- the repository and personal-website links are correct.

## Connect the personal website

Only after the course site is live, follow
`website-integration/INTEGRATION.md` to add the Learning R landing page to the
personal website repository.

## Future updates

Edit `.qmd`, `.R`, or data files on `main` and push. GitHub Actions will render
and redeploy the site automatically.
