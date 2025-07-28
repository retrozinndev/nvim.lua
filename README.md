# retrozinndev's `.config/nvim`
My minimal neovim configuration with the plugins I use!

For managing plugins, I use Vim 8's native plugin manager (`vim.pack`).
To make this work on your environment, you need to use latest Neovim nightly.

## Plugins

- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim) : really good file explorer for neovim.
- [`IogaMaster/neocord`](https://github.com/IogaMaster/neocord) : amazing discord rich presence for neovim.
- [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) : developer icons for neovim.
- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): completion menu for neovim(I know there's a native one, I'll just change it later).
- [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim): lsp diagnostic info.
- [`folke/lazydev.nvim`](https://github.com/folke/lazydev.nvim): for tinkering my neovim configuration, with the runtime completion.
- [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig): of course, the language server configurations.
- [`shaun-mathew/Chameleon.nvim`](https://github.com/shaun-mathew/Chameleon.nvim): change kitty terminal's background according to neovim's one(fixes that border arround neovim when using padding).
- [`echasnovski/mini.pick`](https://github.com/echasnovski/mini.pick): mini picker for neovim, works just like telescope.

## Color schemes (themes)

- [`catppuccin`](https://github.com/catppuccin/nvim): the awesome catppuccin colorscheme (i use mocha sometimes).
- [`xiantang/darcula-dark.nvim`](https://github.com/xiantang/darcula-dark.nvim): jetbrains' darcula dark for neovim.
- [`rebelot/kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim): the nice kanagawa color scheme.
- [`nyoom-engineering/oxocarbon.nvim`](https://github.com/nyoom-engineering/oxocarbon.nvim): pretty different, but it looks awesome. **(enabled)**

### Changing Themes (color schemes)
You can change the colorscheme temporarily by running `:colorscheme {preference}`, or, for session persistent colorscheme, edit the `init.lua` file, in the `vim.cmd.colorscheme` line, set the string to your preferred scheme.
