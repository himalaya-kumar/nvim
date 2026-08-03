-- DuoTone Dark Sea theme for Neovim
-- Source: https://github.com/sallar/vscode-duotone-dark

local M = {}

local colors = {
	bg = "#1b3a4b",
	bg_alt = "#14313d",
	fg = "#a4b4c4",
	fg_bright = "#e0e8f0",
	accent = "#ffcc99",
	accent2 = "#ff9966",
	comment = "#d6e9ff", -- Updated color for comments and docs
	keyword = "#ff9966",
	string = "#ffff99",
	number = "#99ccff",
	function_hl = "#ffd4a8",
	type = "#ffb380",
	operator = "#a4b4c4",
	variable = "#a4b4c4",
	constant = "#99ccff",
	error = "#ff6666",
	warn = "#ffcc66",
	info = "#99ccff",
	hint = "#66cccc",
	git_add = "#80ff99",
	git_change = "#ffcc66",
	git_delete = "#ff6666",
	cursor = "#ff9966",
	selection = "#354454",
	search = "#354454",
}

local highlights = {
	NormalNC = { fg = colors.fg, bg = colors.bg },
	NormalFloat = { fg = colors.fg, bg = colors.bg_alt },
	FloatBorder = { fg = colors.comment, bg = colors.bg_alt },
	Cursor = { fg = colors.bg, bg = colors.cursor },
	lCursor = { fg = colors.bg, bg = colors.cursor },
	CursorIM = { fg = colors.bg, bg = colors.cursor },
	CursorLine = { bg = colors.bg_alt },
	CursorColumn = { bg = colors.bg_alt },
	ColorColumn = { bg = colors.bg_alt },
	SignColumn = { bg = colors.bg, fg = colors.comment },
	LineNr = { fg = colors.comment },
	CursorLineNr = { fg = colors.accent },
	VertSplit = { fg = colors.bg_alt },
	Visual = { bg = colors.selection },
	VisualNOS = { bg = colors.selection },
	Search = { bg = colors.search, bold = true },
	IncSearch = { bg = colors.accent, fg = colors.bg },
	Substituted = { bg = colors.accent2, fg = colors.bg },
	MatchParen = { fg = colors.accent, bold = true },
	Directory = { fg = colors.info },
	Title = { fg = colors.fg_bright, bold = true },

	Comment = { fg = colors.comment, italic = true },
	SpecialComment = { fg = colors.hint },
	String = { fg = colors.string },
	Character = { fg = colors.string },
	StringRegex = { fg = colors.string },
	StringEscape = { fg = colors.accent },
	Keyword = { fg = colors.keyword },
	Statement = { fg = colors.keyword },
	Conditional = { fg = colors.keyword },
	Repeat = { fg = colors.keyword },
	Label = { fg = colors.keyword },
	Exception = { fg = colors.error },
	Function = { fg = colors.function_hl },
	Method = { fg = colors.function_hl },
	Type = { fg = colors.type },
	Identifier = { fg = colors.variable },
	Variable = { fg = colors.variable },
	Constant = { fg = colors.constant },
	Number = { fg = colors.number },
	Float = { fg = colors.number },
	Boolean = { fg = colors.number },
	Special = { fg = colors.hint },
	Operator = { fg = colors.operator },
	Delimiter = { fg = colors.operator },
	Punctuation = { fg = colors.operator },
	PreProc = { fg = colors.accent },
	Define = { fg = colors.accent },
	Macro = { fg = colors.accent },
	Include = { fg = colors.accent },
	StorageClass = { fg = colors.keyword },
	Structure = { fg = colors.type },

	DiagnosticError = { fg = colors.error },
	DiagnosticWarn = { fg = colors.warn },
	DiagnosticInfo = { fg = colors.info },
	DiagnosticHint = { fg = colors.hint },
	DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
	DiagnosticUnderlineWarn = { sp = colors.warn, undercurl = true },
	DiagnosticUnderlineInfo = { sp = colors.info, undercurl = true },
	DiagnosticUnderlineHint = { sp = colors.hint, undercurl = true },
	DiagnosticVirtualTextError = { fg = colors.error, bg = colors.bg_alt },
	DiagnosticVirtualTextWarn = { fg = colors.warn, bg = colors.bg_alt },
	DiagnosticVirtualTextInfo = { fg = colors.info, bg = colors.bg_alt },
	DiagnosticVirtualTextHint = { fg = colors.hint, bg = colors.bg_alt },
	DiagnosticFloatingError = { fg = colors.error, bg = colors.bg_alt },
	DiagnosticFloatingWarn = { fg = colors.warn, bg = colors.bg_alt },
	DiagnosticFloatingInfo = { fg = colors.info, bg = colors.bg_alt },
	DiagnosticFloatingHint = { fg = colors.hint, bg = colors.bg_alt },

	GitSignsAdd = { fg = colors.git_add },
	GitSignsChange = { fg = colors.git_change },
	GitSignsDelete = { fg = colors.git_delete },
	GitSignsAddNr = { fg = colors.git_add },
	GitSignsChangeNr = { fg = colors.git_change },
	GitSignsDeleteNr = { fg = colors.git_delete },
	GitSignsAddLn = { fg = colors.git_add },
	GitSignsChangeLn = { fg = colors.git_change },
	GitSignsDeleteLn = { fg = colors.git_delete },

	DiffAdd = { fg = colors.git_add, bg = "#1b4b30" },
	DiffChange = { fg = colors.git_change, bg = "#4b3a1b" },
	DiffDelete = { fg = colors.git_delete, bg = "#4b1b1b" },
	DiffText = { bg = "#4b3a1b" },

	TelescopeBorder = { fg = colors.comment, bg = colors.bg_alt },
	TelescopePromptBorder = { fg = colors.comment, bg = colors.bg_alt },
	TelescopeResultsBorder = { fg = colors.comment, bg = colors.bg_alt },
	TelescopePreviewBorder = { fg = colors.comment, bg = colors.bg_alt },
	TelescopePromptPrefix = { fg = colors.accent },
	TelescopeSelection = { bg = colors.selection },
	TelescopeMatching = { fg = colors.accent, bold = true },

	WhichKey = { fg = colors.fg_bright },
	WhichKeyGroup = { fg = colors.accent },
	WhichKeyDesc = { fg = colors.fg },
	WhichKeySeparator = { fg = colors.comment },

	FlashMatch = { fg = colors.accent, bg = colors.selection, bold = true },
	FlashLabel = { fg = colors.accent, bold = true },

	TreesitterContext = { bg = colors.bg_alt },
	TreesitterContextLineNumber = { fg = colors.accent },

	TodoFgTodo = { fg = colors.accent, bold = true },
	TodoFgFix = { fg = colors.error, bold = true },
	TodoComment = { fg = colors.comment },

	ErrorMsg = { fg = colors.error, bold = true },
	WarningMsg = { fg = colors.warn, bold = true },
	MoreMsg = { fg = colors.info },
	ModeMsg = { fg = colors.fg_bright, bold = true },
	Question = { fg = colors.accent },
	NonText = { fg = colors.comment },
	SpecialKey = { fg = colors.accent },
	WildMenu = { bg = colors.accent, fg = colors.bg },
	Pmenu = { bg = colors.bg_alt, fg = colors.fg },
	PmenuSel = { bg = colors.accent, fg = colors.bg },
	PmenuSbar = { bg = colors.bg_alt },
	PmenuThumb = { bg = colors.comment },
	StatusLine = { bg = colors.bg_alt, fg = colors.fg },
	StatusLineNC = { bg = colors.bg_alt, fg = colors.comment },
	WinBar = { bg = colors.bg_alt, fg = colors.comment },
	WinBarNC = { bg = colors.bg_alt, fg = colors.comment },
	TabLine = { bg = colors.bg_alt, fg = colors.comment },
	TabLineFill = { bg = colors.bg_alt },
	TabLineSel = { bg = colors.accent, fg = colors.bg },
	SpellBad = { sp = colors.error, undercurl = true },
	SpellCap = { sp = colors.info, undercurl = true },
	SpellLocal = { sp = colors.hint, undercurl = true },
	SpellRare = { sp = colors.accent, undercurl = true },
}

function M.apply()
	vim.cmd("hi clear")
	vim.g.colors_name = "duotone-dark-sea"
	for k, v in pairs(highlights) do
		vim.api.nvim_set_hl(0, k, v)
	end
end

function M.setup()
	if vim.fn.has("termguicolors") == 1 then
		vim.o.termguicolors = true
	end
	M.apply()
end

return M
