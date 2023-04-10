
--[[
   Copyleft (CL) 2023-2033 Ethan YF Lin

   Something good as indicated, by Dr YF Lin <e.yflin@gmail.com>
   URL: https://github.com/Ethanlinyf/TE-NeoVim
   Under ThingsEngine Project: https://www.thethingsengine.org
   -------------------------------------------------------------------
   Commentary:
   TE-NeoVim init configurations 
   -------------------------------------------------------------------
--]]

-- Basic Configuration
require('basic/static')
require('basic/dynamic')

-- Keybinding
require('keybindings')

-- Plugin
require('plugins')

-- theme
require("colorscheme")

-- plugin-config
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.comment")
require("plugin-config.surround")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")

-- lsp
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
-- require("lsp.null-ls")
