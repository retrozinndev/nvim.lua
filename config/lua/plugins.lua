
vim.pack.add({
    -- deps
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    -- plugins
    { src = "https://github.com/shaun-mathew/Chameleon.nvim" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
    { src = "https://github.com/IogaMaster/neocord" },
    { src = "https://github.com/echasnovski/mini.pick" }
});

require("chameleon").setup();
require("neo-tree").setup({
    filesystem = {
	filtered_items = {
	    visible = true,
	    hide_gitignored = false,
	    hide_dotfiles = false
	},

	hijack_netrw_behavior = "open_default"
    }
});

require("neocord").setup({});

-- "hijack" netrw
if vim.bo.filetype == "netrw" and vim.b.netrw_method == nil then
    vim.defer_fn(function()
	vim.cmd("tabnew | Neotree current dir=" .. vim.b.netrw_curdir);
    end, 0)
end
