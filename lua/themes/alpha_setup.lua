return {
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
    --   local function get_listed_buffers()
    --     local buffers = {}
    --     local len = 0
    --     for buffer = 1, vim.fn.bufnr('$') do
    --       if vim.fn.buflisted(buffer) == 1 then
    --         len = len + 1
    --         buffers[len] = buffer
    --       end
    --     end
    --
    --     return buffers
    --   end
    --
    --   vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
    --   vim.api.nvim_create_autocmd('User', {
    --     pattern = 'BufferClose*',
    --     group = 'alpha_on_empty',
    --     callback = function(event)
    --       local found_non_empty_buffer = false
    --       local buffers = get_listed_buffers()
    --
    --       for _, bufnr in ipairs(buffers) do
    --         if not found_non_empty_buffer then
    --           local name = vim.api.nvim_buf_get_name(bufnr)
    --           local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    --
    --           if bufnr ~= event.buf and name ~= '' and ft ~= 'Alpha' then
    --             found_non_empty_buffer = true
    --           end
    --         end
    --       end
    --
    --       if not found_non_empty_buffer then
    --         -- require 'neo-tree'.close_all()
    --         vim.cmd [[:Alpha]]
    --       end
    --     end,
    --   })
  end
}
