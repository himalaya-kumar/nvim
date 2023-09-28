return {
  'rmehri01/onenord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Lua
    require('onenord').setup()
    require('lualine').setup {
      options = {
        -- ... your lualine config
        theme = 'onenord'
        -- ... your lualine config
      }
    }
  end

}
