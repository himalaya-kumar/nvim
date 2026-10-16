return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>g", "<cmd>Neogit<cr>", desc = "Git status (Neogit)" },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
  },
}
