vim.g.mapleader = ' ';

-- mini.pick
vim.keymap.set('n', "<leader>/", ":Pick grep<CR>");
vim.keymap.set('n', "<leader>ff", ":Pick files<CR>");
vim.keymap.set('n', "<leader>rg", ":Pick grep_live<CR>");

-- trouble.nvim
vim.keymap.set('n', "<leader>xx", ":Trouble diagnostics toggle<CR>");
