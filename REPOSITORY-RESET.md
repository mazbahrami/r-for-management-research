# Clean repository reset

A clean reset is appropriate when several partial browser edits have made the
repository difficult to track. Deleting the GitHub repository is unnecessary.
Keeping it preserves the repository URL and Pages configuration.

## Reset with GitHub Desktop

1. Download and extract the latest release ZIP.
2. Clone `mazbahrami/r-for-management-research` in GitHub Desktop.
3. Open the cloned folder on your computer.
4. Delete all tracked course files in that folder. Do **not** delete the hidden
   `.git` directory created by GitHub Desktop.
5. Copy everything inside the extracted `r-for-management-research` folder into
   the cloned folder.
6. Confirm that `.github/workflows/publish.yml` exists.
7. Commit all changes as `Reset repository with validated release 0.2.0`.
8. Push to `main`.
9. In **Settings → Pages**, select **GitHub Actions**.
10. Watch **Actions → Render and deploy Quarto website**.

This produces one clean replacement commit without changing the public URL.
