return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",        -- "storm", "moon", "night", or "day"
    transparent = true,     -- make background transparent
    terminal_colors = true, -- apply colors to terminal
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}

