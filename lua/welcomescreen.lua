
require('packer').use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        -- require'alpha'.setup(require'alpha.themes.startify'.config)
	local alpha = require'alpha'
	local startify = require 'alpha.themes.startify'
	startify.section.header.val = {
	[[]],
[[								       ]],	
[[          _ _  __      _   _                               _ _       ]],
[[    ____ | | |/ _|    | | | |                             | (_)      ]],
[[   / __ \| | | |_ __ _| |_| |__   ___ _ __        ___   __| |_ _ __  ]],
[[  / / _` | | |  _/ _` | __| '_ \ / _ \ '__|      / _ \ / _` | | '_ \ ]],
[[ | | (_| | | | || (_| | |_| | | |  __/ |     _  | (_) | (_| | | | | |]],
[[  \ \__,_|_|_|_| \__,_|\__|_| |_|\___|_|    ( )  \___/ \__,_|_|_| |_|]],
[[   \____/                                   |/		       ]],
[[								       ]],
   	[[]]
	}			
	alpha.setup(startify.config)
    end   
   }

