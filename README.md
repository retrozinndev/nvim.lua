# retrozinndev's `.config/nvim`
My minimal neovim configuration with the plugins I use!

For managing plugins, I use Vim 8's native plugin manager (`vim.pack`).
To make this work on your environment, you need to use latest Neovim nightly.

## Commands
This config provides, for now, a command to update all plugins from the native manager.
Run `:PackUpdate` to update all the plugins. It is an alias for the lua api: `vim.pack.update()`.

After updating, neovim will open a new tab showing the commits that have been fetched. You can
confirm the update by saving the buffer tab(`:w`) or cancel by quitting the tab(`:q`).

## Plugins

- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim) : really good file explorer for neovim.
- [`IogaMaster/neocord`](https://github.com/IogaMaster/neocord) : amazing discord rich presence for neovim.
- [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) : developer icons for neovim.
- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): completion menu for neovim(I know there's a native one, I'll just change it later).
- [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim): lsp diagnostic info.
- [`folke/lazydev.nvim`](https://github.com/folke/lazydev.nvim): for tinkering my neovim configuration, with the runtime completion.
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): the treesitter to parse text syntax and add highlight and identation for them.
- [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig): of course, the language server configurations.
- [`shaun-mathew/Chameleon.nvim`](https://github.com/shaun-mathew/Chameleon.nvim): change kitty terminal's background according to neovim's one(fixes that border arround neovim when using padding).
- [`echasnovski/mini.pick`](https://github.com/echasnovski/mini.pick): mini picker for neovim, works just like telescope.
- [`maan2003/lsp_lines.nvim`](https://github.com/maan2003/lsp_lines.nvim): lsp diagnostics integrated in-buffer
- [`ThePrimeagen/refactoring.nvim`](https://github.com/ThePrimeagen/refactoring.nvim): a nice refactoring plugin for neovim, supports only a set of languages(see plugin README).
- [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim): plugin for viewing diffs and change feed in-file.

### Language-specific
A list of plugins that have focus on the use of a specific language.

- [`pmizio/typescript-tools.nvim`](https://github.com/pmizio/typescript-tools.nvim): diagnostics, lsp tools and more for developing with TypeScript

## Color schemes (themes)

- [`catppuccin`](https://github.com/catppuccin/nvim): the awesome catppuccin colorscheme (i use mocha sometimes).
- [`xiantang/darcula-dark.nvim`](https://github.com/xiantang/darcula-dark.nvim): jetbrains' darcula dark for neovim.
- [`rebelot/kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim): the nice kanagawa color scheme.
- [`nyoom-engineering/oxocarbon.nvim`](https://github.com/nyoom-engineering/oxocarbon.nvim): pretty different, but it looks awesome. **(enabled)**
- [`scottmckendry/cyberdream.nvim`](https://github.com/scottmckendry/cyberdream.nvim): a high-contrast and futuristic color scheme.

### Changing Themes (color schemes)
You can change the colorscheme temporarily by running `:colorscheme {preference}`, or, for session persistent colorscheme, edit the `init.lua` file, in the `vim.cmd.colorscheme` line, set the string to your preferred scheme.
