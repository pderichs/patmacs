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

### Create environment from shell

```bash
$HOME/.config/emacs/bin/patmacs env
```

### Create user-env.el

Copy the user-env template and edit / customize the values according to your needs.

```bash
cd $HOME/.config/emacs
cp patmacs/user-env.el.template patmacs/user-env.el
emacs patmacs/user-env.el
```

### Optional: Add user specific el files

The following files are loaded if patmacs finds them in the `$HOME/.config/emacs/patmacs` folder.

#### `user-gpg.el`

Customize gpg settings for your individual setup.

#### `user-packages.el`

Add additional packages.

#### `user-prodigy.el`

Allows to add specific service configuration for prodigy.

#### `user-after-init.el`

Override / customize all settings in general.

## Keybindings

See [KEYBINDINGS.md](KEYBINDINGS.md) for a full reference of all keybindings configured by patmacs.

# LICENSE

MIT.
