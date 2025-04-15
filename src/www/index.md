---
title: Unsense OPNsense Theme Repo
---

Welcome to the plugin repository of the **Unsense** OPNsense theme.

### Install this repo

```sh
fetch -o /usr/local/etc/pkg/repos/unsense.conf https://pkg.froggle.org/unsense-repo/unsense.conf

pkg update
```

### Find out what is available in the (installed) repo

```sh
pkg search -g -r unsense \*
```

### Remove this repo

```sh
rm /usr/local/etc/pkg/repos/unsense.conf
```

(removing the repo will not remove previously installed packages from the repo)

### Find out what you have installed from this repo

```sh
pkg query -a '%R %n-%v' | grep unsense
```
