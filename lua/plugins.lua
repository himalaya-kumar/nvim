return {
  -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
      end,
    },
  },


  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'nightfox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- require'alpha'.setup(require'alpha.themes.startify'.config)
      local alpha = require 'alpha'
      local startify = require 'alpha.themes.startify'
      startify.section.header.val = {
        [[]],
        [[								       ]],
        [[          _ _  __      _   _                               _ _       ]],
        [[    ____ | | |/ _|    | | | |                             | (_)      ]],
        [[   / __ \| | | |_ __ _| |_| |__   ___ _ __        ___   __| |_ _ __  ]],
        [[  / / _` | | |  _/ _` | __| '_ \ / _ \ '__|      / _ \ / _` | | '_ \ ]],
        [[ | | (_| | | | || (_| | |_| | | |  __/ |     _  | (_) | (_| | | | | |]],
        [[  \ \__,_|_|_|_| \__,_|\__|_| |_|\___|_|    ( )  \___/ \__,_|_|_| |_|]],
        [[   \____/                                   |/		       ]],
        [[								       ]],
        [[]]
      }
      alpha.setup(startify.config)
      --     require'alpha'.setup(require'alpha.themes.startify'.config)
      local function get_listed_buffers()
        local buffers = {}
        local len = 0
        for buffer = 1, vim.fn.bufnr('$') do
          if vim.fn.buflisted(buffer) == 1 then
            len = len + 1
            buffers[len] = buffer
          end
        end

        return buffers
      end

      vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'BufferClose*',
        group = 'alpha_on_empty',
        callback = function(event)
          local found_non_empty_buffer = false
          local buffers = get_listed_buffers()

          for _, bufnr in ipairs(buffers) do
            if not found_non_empty_buffer then
              local name = vim.api.nvim_buf_get_name(bufnr)
              local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

              if bufnr ~= event.buf and name ~= '' and ft ~= 'Alpha' then
                found_non_empty_buffer = true
              end
            end
          end

          if not found_non_empty_buffer then
            -- require 'neo-tree'.close_all()
            vim.cmd [[:Alpha]]
          end
        end,
      })
    end
  },
  require 'themes.nightfox_setup',
  require 'dev.debug',
  require 'dev.autoformat',
  require 'themes.tabline_setup',
  require 'dev.toggle_term',
}
