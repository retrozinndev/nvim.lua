
require("plugins");
require("lsplugins");
require("colorschemes");
require("keymaps");

vim.o.number = true;
-- vim.o.relativenumber = true; -- I personally don't like this
vim.opt.termguicolors = true;
vim.o.expandtab = true;
vim.bo.softtabstop = 4;
vim.o.winborder = "rounded";
vim.o.cursorline = true;
vim.o.shiftwidth = 4;
vim.opt.fillchars = {
    eob = " "
};

vim.cmd("highlight StatusLine guibg=NONE");
