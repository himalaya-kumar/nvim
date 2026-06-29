return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<C-m>", "<Cmd>BufferPrevious<CR>", opts)
  end,
  opts = {
    sidebar_filetypes = {
      NvimTree = { text = "File Explorer" },
    },
  },
  version = "^1.0.0",
}
