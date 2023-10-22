return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox8]])
    vim.cmd([[set termguicolors]])
  end
}

-- TO ADD Multiline comment in lua
--[=====[
--]=====]
