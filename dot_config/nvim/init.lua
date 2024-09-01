local g = vim.g
local opt = vim.opt

-- disable new line comment
vim.api.nvim_create_autocmd('BufEnter', {
	callback = function()
		vim.opt.formatoptions:remove {'c', 'r', 'o'}
	end,
	group = general,
	desc = 'disable new line comment'
})

-- use system clipboard
opt.clipboard = 'unnamedplus'

-- line numbers
opt.number = true
opt.relativenumber = true

-- show some invisible characters (like tabs)
opt.list = true
opt.listchars = { tab = '󰍟·', trail = '┄', lead = '┄'}
opt.showbreak = '󱞾 '

-- highlight line under cursor
opt.cursorline = true
opt.cursorlineopt = both

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

opt.spelloptions = 'camel'

opt.pumblend = 5
opt.winblend = 5

opt.colorcolumn = '81'

-- opt.statusline

g.tabclose = 'uselast'

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
	},
	-- Configure any other settings here. See the documentation for more details.
	-- -- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
