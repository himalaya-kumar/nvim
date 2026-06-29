local map = vim.keymap.set

map("i", "ii", "<Esc>", { desc = "Exit insert mode" })

map("n", "ss", "<cmd>w<CR>", { desc = "Save buffer" })

map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

map("n", "<C-d>", "yyp", { desc = "Duplicate line" })
map("i", "<C-d>", "<Esc>yyp", { desc = "Duplicate line" })
map("n", "<C-x>", "dd", { desc = "Cut line" })

map("n", "<C-t>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<C-y>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "gO", function()
  local ok, telescope = pcall(require, "telescope.builtin")
  if ok then
    telescope.lsp_document_symbols()
  end
end, { desc = "LSP: Document Symbols" })

map("n", "<A-j>", "ddjP", { desc = "Move line down" })
map("n", "<A-k>", "ddkP", { desc = "Move line up" })

map("n", "<C-q>", "<cmd>BufferClose<CR>", { desc = "Close buffer" })

map("n", "<C-\\>", "<cmd>terminal<CR>", { desc = "Open terminal" })
map("t", "ii", "<C-\\><C-n>", { desc = "Exit terminal" })
map("t", "aa", "<C-\\><C-n>", { desc = "Exit terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
