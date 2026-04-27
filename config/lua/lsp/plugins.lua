vim.pack.add({
    { src = "https://github.com/folke/trouble.nvim", name = "Trouble" },
    { src = "https://github.com/maan2003/lsp_lines.nvim", name = "LspLines" }
});

-- trouble.nvim
require("trouble").setup();

-- lsplines
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false
});
local lslines = require("lsp_lines");
lslines.setup();
lslines.toggle();

-- treesitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = "^(type|java)script(react)?|(ba|z|fi)?sh|lua(u)?|q(ml(js)?|ss|js)|json(c)?$",
    callback = function(args)
        vim.treesitter.start(args.buf);
    end
})
