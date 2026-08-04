return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  init = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<C-m>", "<Cmd>BufferLineCyclePrev<CR>", opts)
  end,
  opts = {
    options = {
      mode = "buffers",
      numbers = "buffer_id",
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      separator_style = "thin",
      enforce_regular_bg = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
          padding = 0,
        },
      },
    },
  },
}
