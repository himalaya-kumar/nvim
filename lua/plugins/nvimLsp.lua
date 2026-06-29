return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },

    {
      "saghen/blink.cmp",
      dependencies = { "saghen/blink.lib" },
      version = "*",
      opts = {
        keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        cmdline = { enabled = true },
      },
    },
  },
  config = function()
    local map = vim.keymap.set

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local buf = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
          return
        end

        map("n", "grn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP: [R]e[n]ame" })
        map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { buffer = buf, desc = "LSP: [G]oto Code [A]ction" })
        map("n", "grr", function() require("telescope.builtin").lsp_references() end, { buffer = buf, desc = "LSP: [G]oto [R]eferences" })
        map("n", "gri", function() require("telescope.builtin").lsp_implementations() end, { buffer = buf, desc = "LSP: [G]oto [I]mplementation" })
        map("n", "grd", function() require("telescope.builtin").lsp_definitions() end, { buffer = buf, desc = "LSP: [G]oto [D]efinition" })
        map("n", "grD", vim.lsp.buf.declaration, { buffer = buf, desc = "LSP: [G]oto [D]eclaration" })
        map("n", "gW", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { buffer = buf, desc = "LSP: Workspace Symbols" })
        map("n", "grt", function() require("telescope.builtin").lsp_type_definitions() end, { buffer = buf, desc = "LSP: [G]oto [T]ype Definition" })

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = buf, group = group, callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = buf, group = group, callback = vim.lsp.buf.clear_references,
          })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
          end, { buffer = buf, desc = "LSP: [T]oggle Inlay [H]ints" })
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

    local capabilities = require("blink.cmp").get_lsp_capabilities()

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

    local ensure_installed = {
      "clangd", "gopls", "typescript-language-server", "jdtls", "lemminx",
      "lua-language-server", "stylua",
    }
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for server_name, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
      vim.lsp.config(server_name, config)
    end

    vim.lsp.enable(vim.tbl_keys(servers))
  end,
}
