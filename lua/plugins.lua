-- Plugin specifications for lazy.nvim

return {
  -- Core editing enhancements
  require("plugins.autoPairs"),
  require("plugins.autoFormat"),
  require("plugins.indentLine"),
  require("plugins.lint"),

  -- Navigation
  require("plugins.nvimTree"),
  require("plugins.telescopePlugin"),
  require("plugins.whichKey"),
  require("plugins.flash"),

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
  require("plugins.statusline"),

  -- Theme references
  require("themes"),
  require("themes.tabline"),
  require("themes.alphaSetup"),

  -- Visual
  require("plugins.notify"),

}
