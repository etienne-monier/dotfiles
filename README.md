# My dotfile manager

This repo gathers:
- my collection of [configuration files](http://dotfiles.github.io/),
- the setup files to install all programs I need,
- the setup script.

## Some words about what I needed

I've got a set of configuration files to deploy when configuring a new computer. Some of them are the same whatever the conputer (*e.g.* vim, git, compton, ...), but some are host-specific.

Concerning host-specific files, what I whant is to build the final file to be deployed based on three files:
- a *prefix-file* common to all hosts,
- a *middle-file* depending on the host,
- a *post-file* common to all hosts.

Both *prefix-file* and *post-file* are optional (in case none of them are used, the whole file is host-specific).

## How it works

The dotfile manager is based on [GNU stow](https://www.gnu.org/software/stow/).

Each folder located in `config` (compton, git, ...) is *an application*.
The applications are divided into those:
- to be deployed for all users (root included),
- to be deployed for non-root-user only.

This is defined in `setup.sh`.

When deploying an application - let's say i3 -, the application arborescence
```bash
~/.dotfiles/config/i3
└── .config
    └── i3
```
is copied into the home directory.
```bash
~
└── .config
    └── i3
```

Then, all application files are linked into the home directory arborescence
```bash
~/.config/i3/config -> ~/.dotfiles/config/i3/config
~/.config/i3/lock.sh -> ~/.dotfiles/config/i3/lock.sh
```

## Usage

Install the dependencies.

```bash
$ sudo apt-get install stow
```

Pull the repository.
```bash
$ git clone https://github.com/etienne-monier/dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
```

Configure the applications to be installed for all users / non-root users in `setup.sh`.
```bash
# Applications for all users (incl. root).
base=(
    'zsh'
    'vim'
)

# Applications for non-root users.
useronly=(
    'git'
    'i3'
    'compton'
    'matplotlib'
    'polybar'
    'rofi'
    'sublime-text'
    'ipython'
    'vim'
    'latexmk'
    'texstudio'
)
```

Deploy the applications using the `setup.sh` script.

```bash
$ chmod +x setup.sh
$ ./setup.sh
```

## Author and license

These dotfiles are implemented by [Etienne Monier](https://etienne-monier.github.io/) and are distributed under the MIT license.
