return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    parsers = {
      css = true,
      names = {
        enable = true,
      },
      xterm = { enable = true },
      ls_colors = { enable = true },
    },
  },
}
