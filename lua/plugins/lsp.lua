---@diagnostic disable: undefined-global
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_list = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "html",
        "cssls",
        "tinymist",
      }
      for _, lsp in ipairs(lsp_list) do
        if lsp == "tinymist" then
          lspconfig["tinymist"].setup {
            capabilities = capabilities,
            offset_encoding = "utf-8",
            root_dir = function(fname)
              return lspconfig.util.path.dirname(fname)
            end,
          }
        else
          lspconfig[lsp].setup {
            capabilities = capabilities,
          }
        end
      end
    end,
  },
}
