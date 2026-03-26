# unsense-repo

Custom OPNsense theme package repository.

## Quick Start

```bash
cd src/unsense-theme
yarn install
yarn build
```

## Build & Package

### 1. Build Theme Assets

```bash
cd src/unsense-theme
yarn build          # copies fonts/images + compiles SCSS → build/
```

Output goes to `src/unsense-theme/build/`:

```text
build/
├── css/main.css
├── fonts/
└── images/
```

### 2. Create FreeBSD Package

```bash
cd src/unsense-theme
sh scripts/package.sh
# → repo/FreeBSD_14_amd64/opnsense-theme-unsense-1.0.txz
```

The script stages `build/*` into `usr/local/opnsense/www/themes/unsense/`, generates a `+MANIFEST`, and archives into a `.txz`.

### 3. Makefile (OPNsense Plugin Format)

The `Makefile` in `src/unsense-theme/` defines plugin metadata for the OPNsense build system:

```makefile
PLUGIN_NAME=    theme-unsense-dark
PLUGIN_VERSION= 0.1
PLUGIN_REVISION= 1
```

`build_collect` stages `build/*` into `work/src/usr/local/opnsense/www/themes/unsense/` for the plugin framework (expects `../../Mk/plugins.mk`).

### 4. Install on Appliance

```bash
sudo pkg add -f work/opnsense-theme-mytheme-1.0.txz
```

Then select the theme at **System > Settings > General**.

### Install Path

Theme files install to `/usr/local/opnsense/www/themes/unsense/` on the OPNsense appliance.
