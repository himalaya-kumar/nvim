return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd [[colorscheme tokyonight-storm]]
    -- Lua
    require('lualine').setup {
      options = {
        -- ... your lualine config
        theme = 'tokyonight'
        -- ... your lualine config
      }
    }
  end
}
-- colorscheme tokyonight
-- There are also colorschemes for the different styles.
-- colorscheme tokyonight-night
-- colorscheme tokyonight-storm
-- colorscheme tokyonight-day
-- colorscheme tokyonight-moon
