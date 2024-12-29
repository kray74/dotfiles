-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.opt
local ft = vim.filetype

-- show some invisible characters
o.list = true
o.listchars = {
  tab = "→ ",
  trail = "⁙",
  lead = "⁙",
  nbsp = "·",
  extends = "",
  precedes = "",
}
o.showbreak = "󱞾 "

-- indentation
o.expandtab = false
o.tabstop = 4
o.shiftwidth = 0 -- use tabstop
o.softtabstop = -1 -- use shiftwidth
o.smartindent = true

-- scroll
-- o.scrolloff = 5
-- o.sidescrolloff = 2

o.wrap = true

-- file types
ft.add({ extension = { container = "systemd" } })
ft.add({ extension = { volume = "systemd" } })
ft.add({ extension = { network = "systemd" } })
ft.add({ extension = { build = "systemd" } })
