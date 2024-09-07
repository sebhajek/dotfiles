# My dot-files

______________________________________________________________________

## Table of Contents

<!-- toc -->

- [Install](#install)
- [What is part of this?](#what-is-part-of-this)
  - [Development environment](#development-environment)
    - [Neovim](#neovim)
      - [Keymaps](#keymaps)
- [Credits and other interesting links](#credits-and-other-interesting-links)
  - [Dictionary](#dictionary)
  - [Color-scheme](#color-scheme)

<!-- tocstop -->

______________________________________________________________________

## Install

```bash
sudo zypper in bash curl
curl -L https://raw.githubusercontent.com/sebhajek/dotfiles/main/get.sh | bash
```

## What is part of this?

### Development environment

#### Neovim

Current Neovim configuration is done in a way where it supports tree-sitter,
telescope, C, Lua, Markdown, Latex, Bash, formatting for those languages and LSP
for those languages.
The color-scheme is also trying to be compatible with 16 ANSI colors to not be
particularly environment dependent.

##### Keymaps

| key-strokes  | command               |
|--------------|-----------------------|
| `<leader>ff` | telescope file finder |
| `<leader>gd` | LSP goto definition   |

## Credits and other interesting links

### Dictionary

- https://github.com/tvondra/ispell_czech

### Color-scheme

Inspirations:

- https://github.com/ishan9299/modus-theme-vim
- https://github.com/bluz71/vim-moonfly-colors
- https://github.com/nyoom-engineering/oxocarbon.nvim
- https://github.com/0xstepit/flow.nvim
- https://github.com/navarasu/onedark.nvim
- https://github.com/kyoz/purify
- https://github.com/liuchengxu/space-vim-dark
- https://github.com/djjcast/mirodark
- https://github.com/cwshugg/dwarrowdelf
