require("util");
require("lsp/plugins");
require("lsp/cmp");

local capabilities = vim.lsp.protocol.make_client_capabilities();
local servers = {
    bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" }
    },
    astro = {
        cmd = { "astro-ls", "--stdio" },
        filetypes = { "astro" }
    },
    pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" }
    },
    somesass_ls = {
        cmd = { "some-sass-language-server", "--stdio" },
        filetypes = { "scss", "sass" }
    },
    mesonlsp = {
        cmd = { "mesonlsp", "--lsp" },
        filetypes = { "meson" }
    },
    clangd = {
        cmd = { "clangd" },
        filetypes = { "cpp", "c" }
    },
    nushell = {
        cmd = { "nu", "--lsp" },
        filetypes = { "nu" }
    },
    blueprint_ls = {
        cmd = { "blueprint-compiler", "lsp" },
        filetypes = { "blueprint" }
    },
    ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    },
    nil_ls = {
        cmd = { "nil", "--stdio" },
        filetypes = { "nix" }
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        diagnostics = {
            enable = true
        }
    },
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
	settings = {
	    Lua = {
		telemetry = {
		    enable = false;
		},
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
                }
	    }
	}
    },
    qmlls = {
        cmd = { "qmlls6" },
        filetypes = { "qml" },
        single_file_support = true
    },
    html = {
        cmd = { "vscode-html-languageserver", "--stdio" },
        filetypes = { "html", "html5" }
    },
    jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json" }
    },
    cssls = {
        cmd = { "vscode-css-languageserver", "--stdio" },
	filetypes = { "css", "sass", "scss" }
    },
    jdtls = {
        filetypes = { "java" },
	java = {
	    signatureHelp = {
		enabled = true;
	    }
	}
    }
};

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities);
for server, userconfig in pairs(servers) do
    if type(userconfig) == "table" and Dict_table_len(userconfig) > 0 then
        vim.lsp.config(server, userconfig);
    end

    vim.lsp.enable(server);
    vim.lsp.config(server, {
        capabilities = Merge_dict_tables(cmp_capabilities, {
            semanticTokensProvider = nil
        }, true);
    });
end
