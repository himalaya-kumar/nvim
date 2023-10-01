return {
  -- Add indentation guides even on blank lines
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`

  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local status_ok, indent_blankline = pcall(require, "ibl")
    if not status_ok then
      return
    end

    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:¶"
    vim.opt.listchars:append "tab:|⇢"
    vim.opt.listchars:append "trail:·"
    vim.opt.listchars:append "extends:>"
    vim.opt.listchars:append "precedes:<"

    indent_blankline.setup {
      enable = true,
      space_char_blankline = " ",
      indent = {
        char = "▎",
        tab_char = "▎",
        highlight = { "IndentBlanklineChar" },
      },
      whitespace = {
        enable = true,
        remove_blankline_trail = true,
        highlight = { "IndentBlanklineSpaceChar" },
      },
      scope = {
        enabled = true,
        char = "▎",
        -- Enable this to get highlight value
        show_start = false,
        show_end = false,
        injected_languages = true,
        highlight = { "IndentBlanklineContextChar" },
        priority = 1024,
        include = {
          node_type = {
            ["*"] = {
              "^argument",
              "^expression",
              "^for",
              "^if",
              "^import",
              "^type",
              "arguments",
              "block",
              "bracket",
              "declaration",
              "field",
              "func_literal",
              "function",
              "import_spec_list",
              "list",
              "return_statement",
              "short_var_declaration",
              "statement",
              "switch_body",
              "try",
              "block_mapping_pair",
            },
          },
        },
      },
      buftype_exclude = { "terminal", "nofile", "FTerm", "alpha" },
      exclude = {
        "help",
        "packer",
        "NvimTree",
        "conf",
        "alpha",
        "FTerm",
      },
    }
  end
}
