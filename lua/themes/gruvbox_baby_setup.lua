return {
  "luisiacc/gruvbox-baby",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_baby_function_style   = "bold"
    vim.g.gruvbox_baby_keyword_style    = "NONE"   -- italic
    vim.g.gruvbox_baby_comment_style    = "NONE"   -- italic
    vim.g.gruvbox_baby_background_color = "medium" -- medium
    vim.g.gruvbox_baby_telescope_theme  = 1
    -- Enable transparent mode
    vim.g.gruvbox_baby_transparent_mode = 0
    vim.cmd([[colorscheme gruvbox-baby]])
  end,
}
