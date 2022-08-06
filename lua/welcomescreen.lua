
require('packer').use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        -- require'alpha'.setup(require'alpha.themes.startify'.config)
	local alpha = require'alpha'
	local startify = require 'alpha.themes.startify'
	startify.section.header.val = {
	[[]],
[[               _                               ____  _____ _____ _   _  ]], 
[[              | |                             / __ \|  __ \_   _| \ | | ]],
[[ __      _____| | ___ ___  _ __ ___   ___    | |  | | |  | || | |  \| | ]],
[[ \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \   | |  | | |  | || | | . ` | ]],
[[  \ V  V /  __/ | (_| (_) | | | | | |  __/_  | |__| | |__| || |_| |\  | ]],
[[   \_/\_/ \___|_|\___\___/|_| |_| |_|\___( )  \____/|_____/_____|_| \_| ]],
[[                                         |/                             ]],
	[[]]
	}			
	alpha.setup(startify.config)
    end   
   }


-- From Line 38 
	--startify.section.header.val = {
--	[[]], 
--[[ ░█████╗░░██╗░░░░░░░██╗░██████╗░█████╗░███╗░░░███╗███████╗  ░█████╗░██╗░░░░░░██████╗░░█████╗░ ]]
--[[ ██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗████╗░████║██╔════╝  ██╔══██╗██║░░░░░██╔════╝░██╔══██╗ ]]
--[[ ███████║░╚██╗████╗██╔╝╚█████╗░██║░░██║██╔████╔██║█████╗░░  ███████║██║░░░░░██║░░██╗░██║░░██║ ]]
--[[ ██╔══██║░░████╔═████║░░╚═══██╗██║░░██║██║╚██╔╝██║██╔══╝░░  ██╔══██║██║░░░░░██║░░╚██╗██║░░██║ ]]
--[[ ██║░░██║░░╚██╔╝░╚██╔╝░██████╔╝╚█████╔╝██║░╚═╝░██║███████╗  ██║░░██║███████╗╚██████╔╝╚█████╔╝ ]]
--[[ ╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝  ╚═╝░░╚═╝╚══════╝░╚═════╝░░╚════╝░ ]]
--				[[]]
--	}

