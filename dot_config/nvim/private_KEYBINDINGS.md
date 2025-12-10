# Neovim Keybindings Reference

This document lists all custom keybindings configured in this Neovim setup. Use this as a reference to avoid conflicts when adding new mappings.

## General

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<Space>.` | Save current file | lua/main_config/remap.lua:5 |
| Normal | `<Space>s` | Reload current file (`:so`) | lua/main_config/remap.lua:6 |
| Normal | `<leader>t` | Toggle floating terminal | lua/main_config/remap.lua:43 |
| Terminal | `<C-Del>` | Exit terminal mode and close | lua/main_config/remap.lua:44 |

## Clipboard Operations

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal, Visual | `gy` | Yank to system clipboard | lua/main_config/remap.lua:8 |
| Normal, Visual | `gp` | Paste from system clipboard | lua/main_config/remap.lua:9 |
| Normal, Visual | `x` | Delete without yanking (blackhole register) | lua/main_config/remap.lua:10 |
| Normal, Visual | `X` | Delete without yanking (blackhole register) | lua/main_config/remap.lua:11 |
| Normal | `<leader>a` | Select all text (ggVG) | lua/main_config/remap.lua:12 |

## Window Management

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>h` | Move to left window | lua/main_config/remap.lua:25 |
| Normal | `<leader>j` | Move to bottom window | lua/main_config/remap.lua:26 |
| Normal | `<leader>k` | Move to top window | lua/main_config/remap.lua:27 |
| Normal | `<leader>l` | Move to right window | lua/main_config/remap.lua:28 |
| Normal | `<leader><leader>h` | Split window horizontally | lua/main_config/remap.lua:29 |
| Normal | `<leader><leader>v` | Split window vertically | lua/main_config/remap.lua:30 |
| Normal | `<leader><leader>q` | Close current window | lua/main_config/remap.lua:31 |

## Spell Checking

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>sp` | Toggle spell check | lua/main_config/remap.lua:16-19 |
| Normal | `<leader>sn` | Jump to next spelling error | lua/main_config/remap.lua:20 |
| Normal | `<leader>sN` | Jump to previous spelling error | lua/main_config/remap.lua:21 |
| Normal | `<leader>sa` | Add word to dictionary | lua/main_config/remap.lua:22 |
| Normal | `<leader>s?` | Suggest spelling corrections | lua/main_config/remap.lua:23 |

## File Navigation (Telescope)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>pf` | Find files (all files) | after/plugin/telescope.lua:5 |
| Normal | `<C-p>` | Find files (git files only) | after/plugin/telescope.lua:9 |
| Normal | `<leader>ps` | Grep search with prompt | after/plugin/telescope.lua:6-8 |

## Search & Replace (grug-far)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal, Visual | `<leader>sr` | Search & Replace (project / by ext) | lua/plugins/far.lua:11-26 |
| Normal, Visual | `<leader>sm` | Search & Replace (PCRE2 multiline) | lua/plugins/far.lua:29-42 |
| Normal, Visual | `<leader>sw` | Search & Replace (literal text) | lua/plugins/far.lua:45-57 |
| Normal, Visual | `<leader>sf` | Search & Replace (current file) | lua/plugins/far.lua:60-72 |

## File Explorer (Oil.nvim)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `-` | Open parent directory in floating window | after/plugin/oil.lua:148 |

### Oil Buffer Keymaps (when in Oil buffer)

| Keybinding | Action | Source |
|------------|--------|--------|
| `g?` | Show help | after/plugin/oil.lua:52 |
| `<CR>` | Select/open file or directory | after/plugin/oil.lua:53 |
| `<Esc>` | Close Oil buffer | after/plugin/oil.lua:58 |
| `<C-c>` | Close Oil buffer | after/plugin/oil.lua:59 |
| `Q` | Close Oil buffer | after/plugin/oil.lua:60 |
| `<C-l>` | Refresh view | after/plugin/oil.lua:61 |
| `-` | Go to parent directory | after/plugin/oil.lua:62 |
| `_` | Open current working directory | after/plugin/oil.lua:63 |
| `` ` `` | Change directory (cd) | after/plugin/oil.lua:64 |
| `~` | Change directory for tab (tcd) | after/plugin/oil.lua:65 |
| `gs` | Change sort order | after/plugin/oil.lua:66 |
| `gx` | Open with external program | after/plugin/oil.lua:67 |
| `g.` | Toggle hidden files | after/plugin/oil.lua:68 |

## Harpoon (Quick File Navigation)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>=` | Add current file to Harpoon | lua/plugins/harpoon.lua:10-12 |
| Normal | `<leader>m` | Toggle Harpoon quick menu | lua/plugins/harpoon.lua:15-17 |
| Normal | `<leader>1` through `<leader>9` | Jump to Harpoon file 1-9 | lua/plugins/harpoon.lua:20-24 |

