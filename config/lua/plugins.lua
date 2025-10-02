
vim.pack.add({
    -- deps
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    -- plugins
    { src = "https://github.com/shaun-mathew/Chameleon.nvim" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
    { src = "https://github.com/IogaMaster/neocord" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/ThePrimeagen/refactoring.nvim" },
    { src = "https://github.com/s1n7ax/nvim-window-picker" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" }
});


-- add PackUpdate command
vim.api.nvim_create_user_command("PackUpdate", function (args)
    if args ~= "" then
        vim.pack.update();
    else
         for package in String_split(args, " ") do
             vim.pack.update(package, { force = true });
         end
    end
end, { desc = "Update all vim.pack packages" });

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
require("mini.pick").setup({});
require("gitsigns").setup({});

-- "hijack" netrw
if vim.bo.filetype == "netrw" and vim.b.netrw_method == nil then
    vim.defer_fn(function()
	vim.cmd("tabnew | Neotree current dir=" .. vim.b.netrw_curdir);
    end, 0)
end
