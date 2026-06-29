return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },

		-- BLINK ONLY: Replaces nvim-cmp, vsnip, and all cmp-sources
		{
			"saghen/blink.cmp",
			dependencies = { "saghen/blink.lib" },
			version = "*",
			opts = {
				keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				-- NATIVE CMDLINE completion (Replaces cmp-cmdline)
				cmdline = { enabled = true },
			},
		},
	},
	config = function()
		-- 1. LSP Attach & Diagnostic Config (Same as above)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
				map("grr", function() require("telescope.builtin").lsp_references() end, "[G]oto [R]eferences")
				map("gri", function() require("telescope.builtin").lsp_implementations() end, "[G]oto [I]mplementation")
				map("grd", function() require("telescope.builtin").lsp_definitions() end, "[G]oto [D]einition")
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gW", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "Open Workspace Symbols")
				map("grt", function() require("telescope.builtin").lsp_type_definitions() end, "[G]oto [T]ype Definition")

				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd(
						{ "CursorHold", "CursorHoldI" },
						{ buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.document_highlight }
					)
					vim.api.nvim_create_autocmd(
						{ "CursorMoved", "CursorMovedI" },
						{ buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.clear_references }
					)
				end
				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

		-- 2. SIMPLIFIED CAPABILITIES
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- 3. SERVER SETUP (Same as above)
		local lspconfig = require("lspconfig")
		local java_home = os.getenv("JAVA_HOME") or "/usr/lib/jvm/java-21-openjdk"
		local servers = {
			clangd = {},
			gopls = {
				settings = {
					gopls = {
						analyses = { unusedparams = true },
						staticcheck = true,
						gofumpt = true,
					},
				},
			},
			ts_ls = {
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
				},
			},
			jdtls = {
				settings = {
					java = {
						home = java_home,
						jdt = { ls = { vmargs = "-javaagent:" .. java_home .. "/lib/lombok.jar" } },
					},
				},
			},
			lemminx = {},
			lua_ls = { settings = { Lua = { completion = { callSnippet = "Replace" } } } },
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, { "stylua" })
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})
	end,
}