## Git (Fugitive)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>gs` | Open Git status | after/plugin/fugitive.lua:1 |

## Undo Tree

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>u` | Toggle Undo Tree | after/plugin/undotree.lua:1 |

## LSP (Language Server Protocol)

### Navigation

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `Gd` | Go to definition | lua/plugins/lsp.lua:24 |
| Normal | `GD` | Go to declaration | lua/plugins/lsp.lua:25 |
| Normal | `Gr` | Show references | lua/plugins/lsp.lua:26 |
| Normal | `Gi` | Go to implementation | lua/plugins/lsp.lua:27 |

### Information & Actions

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `K` | Show hover documentation | lua/plugins/lsp.lua:30 |
| Normal | `<leader>rn` | Rename symbol | lua/plugins/lsp.lua:31 |
| Normal | `<leader>ca` | Code actions | lua/plugins/lsp.lua:32 |

### Diagnostics

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `[d` | Go to previous diagnostic | lua/plugins/lsp.lua:35 |
| Normal | `]d` | Go to next diagnostic | lua/plugins/lsp.lua:36 |
| Normal | `<leader>e` | Open diagnostic float | lua/plugins/lsp.lua:37 |
| Normal | `<leader>q` | Set location list with diagnostics | lua/plugins/lsp.lua:38 |

## Completion (nvim-cmp)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Insert | `<C-b>` | Scroll documentation up | lua/plugins/cmp.lua:26 |
| Insert | `<C-f>` | Scroll documentation down | lua/plugins/cmp.lua:27 |
| Insert | `<C-Space>` | Trigger completion | lua/plugins/cmp.lua:28 |
| Insert | `<C-e>` | Abort completion | lua/plugins/cmp.lua:29 |
| Insert | `<CR>` | Confirm completion | lua/plugins/cmp.lua:30 |

## Snippets (LuaSnip)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Insert, Select | `<Tab>` | Expand snippet or jump to next placeholder | after/plugin/luasnip.lua:45 |
| Insert, Select | `<S-Tab>` | Jump to previous placeholder | after/plugin/luasnip.lua:46 |
| Insert, Select | `<C-e>` | Change choice in snippet | after/plugin/luasnip.lua:47 |

## Copilot

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Insert | `<C-l>` | Accept full Copilot suggestion | lua/plugins/copilot.lua:19 |
| Insert | `<M-l>` | Accept next word of suggestion | lua/plugins/copilot.lua:26 |
| Insert | `<M-L>` | Accept line of suggestion | lua/plugins/copilot.lua:31 |
| Insert | `<M-]>` | Next Copilot suggestion | lua/plugins/copilot.lua:36 |
| Insert | `<M-[>` | Previous Copilot suggestion | lua/plugins/copilot.lua:41 |
| Normal | `<leader><leader>c` | Toggle Copilot on/off | lua/plugins/copilot.lua:59 |

## Image Pasting (img-clip.nvim)

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader><leader>p` | Paste image from system clipboard | lua/plugins/img-clip.lua:102 |

## Surround (nvim-surround)

Uses default nvim-surround keybindings (see `:h nvim-surround` for details):
- `ys{motion}{char}` - Add surrounding
- `ds{char}` - Delete surrounding
- `cs{target}{replacement}` - Change surrounding
- Visual mode: `S{char}` - Surround selection

Source: lua/plugins/nvim-surround.lua:1-10

## Filetype-Specific Keybindings

### Python Files

| Mode | Keybinding | Action | Source |
|------|------------|--------|--------|
| Normal | `<leader>b` | Format with Black | lua/main_config/remap.lua:52 |

## Notes

- Leader key is mapped to Space (`<Space>`)
- Some keybindings in Oil.nvim are only active when inside an Oil buffer
- Copilot is disabled by default and can be toggled with `<leader><leader>c`
- Copilot tab mapping is disabled by default (`copilot_no_tab_map = true`)
- LuaSnip's `<C-e>` in insert/select mode conflicts with nvim-cmp's abort, but they're used in different contexts
- Oil.nvim uses `<C-l>` in its buffer, but Copilot's `<C-l>` only works in insert mode, so no conflict
