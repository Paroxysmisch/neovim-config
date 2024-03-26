return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'neo-tree' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
        lualine_b = { { 'filename', left_padding = 2 } },
        lualine_c = {
          'branch',
          '%=', --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = { 'fileformat', 'encoding' },
        lualine_y = { { 'progress', right_padding = 2 } },
        lualine_z = {
          { 'location', separator = { left = '', right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { { 'filename', separator = { left = '', right = '' } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'location', separator = { left = '', right = '' } } },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
