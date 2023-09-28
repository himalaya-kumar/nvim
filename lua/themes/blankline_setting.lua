return {
  -- Add indentation guides even on blank lines
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`

  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
  }
}
