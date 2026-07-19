-- Theme selection manager
-- Change `active` below to switch themes, or use :Telescope colorscheme for live preview
--
-- Available themes:
--   "gruber-darker"     (current default)
--   "catppuccin"
--   "gruvbox8"
--   "night-owl"
--   "gruvbox-material"
--   "tokyonight"
--   "mini"              (mini.nvim: ai, surround, statusline)
--   "kanagawa"
--   "rose-pine"
--   "everforest"
--   "cyberdream"

local active = "gruvbox8"

local theme_info = {
	["gruber-darker"] = { spec = "test.themes_poindres", repo = "blazkowolf/gruber-darker.nvim" },
	["catppuccin"] = { spec = "themes.catpuccin", repo = "catppuccin/nvim", name = "catppuccin" },
	["gruvbox8"] = { spec = "themes.gruvbox8", repo = "lifepillar/vim-gruvbox8" },
	["night-owl"] = { spec = "themes.nightOwl", repo = "oxfist/night-owl.nvim" },
	["gruvbox-material"] = { spec = "themes.gruvboxMaterial", repo = "sainnhe/gruvbox-material" },
	["tokyonight"] = { spec = "themes.tokyoNvim", repo = "folke/tokyonight.nvim" },
	["mini"] = { spec = "themes.miniNeovim", repo = "echasnovski/mini.nvim" },
	["kanagawa"] = { spec = "themes.kanagawa", repo = "rebelot/kanagawa.nvim" },
	["rose-pine"] = { spec = "themes.rosepine", repo = "rose-pine/neovim", name = "rose-pine" },
	["everforest"] = { spec = "themes.everforest", repo = "sainnhe/everforest" },
	["cyberdream"] = { spec = "themes.cyberdream", repo = "scottmckendry/cyberdream.nvim", name = "cyberdream" },
}

local result = {}

-- Active theme: full spec with colorscheme, loaded on startup
local info = theme_info[active]
if info then
	table.insert(result, require(info.spec))
else
	vim.api.nvim_echo({ { "Unknown theme '" .. active .. "', falling back to everforest", "WarningMsg" } }, true, {})
	table.insert(result, require(theme_info["everforest"].spec))
	active = "everforest"
end

-- Inactive themes: install but don't load (use :Telescope colorscheme to switch)
for name, info in pairs(theme_info) do
	if name ~= active then
		local spec = { info.repo, lazy = true }
		if info.name then
			spec.name = info.name
		end
		table.insert(result, spec)
	end
end

return result
