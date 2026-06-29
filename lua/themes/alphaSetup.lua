return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-web-devicons").has_loaded()
    local startify = require("alpha.themes.startify")

    startify.section.header.val = {
      [[]],
      [[					]],
      [[ ▄██████▄  ████████▄   ▄█  ███▄▄▄▄    ]],
      [[ ███    ███ ███   ▀███ ███  ███▀▀▀██▄ ]],
      [[ ███    ███ ███    ███ ███▌ ███   ███ ]],
      [[ ███    ███ ███    ███ ███▌ ███   ███ ]],
      [[ ███    ███ ███    ███ ███▌ ███   ███ ]],
      [[ ███    ███ ███    ███ ███  ███   ███ ]],
      [[ ███    ███ ███   ▄███ ███  ███   ███ ]],
      [[  ▀██████▀  ████████▀  █▀    ▀█   █▀  ]],
      [[]],
    }
    startify.section.header.opts.shrink_margin = true

    require("alpha").setup(startify.config)
  end,
}
