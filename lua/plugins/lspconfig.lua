return {

	-- Mason
	{
		"williamboman/mason.nvim",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "pylsp" },
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	-- Modern LSP Setup
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Basic capabilities (no cmp required)
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Keymaps when LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.enable("lua_ls")

			-- Python
			vim.lsp.config("pylsp", {
				capabilities = capabilities,
			})

			vim.lsp.enable("pylsp")
		end,
	},
}
