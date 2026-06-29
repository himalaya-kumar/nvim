return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      styles = {
        italic = false,
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
