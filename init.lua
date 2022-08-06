require('config')
require('keybindings')
require('packerPlugins')
require('welcomescreen')
-- require('nordsetting')
require('nightflyTheme')

require('packer').use { 'mhartington/formatter.nvim' }

local configs = require('nvim-treesitter.configs')
  configs.setup {
    ensure_installed = "java", -- Only use parsers that are maintained
    highlight = { -- enable highlighting
      enable = true, 

    },
  indent = {
    enable = true, -- default is disabled anyways
  }

}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

-- For FOlding code 
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Open nvim tree
--vim.api.nvim_exec([[au VimEnter *  NERDTree]],false)
--require("nvim-tree").setup()


-- Night fly color Scheme
-- vim.cmd[[colorscheme nightfly]]
-- vim.cmd[[set termguicolors]]
-- vim.g.nightflyCursorColor = 1
-- vim.g.nightflyItalics = 1

-- require ('lualine').setup({options = { theme = 'nord' }})
-- require ('lualine').setup({options = { theme = 'nightfly' }})
