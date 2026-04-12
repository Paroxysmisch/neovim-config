-- GitSigns
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
    },
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            auto_attach = true,
            on_attach = function(bufnr)
                -- Use vim.keymap.set instead of 'map'
                -- We also add { buffer = bufnr } so the shortcut only works in git buffers
                vim.keymap.set("n", "<leader>d", function()
                    gitsigns.setqflist("all")
                end, { buffer = bufnr, desc = "Gitsigns: Set QF List" })
                vim.keymap.set("n", "<leader>ds", function()
                    gitsigns.stage_hunk()
                end, { buffer = bufnr, desc = "Gitsigns: Stage Hunk" })
                vim.keymap.set("n", "<leader>dr", function()
                    gitsigns.reset_hunk()
                end, { buffer = bufnr, desc = "Gitsigns: Reset Hunk" })
                vim.keymap.set("n", "<leader>dp", function()
                    gitsigns.preview_hunk()
                end, { buffer = bufnr, desc = "Gitsigns: Preview Hunk" })
                vim.keymap.set("n", "<leader>db", function()
                    gitsigns.toggle_current_line_blame()
                end, { buffer = bufnr, desc = "Gitsigns: Toggle current line Blame" })
                vim.keymap.set("n", "<leader>dd", function()
                    gitsigns.diffthis()
                end, { buffer = bufnr, desc = "Gitsigns: Diffthis" })
                vim.keymap.set("n", "[d", function()
                    gitsigns.nav_hunk('prev')
                end, { buffer = bufnr, desc = "Gitsigns: Navigate to previous hunk" })
                vim.keymap.set("n", "]d", function()
                    gitsigns.nav_hunk('next')
                end, { buffer = bufnr, desc = "Gitsigns: Navigate to next hunk" })
            end,
        })
    end,
}
