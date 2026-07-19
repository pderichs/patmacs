# Patmacs

## Introduction

A simple, reduced evil based [Emacs](https://www.gnu.org/software/emacs/) config.

Inspired by [Doom Emacs](https://github.com/doomemacs/core).

## Installation

### Clone this repo

If you already have a `$HOME/.config/emacs` directory, back it up first:

```bash
mv $HOME/.config/emacs $HOME/.config/emacs.bak
```

```bash
git clone <this_repo> $HOME/.config/emacs
```

### Create user-env.el

Copy the user-env template and edit / customize the values according to your needs.

```bash
cd $HOME/.config/emacs
cp patmacs/user-env.el.template patmacs/user-env.el
emacs patmacs/user-env.el
```

### Optional: Add user-packages.el, user-prodigy.el or user-gpg.el

These files are loaded during startup if they exist, so you can customize your own packages, prodigy or gpg setup within the loading process of patmacs.

## Keybindings

See [KEYBINDINGS.md](KEYBINDINGS.md) for a full reference of all keybindings configured by patmacs.

# LICENSE

MIT.
