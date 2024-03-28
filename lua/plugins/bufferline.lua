return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup {
      options = {
        themeable = true,
        numbers = "buffer_id",
        indicator = { style = "underline" },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        color_icons = true,
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = false,
          }
        },
      },
    }
    vim.keymap.set('n', '<Tab>', ':BufferLinePick<CR>', { desc = 'Choose tab to move to' })
    vim.keymap.set('n', '<S-Tab>', ':BufferLinePickClose<CR>', { desc = 'Choose tab to close' })
    vim.keymap.set('n', '<Leader>bh', ':BufferLineMovePrev<CR>', { desc = 'Move tab left' })
    vim.keymap.set('n', '<Leader>bl', ':BufferLineMoveNext<CR>', { desc = 'Move tab right' })
  end,
}
