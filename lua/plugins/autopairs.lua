return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },

  -- autopairs setup options
  opts = {
    check_ts = true, -- enable Treesitter checks
    ts_config = {
      lua = { "string" },          -- don't add pairs inside Lua string nodes
      javascript = { "template_string" }, -- don't add pairs inside JS template strings
      java = false,                -- disable TS check for Java
    },
  },

  -- we still use a tiny config wrapper to both apply opts and hook into cmp
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- integrate with nvim-cmp: add matching closing pair after confirming a completion
    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}

