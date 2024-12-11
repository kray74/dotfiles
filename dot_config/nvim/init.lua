local g = vim.g
local opt = vim.opt

-- disable new line comment
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove {"c", "r", "o"}
	end,
	group = general,
	desc = "disable new line comment"
})

-- use system clipboard
opt.clipboard = "unnamedplus"

-- line numbers
opt.number = true
opt.relativenumber = true

-- show some invisible characters (like tabs)
opt.list = true
opt.listchars = {
	tab = "→ ",
	trail = "⁙",
	lead = "⁙",
	nbsp = "·",
	extends = "",
	precedes = ""
}
opt.showbreak = "󱞾 "

-- highlight line under cursor
opt.cursorline = true

-- indentation settings
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 0    -- use tabstop
opt.softtabstop = -1  -- use shiftwidth
opt.smartindent = true

-- scroll options
opt.scrolloff = 5
opt.sidescrolloff = 2

-- split options
opt.splitbelow = true
opt.splitright = true

-- search options
opt.ignorecase = true
opt.smartcase = true

opt.spelloptions = "camel"

opt.pumblend = 5
opt.winblend = 5

opt.colorcolumn = "81"

-- opt.statusline

g.tabclose = "uselast"


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
g.mapleader = " "
g.maplocalleader = "\\"

vim.filetype.add({extension = {container = 'systemd'}})
vim.filetype.add({extension = {volume = 'systemd'}})
vim.filetype.add({extension = {network = 'systemd'}})
vim.filetype.add({extension = {build = 'systemd'}})

require("config.lazy")
