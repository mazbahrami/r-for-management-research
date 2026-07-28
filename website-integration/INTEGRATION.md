# Website integration instructions

## Files to add

Copy the folder `learning-r/` into the root of the existing
`mazbahrami.github.io` repository. It contains:

- `learning-r/index.html`
- `learning-r/learning-r.css`

The page reuses the existing global stylesheet, JavaScript, header, footer,
fonts, theme toggle, and responsive navigation.

## Add Learning R to site navigation

In every existing HTML page, locate the primary navigation and insert:

```html
<a href="/learning-r/">Learning R</a>
```

Place it after Writing and before CV. On the new Learning R page the link
already has `class="active"`.

Also add this footer link:

```html
<a href="/learning-r/">Learning R</a>
```

## Add the homepage section

Insert the contents of `HOMEPAGE-SECTION.html` after the Selected Work section
or before Latest Writing.

## Add to sitemap.xml

```xml
<url>
  <loc>https://mazbahrami.github.io/learning-r/</loc>
  <lastmod>2026-07-23</lastmod>
</url>
```

## Links used by the page

The integration assumes the new public repository will be named:

- `mazbahrami/r-for-management-research`

and its GitHub Pages site will be:

- `https://mazbahrami.github.io/r-for-management-research/`

Create and publish that repository before making the website navigation public,
or temporarily remove the external buttons.

## Recommended deployment order

1. Create the new GitHub repository and upload the course files.
2. Enable Actions with read/write workflow permissions.
3. Run the Quarto publishing workflow and verify the course site.
4. Add the `learning-r/` folder to the personal website.
5. Apply navigation, homepage, and sitemap changes across the website.
