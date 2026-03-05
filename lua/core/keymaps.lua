vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.mouse = ""
local opts = { silent = true }

vim.opt.shiftwidth = 3
vim.opt.tabstop = 3

vim.keymap.set({ "n", "v" }, "<space>", "<Nop>", opts)
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)
vim.keymap.set("n", "<leader>sn", "<cmd> noautocmd w <CR>", opts)
vim.keymap.set("n", "<C-j>", "4j", opts)
vim.keymap.set("n", "<C-k>", "4k", opts)
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)
vim.keymap.set("n", "<x>", '"_x', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
-- arrow resize
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts) -- shrink height
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts) -- grow height
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts) -- shrink width
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts) -- grow width
---
---  window management
vim.keymap.set("n", "<Leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<Leader>h", "<C-w>s", opts)

-- Go to next buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
-- Go to previous buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
-- delete current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", opts)
-- Create a new empty buffer
vim.keymap.set("n", "<leader>a", function()
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("edit " .. dir .. "/")
end, { noremap = true, silent = true })
----------------------------------------------------

vim.keymap.set("n", "<leader>H", ":Alpha<CR>", { desc = "Go to Home Dashboard" })

----------------------------------------------------
vim.keymap.set("n", "<leader>ta", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)
------------------------------
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)
vim.keymap.set("v", "p", '"_dp', opts)

------------------------------------
---      Telescope kepmaps       ---
------------------------------------

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, vim.tbl_extend("force", opts, { desc = "Find files" }))

vim.keymap.set("n", "<leader>fg", builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Live grep" }))

vim.keymap.set("n", "<leader>fb", builtin.buffers, vim.tbl_extend("force", opts, { desc = "Buffers" }))

vim.keymap.set("n", "<leader>fh", builtin.help_tags, vim.tbl_extend("force", opts, { desc = "Help tags" }))

vim.keymap.set("n", "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, vim.tbl_extend("force", opts, { desc = "Toggle Neo-tree" }))
-- Git files (tracked files only, very fast)

vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })

-- Git commits (entire repo)
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })

-- Git commits for current file
vim.keymap.set("n", "<leader>gcf", builtin.git_bcommits, { desc = "Git file commits" })

-- Git branches
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })

-- Git status (like `git status`)
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
-------------------- ----------------- -----------------
--- D    E     B    U       G   -----------------------
--- ------------------------------------------------------
-- keymaps.lua
local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

harpoon:setup({})

-- Default UI keymaps
vim.keymap.set("n", "<leader>M", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
