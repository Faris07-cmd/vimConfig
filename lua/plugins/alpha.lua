return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- ASCII girl + VIM header
		dashboard.section.header.val = {
			[[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                                    ]],
		}

		dashboard.section.header.opts.hl = "AlphaHeader"

		-- Centered buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find Word", ":Telescope live_grep<CR>"),
			dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
			dashboard.button("h", "  Home", ":Alpha<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- Footer
		dashboard.section.footer.val = " 🕸️  "
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Centered layout with vertical padding
		dashboard.opts.layout = {
			{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor((vim.fn.winheight(0) - 30) / 2) }) },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}

		alpha.setup(dashboard.opts)
	end,
}
