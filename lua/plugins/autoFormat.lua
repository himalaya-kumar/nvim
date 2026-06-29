return { -- Async formatting plugin
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			go = { "gofmt", "goimports" },
			python = { "black" },
			markdown = { "marksman", "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "jq" },
			yaml = { "yamlfmt" },
			rust = { "rustfmt" },
			toml = { "taplo" },
			proto = { "buf" },
			sql = { "sqlfmt" },
		},
	},
}