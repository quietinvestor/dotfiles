# dotfiles

## Table of Contents

1. [Overview](#1-overview)
2. [Requirements](#2-requirements)
3. [Quick Install](#3-quick-install)
4. [bash](#4-bash)
5. [git](#5-git)
6. [tmux](#6-tmux)
7. [Neovim](#7-neovim)
8. [vim](#8-vim)

## 1. Overview

A collection of my configuration [dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments) for the tools I use in my Linux development environment.

## 2. Requirements

- Any Linux [distro](https://en.wikipedia.org/wiki/Linux_distribution) - *Currently, I am running [Fedora 36](https://getfedora.org/en/workstation/download/)*.
- Install the tools, listed below, that you would like to use - *See below for installation instructions for each tool*.
- Please note that, in order to correctly render the icons for the themes and plugins used on tmux, vim and Neovim, you will need to [install Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation) and make them the default font for your terminal.
- In the case of [Neovim](#7-neovim) and [vim](#8-vim), you will also need to perform additional steps to install their plugins - *See below for detailed installation instructions*.

## 3. Quick Install

Go to the directory where you would like to download this repository and type in the below commands in your terminal:

```bash
git clone https://github.com/quietinvestor/dotfiles.git
cd dotfiles
scripts/install_dotfiles # Run bash script to automatically deploy all dotfiles
```

The `install_dotfiles` bash script will create [symbolic links](https://man7.org/linux/man-pages/man1/ln.1.html) in the corresponding directories of your [$HOME](https://en.wikipedia.org/wiki/Home_directory) directory, pointing to the files contained inside the cloned [dotfiles](https://github.com/quietinvestor/dotfiles) Github repository. This is done for versioning purposes, so that you may easily track any changes to said files using [git](#5-git). The only exception are configuration dotfiles, such as `.gitconfig`, which are copied instead, given that it contains your credentials, and uploading them to the [dotfiles](https://github.com/quietinvestor/dotfiles) Github repository would represent a security risk.

## 4. bash

[BASH](https://www.gnu.org/software/bash/) is an acronym for **B**ourne **A**gain **Sh**ell. Shells are command interpreters. They are applications that provide users with the ability to give commands to their operating system interactively, or to execute batches of commands quickly.

Please bear in mind that my `.bashrc` configuration file for the [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) shell is specific for Fedora 36. Therefore, it mostly contains some minor tweaks with respect to the default file. If you are running a different environment, you might be better off just modifying your distro-specific default `.bashrc` file or perhaps you are even using a different shell, such as [zsh](https://en.wikipedia.org/wiki/Z_shell).

If you want to learn bash shell scripting, I would recommend the [BashGuide](https://mywiki.wooledge.org/BashGuide).

## 5. git

[git](https://git-scm.com/about) is a free and open source distributed version control system.

[Install git](https://github.com/git-guides/install-git) and copy the `.gitconfig` file to your [$HOME](https://en.wikipedia.org/wiki/Home_directory) directory. Please note that, for security, the `install_dotfiles` bash script will only copy this file and not create a symbolic link, given that you are supposed to replace the below with your own [Github](https://github.com/) credentials.

```
[user]
  name = username
  # Email must match that of GPG key for
  # github commit signature verification.
  email = username@domain.com
  # Recommended to use a signing subkey.
  signingkey = FFFFFFFFFFFFFFFF
```

I care about security, so I sign all my commits with a GPG signing subkey. This helps [prevent supply chain attacks](https://www.linuxjournal.com/content/signing-git-commits). Probably, I will be creating a tutorial in the future on how to do so. In the meantime, you can refer to [Generating a New GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key). Nevertheless, this is not a hard requirement, so you may delete the below lines if you prefer to not sign your commits:

```
  # Recommended to use a signing subkey.
  signingkey = FFFFFFFFFFFFFFFF
[commit]
  gpgSign = true

[...]

[gpg]
  format = openpgp
```

Similarly, I like to use [Neovim](#7-neovim) as my default text editor on Linux, but if you wish to use a different one, such as [vim](#8-vim) or [emacs](https://www.gnu.org/software/emacs/), just change the lines below:

```
[core]
  # Use Neovim.
  editor = nvim
[diff]
  tool = nvimdiff
[difftool "nvimdiff"]
  cmd = nvim -d $LOCAL $REMOTE
[merge]
  tool = nvimdiff4
[mergetool "nvimdiff4"]
  cmd = nvim -d $LOCAL $BASE $REMOTE $MERGED -c '$wincmd w' -c 'wincmd J'
```

If you want to learn how to use git, I recommend [Jason Taylor's Git Complete](https://www.udemy.com/course/git-complete/) Udemy course. It is a paid course (*no sponsored links*), but Udemy constantly puts courses on sales at affordable prices. There are also plenty of other free resources available online.

## 6. tmux

[tmux](https://github.com/tmux/tmux/wiki#welcome-to-tmux) is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen.

[Install tmux](https://github.com/tmux/tmux/wiki/Installing) and create a symbolic link in your [$HOME](https://en.wikipedia.org/wiki/Home_directory) directory, pointing to the `.tmux.conf` file in your `dotfiles` cloned repository.

I use the [catppuccin/tmux](https://github.com/catppuccin/tmux) theme, but, of course, please feel free to change it to whatever you prefer. Simply delete all the lines below the `# Catppuccin theme` comment in the `.tmux.conf` file.

I also like to use vi key bindings because, as you may have guessed by now, I love [vim](#8-vim). :wink: However, unless you want these, you may delete the below:

```
# Set vim key bindings
set-window-option -g mode-keys vi
```

The scroll history is set to 5,000 lines, but you can modify it to your liking by changing the below:

```
# Set scroll history to 5000 lines
set -g history-limit 5000
```

If you want to learn how to use tmux, I would recommend [Chris Toomey's tmux](https://thoughtbot.com/upcase/tmux) course on UPCASE by thoughtbot. It's free.

## 7. Neovim

[Neovim](https://neovim.io/) is my text editor of choice locally, because I love [vim](#8-vim), but I also think that Neovim brings some important [improvements](https://neovim.io/charter/) over its predecessor. Ultimately, if you know how to use [vim](#8-vim), you know how to use Neovim.

As it is still in development and many of its key improvements depend on the latest builds, I recommend [installing the development version](https://github.com/neovim/neovim/wiki/Installing-Neovim). You may then create a symbolic link in your `$HOME/.config/nvim` directory, pointing to the `nvim` directory in your `dotfiles` cloned repository.

Functionality is augmented using [plugins](https://github.com/neovim/neovim/wiki/Related-projects#plugins). To install and manage them, I use [wbthomason/nvim.packer](https://github.com/wbthomason/packer.nvim). You may find instructions on how to install and use it on the link just provided to the project. The plugins I use (*so far*) are the following:

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - *Auto-completion engine*
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - *Built-in language server client*
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - *Treesitter*
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - *Code snippets parser*
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - *Code snippets*
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - *File explorer*
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) - *Buffer tabs*
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - *Statusline*
- [catppuccin/nvim](https://github.com/catppuccin/nvim) - *Catppuccin theme*

You will find in `nvim/lua/plugins.lua` that there are actually more plugins installed than those mentioned above: they are just pre-requirements for some of the above packages, as per each plugin's installation instructions linked above.

As per [wbthomason/nvim.packer](https://github.com/wbthomason/packer.nvim)'s instructions, in order to install the above plugins, make sure that, once configured, you run `:PackerCompile` from within Neovim, or `:PackerUpdate` if you already have some plugins installed.

Should you want to delete any of the above plugins, simply remove them from `nvim/lua/plugins.lua` and run `:PackerUpdate` from within Neovim to remove the plugin. Please remember to also delete any related `*.lua` file under `nvim/lua`.

Many of the major improvements in Neovim over vim result from the use of [LSP (Language Server Protocol) servers](https://neovim.io/doc/lsp/) and [Treesitter](https://neovim.io/doc/treesitter/) for language-specific auto-completion, indentation and syntax highlighting, amongst other things. Therefore, for many of the above language-related plugins to work and to leverage the full power of Neovim, you also need to install LSP servers for each language that you plan to use. Below are the LSP servers that I use (*so far*), including instructions on how to install and deploy them:

- [bashls](https://github.com/bash-lsp/bash-language-server) - *Bash*
- [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs) - *Dockerfiles*
- [jsonls](https://github.com/hrsh7th/vscode-langservers-extracted) - *JSON*
- [sumneko_lua](https://github.com/sumneko/lua-language-server) - *Lua*
- [pyright](https://github.com/microsoft/pyright) - *Python*
- [vimls](https://github.com/iamcco/vim-language-server) - *VimScript*
- [yamlls](https://github.com/redhat-developer/yaml-language-server) - *YAML*

However, [many more LSP servers are supported](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md), so feel free to install and add them to `nvim/lua/lsp.lua` as you see fit.

Most LSP servers require [Node.js](https://nodejs.org/en/download/) and are installed via its `npm` package manager. Others (e.g. `yamlls`) require [yarn](https://classic.yarnpkg.com/lang/en/docs/install/), which may also be installed using `npm`. Out of the above, only `sumneko_lua` requires C++ compilation from source, whose steps are described in its project website linked to above.

If you want to learn how to use Neovim, the best way is simply to open a new instance on your terminal by typing `nvim`, followed by `:Tutor` once inside Neovim.

## 8. vim

[VI iMproved (VIM)](https://www.vim.org/about.php) is the successor of [vi](https://www.vim.org/viusers.php), a text editor which is included by default on most Linux distros. You therefore might have to [install vim](https://www.vim.org/download.php) in your particular operating system.

Its main advantage, aside from its sheer power as a text editor, is that you will find it on most Linux/Unix operating systems. Although I prefer Neovim, oftentimes in remote systems, vim is the only thing that you will have. :wink: Hence, it comes in handy to keep a custom `.vimrc` configuration file for it. Create a symbolic link in your `$HOME` directory, pointing to the `.vimrc` file in the `dotfiles` cloned repository.

vim also uses plugins to augment its functionality. Since vim 8.0, you can manage plugins natively via `packages`: simply clone the given plugin's git repository under `~./vim/pack/*/start/` (where * can be any directory name you like) and the plugin should autoload after restarting vim (for additional help, type `:h packages` inside vim). The below are the ones I currently use (*so far*):

- [catppuccin/vim](https://github.com/catppuccin/vim) - *Catppuccin theme*
- [junegunn/fzf](https://github.com/junegunn/fzf) - *FZF fuzzy file search (pre-requirement for the below)*
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) - *FZF fuzzy file search*
- [preservim/nerdtree](https://github.com/preservim/nerdtree) - *NERDTree file explorer*
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim) - *lightline statusline*
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons) - *render Nerd Font icons*

However, please feel free to add any plugins you like.

If you want to learn how to use vim, the best way is to simply type `vimtutor` into your terminal.
