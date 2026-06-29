return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = false,
      italic_comments = false,
      theme = {
        variant = "default",
      },
    })
    vim.cmd.colorscheme("cyberdream")
  end,
}
