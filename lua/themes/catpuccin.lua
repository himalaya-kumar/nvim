return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Color Scheme Activation
    vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
    -- vim.cmd [[colorscheme catppuccin]]
    -- require('lualine').setup { options = { theme = 'frappe' } }
  end
}
