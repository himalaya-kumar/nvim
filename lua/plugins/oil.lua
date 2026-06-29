return {
  "stevearc/oil.nvim",
  cmd = { "Oil" },
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-p>"] = false,
    },
  },
}
