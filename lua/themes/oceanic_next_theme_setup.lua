return {
  'mhartington/oceanic-next',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme OceanicNext]])
    -- require('lualine').setup {
    --   options = {
    --     -- ... your lualine config
    --     -- theme = 'OceanicNext'
    --     -- ... your lualine config
    --   }
    -- }
  end

}
