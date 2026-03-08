-- none-ls.lua
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.ruff"),
				-- JavaScript / TypeScript
				null_ls.builtins.formatting.prettier,
				-- ✅ only lint when eslint config exists in project
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc",
							".eslintrc.json",
							".eslintrc.js",
							".eslintrc.cjs",
							"eslint.config.js",
							"eslint.config.mjs",
						})
					end,
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}

