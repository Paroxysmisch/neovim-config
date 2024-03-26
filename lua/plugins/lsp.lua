return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 
        "williamboman/mason.nvim",
        config = function()
          require('mason').setup()
        end,
      },
      { 
        "williamboman/mason-lspconfig.nvim",
        opt = { automatic_installation = true, },
        config = function()
          require('mason-lspconfig').setup()
        end,
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
    end,
  },
}
