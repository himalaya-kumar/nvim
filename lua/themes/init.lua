-- Theme selection manager
-- Change `active` below to switch themes, or use :Telescope colorscheme for live preview
--
-- Available themes:
-- "gruber-darker" (current default)
-- "catppuccin"
-- "gruvbox8"
-- "night-owl"
-- "gruvbox-material"
-- "tokyonight"
-- "mini" (mini.nvim: ai, surround, statusline)
-- "kanagawa"
-- "rose-pine"
-- "everforest"
-- "cyberdream"
-- "duotone-dark-sea" (local-only)
-- "darkseav2" (atelierbram/Base2Tone-nvim, base2tone_sea_dark)

local active = "catppuccin"

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
	["darkseav2"] = { spec = "themes.darkseav2", repo = "atelierbram/Base2Tone-nvim" },
}

local result = {}

-- Local-only themes: apply directly, don't go through lazy.nvim
if active == "duotone-dark-sea" then
	local ok, theme = pcall(require, "themes.duoToneDarkSea")
	if ok and theme.setup then
		theme.setup()
	else
		vim.notify("Failed to load duotone-dark-sea theme", vim.log.levels.ERROR)
	end
else
	-- Active theme: load its plugin spec, or fall back
	local info = theme_info[active]
	if info then
		table.insert(result, require(info.spec))
	else
		vim.notify("Unknown theme '" .. active .. "', falling back to everforest", vim.log.levels.WARN)
		table.insert(result, require(theme_info["everforest"].spec))
		active = "everforest"
	end

	-- Inactive themes: install but don't load
	for name, info in pairs(theme_info) do
		if name ~= active and info.repo then
			local spec = { info.repo, lazy = true }
			if info.name then
				spec.name = info.name
			end
			table.insert(result, spec)
		end
	end
end

return result
