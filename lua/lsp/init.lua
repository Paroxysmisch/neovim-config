-- Global defaults for ALL servers
vim.lsp.config["*"] = {
  capabilities = vim.lsp.protocol.make_client_capabilities(),

  on_attach = function(_, bufnr)
    -- Enable omnifunc completion
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    -- LSP mappings
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gi", vim.lsp.buf.implementation)
    -- map("n", "gr", vim.lsp.buf.references)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "<C-k>", vim.lsp.buf.signature_help)
    map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end)
  end,
}

-- Mason → auto-enable everything installed
require("mason-lspconfig").setup()

