-- https://github.com/catppuccin/nvim

local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("catppuccin").setup({
		flavour = "mocha"
	})
	vim.cmd.colorscheme "catppuccin"
end

return M
