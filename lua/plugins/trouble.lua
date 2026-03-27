return {
  "folke/trouble.nvim",
  opts = {
    win = {
      size = 0.25, -- 25% of the editor width/height
    },
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>cD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[D]iagnostics (Trouble)",
    },
    {
      "<leader>cd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer [D]iagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[S]ymbols (Trouble)",
    },
    {
      "<leader>cr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / [R]eferences / ... (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "[L]ocation List (Trouble)",
    },
    {
      "<leader>cq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[Q]uickfix List (Trouble)",
    },
  },
}
