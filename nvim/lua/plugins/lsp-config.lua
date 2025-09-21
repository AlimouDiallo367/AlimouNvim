return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "ruby_lsp", "omnisharp" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- TypeScript
			vim.lsp.config("ts_ls", { capabilities = capabilities })
			vim.lsp.enable("ts_ls")

			-- Rust
			vim.lsp.config("rust_analyzer", { capabilities = capabilities })
			vim.lsp.enable("rust_analyzer")

			-- Ruby
			vim.lsp.config("ruby_lsp", { capabilities = capabilities })
			vim.lsp.enable("ruby_lsp")

			-- C#
			vim.lsp.config("omnisharp", { capabilities = capabilities })
			vim.lsp.enable("omnisharp")
      
      -- Godot 
			local gdserver = "/home/thalimoud/Godot/Godot_v4.5.x86_64"
			vim.lsp.config("gdscript", {
				cmd = { gdserver, "--headless", "--editor", "--language-server" },
				filetypes = { "gdscript" },
				root_dir = vim.fs.root(0, { "project.godot", ".git" }),
				capabilities = capabilities,
			})

			vim.lsp.enable("gdscript")
			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
