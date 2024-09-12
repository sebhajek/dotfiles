# My dot-files

______________________________________________________________________

## Table of Contents

<!-- toc -->

- [Install](#install)
- [What is part of this?](#what-is-part-of-this)
  - [Development environment](#development-environment)
    - [Neovim](#neovim)
      - [Key-maps](#key-maps)
- [Credits and other interesting links](#credits-and-other-interesting-links)
  - [Dictionary](#dictionary)
  - [Color-scheme](#color-scheme)

<!-- tocstop -->

______________________________________________________________________

## Install

```bash
sudo dnf in -y curl bash
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

##### Key-maps

| key-strokes   | command                   |
|---------------|---------------------------|
| `<leader>ff`  | telescope file finder     |
| `<leader>fg`  | telescope live grep       |
| `<leader>fb`  | telescope search buffers  |
| `<leader>fh`  | telescope help tags       |
| `<leader>gd`  | LSP go-to definition      |
| `<leader>gD`  | LSP go-to declaration     |
| `<leader>gr`  | LSP go-to reference       |
| `<leader>gr`  | LSP show code actions     |
| `K`           | LSP show docs             |
| `<leader>ft`  | conform apply format      |
| `<C-b>`       | scroll cmp docs down      |
| `<C-f>`       | scroll cmp docs up        |
| `<C-Space>`   | start cmp menu            |
| `<C-e>`       | end cmp menu              |
| `<CR>`        | confirm cmp option        |

## Credits and other interesting links

### Dictionary

- https://github.com/tvondra/ispell_czech

### Color-scheme

Inspirations:

- https://gist.github.com/ZEDGR/773fbb85ba4632ddc3423e45ed52738e
- https://github.com/bluz71/vim-moonfly-colors
- https://github.com/nyoom-engineering/oxocarbon.nvim
- https://github.com/navarasu/onedark.nvim
- https://github.com/liuchengxu/space-vim-dark
- https://github.com/djjcast/mirodark
- https://github.com/cwshugg/dwarrowdelf
