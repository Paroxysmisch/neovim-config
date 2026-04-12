return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = {
      enabled = true,
      force_renderer = "kitty", -- Force the high-res protocol Snacks found
      markdown = { enabled = true },
      inline = true,
    },
    terminal = { enabled = true },
  },
}
