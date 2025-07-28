
require("lsplugins");
require("plugins");
require("colorschemes");

vim.o.number = true;
vim.o.relativenumber = false; -- I personally don't like this
vim.opt.termguicolors = true;
vim.o.cursorline = true;
vim.o.shiftwidth = 4;
vim.opt.fillchars = {
    eob = " "
};

vim.cmd("highlight StatusLine guibg=NONE");
