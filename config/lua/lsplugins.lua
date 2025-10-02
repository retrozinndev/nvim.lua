
vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", name = "LspConfig" },
    { src = "https://github.com/folke/lazydev.nvim", name = "Lazydev" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "Treesitter" },
    { src = "https://github.com/folke/trouble.nvim", name = "Trouble" },
    { src = "https://github.com/maan2003/lsp_lines.nvim", name = "LspLines" },
    { src = "https://github.com/hrsh7th/nvim-cmp", name = "Cmp" },

    -- language-specific
    { src = "https://github.com/pmizio/typescript-tools.nvim" }
});

-- completion source plugins
local sources = {
    "cmp-nvim-lsp",
    "cmp-cmdline",
    "cmp-path",
    "cmp-buffer",
    "cmp-nvim-lsp-signature-help"
};

for _, source in ipairs(sources) do
    vim.pack.add({
	{ src = "https://github.com/hrsh7th/" .. source }
    });
end

local servers = {
    "html",
    "bashls",
    "awk_ls",
    "pyright",
    "somesass_ls",
    "jsonls",
    "mesonlsp",
    "clangd",
    "emmet_language_server",
    "hyprls",
    "nushell",
    "blueprint_ls"
};

local config_servers = {
    gradle_ls = {
	root_markers = { "settings.gradle", "build.gradle" },
	filetypes = { "groovy", "kts" }
    },
    lua_ls = {
	settings = {
	    Lua = {
		telemetry = {
		    enable = false;
		}
	    }
	}
    },
    cssls = {
	filetypes = { "css" };
    },
    jdtls = {
	java = {
	    signatureHelp = {
		enabled = true;
	    }
	}
    }
}

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false
})

require("lsp_lines").setup();
require("lsp_lines").toggle(); -- enable on startup

local function expand_capabilities(server)
    if type(server) ~= "string" then
    	return;
    end

    local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities();

    vim.lsp.config(server, {
	capabilities = cmp_capabilities;
    });
end

for _, server in ipairs(servers) do
    vim.lsp.enable(server);
    expand_capabilities(server);
end

for server, config in pairs(config_servers) do
    vim.lsp.config(server, config);
    vim.lsp.enable(server, true);
    expand_capabilities(server);
end


require("lazydev").setup({
    library = {
	{ path = "${3rd}/luv/library", words = { "vim%.uv" } }
    }
});

require("typescript-tools").setup({
    settings = {
        tsserver_plugins = {
            "@astrojs/ts-plugin"
        }
    }
});

require("nvim-treesitter.configs").setup({
    auto_install = true,
    sync_install = true;
    highlight = {
	enable = true;
    }
});

require("trouble").setup();

local cmp = require("cmp");

cmp.setup.cmdline({ '/', '?',}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = "buffer" }
    },
    matching = {
	disallow_symbol_nonprefix_matching = false,
	disallow_fullfuzzy_matching = false,
	disallow_fuzzy_matching = false,
	disallow_partial_fuzzy_matching = false,
	disallow_partial_matching = true,
	disallow_prefix_unmatching = false
    };
});

cmp.setup.cmdline({':'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = "cmdline" }
    }, {
	{ name = "path"}
    }
});

cmp.setup({
    snippet = {
	expand = function(args)
	    vim.snippet.expand(args.body);
	end
    },

    mapping = cmp.mapping.preset.insert({
	['<C-b'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.abort(),
	['<C-Space>'] = cmp.mapping.complete(),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    window = {
	documentation = cmp.config.window.bordered(),
	cmp = cmp.config.window.bordered()
    },
    sources = cmp.config.sources({
	{ name = "nvim_lsp" },
	{ name = "lazydev", group_index = 0 },
        { name = "nvim_lsp_signature_help" }
    }, {
	{ name = "buffer" }
    })
});
