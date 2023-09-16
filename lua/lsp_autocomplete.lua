require('packer').use {
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',
	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',
}

require('packer').use {'numToStr/Comment.nvim'}
require('Comment').setup()

require("packer").use {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	requires = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{
			'j-hui/fidget.nvim',
			tag = 'legacy',
		},
		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
}

require('packer').use {
	'hrsh7th/nvim-cmp',
	requires = {
		-- Snippet Engine & its associated nvim-cmp source
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',

		-- Adds LSP completion capabilities
		'hrsh7th/cmp-nvim-lsp',

		-- Adds a number of user-friendly snippets
		'rafamadriz/friendly-snippets',
	}
}

require('packer').use {
	-- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	requires = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
}

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc',
		'vim' },

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}
-- Setup neovim lua configuration
require('neodev').setup()

require('indent_blankline').setup {
	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- See `:help indent_blankline.txt`
	char = '┊',
	show_trailing_blankline_indent = false,
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jdtls",
		"gopls"
	}
});

local on_attach = function(_, _)
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({ 'n', 'x' }, 'F', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', 'CA', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

	vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	-- clangd = {},
	gopls = {},
	jdtls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- tsserver = {},
	-- html = { filetypes = { 'html', 'twig', 'hbs'} },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		--    ['<Tab>'] = cmp.mapping(function(fallback)
		--      if cmp.visible() then
		--        cmp.select_next_item()
		--      elseif luasnip.expand_or_locally_jumpable() then
		--        luasnip.expand_or_jump()
		--      else
		--        fallback()
		--      end

		--  end, { 'i', 's' }),
		--    ['<S-Tab>'] = cmp.mapping(function(fallback)
		--      if cmp.visible() then
		--        cmp.select_prev_item()
		--      elseif luasnip.locally_jumpable(-1) then
		--        luasnip.jump(-1)
		--      else
		--        fallback()
		--      end
		--    end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
require('fidget').setup {}
