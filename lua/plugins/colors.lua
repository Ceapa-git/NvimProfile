return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- Apply the colorscheme first
    vim.cmd.colorscheme("moonfly")

    -- Make background transparent
    local groups = {
      "Normal", "NonText", "LineNr", "SignColumn", "EndOfBuffer"
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
