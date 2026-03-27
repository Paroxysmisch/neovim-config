return { -- Add nvim-ufo to your plugin list (assuming you use lazy.nvim or similar)
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- UFO folding settings
    vim.o.foldcolumn = '7'
    vim.o.foldlevel = 99 
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider needs remap `zR` and `zM`
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    -- Toggle sections more easily
    -- Use remap = true so Neovim knows to trigger the built-in 'zA' behavior
    vim.keymap.set('n', '<leader>gg', function()
      vim.cmd('normal! zA')
    end, { desc = 'Toggle fold recursively' })

    -- Treesitter as main provider
    require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end
    })
  end
}
