return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		-- Default UI setup (optional, uncommented)
		-- vim.keymap.set("n", "<leader>M", function()
		--   harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)
		-- vim.keymap.set("n", "<leader>m", function()
		--   harpoon:list():add()
		-- end)
	end,
}

