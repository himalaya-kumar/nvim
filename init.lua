require('config')
require('keybindings')
require('packerPlugins')
require('welcomescreen')
-- require('nordsetting')
require('nightflyTheme')
require('codeFormatter')
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

-- For FOlding code 
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Open nvim tree
-- vim.api.nvim_exec([[au VimEnter *  NERDTree]],false)
--require("nvim-tree").setup()

-- vim.api.nvim_exec([[set list]],false)

-- Night fly color Scheme
-- vim.cmd[[colorscheme nightfly]]
-- vim.cmd[[set termguicolors]]
-- vim.g.nightflyCursorColor = 1
-- vim.g.nightflyItalics = 1

-- require ('lualine').setup({options = { theme = 'nord' }})
-- require ('lualine').setup({options = { theme = 'nightfly' }})
--
vim.api.nvim_exec([[inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]],false)
 
