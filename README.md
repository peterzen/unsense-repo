# Unsense OPNsense repo

## Development with SSHFS

Mount the appliance's theme build directory over the local build output so that
`yarn build` writes directly to the appliance:

```bash
sshfs root@rtr:/usr/local/opnsense/www/themes/unsense/build \
  src/unsense-theme/build
```

To unmount:

```bash
fusermount -u src/unsense-theme/build
```

### Folder mapping

| Local path | Appliance path |
| --- | --- |
| `src/unsense-theme/src/` | SCSS/JS/font sources (not deployed) |
| `src/unsense-theme/build/` | `/usr/local/opnsense/www/themes/unsense/build/` (via sshfs) |

### Workflow

1. Mount the appliance theme directory via sshfs (see above)
2. Edit SCSS sources in `src/unsense-theme/src/stylesheets/`
3. Build: `cd src/unsense-theme && yarn build`
4. Reload the OPNsense web UI to see changes

Use `yarn watch` for automatic rebuilds on file changes.
