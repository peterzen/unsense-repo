# unsense-theme

A custom dark theme for the OPNsense web GUI, built on Bootstrap 3.4.1 with SCSS.

## Prerequisites

- Node.js
- Yarn 1.22.22 (`corepack enable && corepack prepare yarn@1.22.22`)
- Dart Sass (installed via `yarn install`)

## Yarn Scripts

| Command | Description |
|---|---|
| `yarn build` | Copy assets + compile SCSS |
| `yarn build:css` | Compile SCSS only |
| `yarn copy:assets` | Copy fonts + images to `build/` |
| `yarn watch` | Watch SCSS and recompile on change |
| `yarn dev` | browser-sync proxy to appliance (`https://192.168.1.1`) |
| `yarn clean` | Remove `build/{css,fonts,images}` |

## Development with SSHFS

Mount the appliance's theme directory over the local build output so `yarn build` writes directly to the appliance:

```bash
sshfs root@opnsense:/usr/local/opnsense/www/themes/unsense/build   build
```

To unmount:

```bash
fusermount -u build
```

### Workflow

1. Mount the appliance theme directory via sshfs (see above)
2. Edit SCSS sources in `src/stylesheets/`
3. Run `yarn watch` for automatic rebuilds on file changes
4. Reload the OPNsense web UI to see changes

Or use `yarn dev` for live reload via browser-sync (pair with `yarn watch`).

## Stylesheet Architecture

Entry point: `src/stylesheets/main.scss`

| Import Order | File | Purpose |
|---|---|---|
| 1 | `unsense.scss` | Color variables, gray scale, brand colors, base theme tokens |
| 2 | `fonts.scss` | Open Sans `@font-face` declarations |
| 3 | `bootstrap/*` | Full Bootstrap 3.4.1 SCSS (variables overridden by unsense.scss) |
| 4 | `behaviors.scss` | JS-dependent UI behaviors (multi-select, alerts) |
| 5 | `custom.scss` | Main OPNsense UI overrides (login, sidebar, tables, forms) |
| 6 | `layout.scss` | Flexbox page structure (header, sidebar, content, footer) |
| 7 | `ui.scss` | Table forms, buttons, sortable headers |
| 8 | `dashboard.scss` | Grid-stack widgets, charts |
| 9 | `dns-overview.scss` | DNS page-specific styles |
