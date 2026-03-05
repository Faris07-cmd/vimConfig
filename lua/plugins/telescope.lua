return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	lazy = false,
	priority = 999,
	config = function()
		require('telescope').setup({
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".env" },
					hidden = true,
				}
			}
		})
	end,
}
