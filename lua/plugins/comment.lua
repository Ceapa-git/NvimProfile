return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = function()
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    return {
      -- Enable proper commenting behavior for TSX/JSX and other mixed-language files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}
