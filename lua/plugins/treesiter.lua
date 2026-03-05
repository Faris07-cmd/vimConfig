return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'javascript', 'c++', 'python', 'lua', 'java', 'html', 'css'}, 
	},
}
