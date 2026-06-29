-- Plugin specifications for lazy.nvim

return {
  -- Core editing enhancements
  require("plugins.autoPairs"),
  require("plugins.indentLine"),
  require("plugins.autoFormat"),
  require("plugins.lint"),

  -- Navigation
  require("plugins.nvimTree"),
  require("plugins.telescopePlugin"),
  require("plugins.whichKey"),

  -- Language support
  require("plugins.treeSitter"),
  require("plugins.nvimLsp"),
  require("plugins.lazyDev"),

  -- Git
  require("plugins.gitSign"),

  -- Debugging
  require("plugins.debug"),

  -- Miscellaneous plugins
  require("plugins.pluginNoSetup"),

  -- Editor enhancements
  require("plugins.surround"),
  require("plugins.oil"),
  require("plugins.notify"),
  require("plugins.statusline"),

  -- Themes
  require("themes"),
  require("themes.alphaSetup"),
  require("themes.tabline"),

}
