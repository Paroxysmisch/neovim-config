return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup()
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    vim.keymap.set('n', '<leader>po', require("peek").open, { desc = 'Open markdown preview' })
    vim.keymap.set('n', '<leader>pc', require("peek").close, { desc = 'Close markdown preview' })
  end,
}
