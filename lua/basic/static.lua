--[[
   Copyleft (CL) 2022-2032 YF Lin

   Something good as indicated, by Dr YF Lin <e.yflin@gmail.com>
   URL: https://github.com/Ethanlinyf/General-Pure-Emacs
   Under ThingsEngine Project: https://www.thethingsengine.org
   -------------------------------------------------------------------
   Commentary:
   Basic configurations for TE-Neovim
   -------------------------------------------------------------------
--]]

--#region

--* Defaul Coding System *--
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- line number and use the relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight line
vim.wo.cursorline = true

-- allowed to wrap
vim.o.wrap = true
vim.wo.wrap = true

-- sufficient space to show the command line: 2
vim.o.cmdheight = 1

-- diaplay the unvisuable characters
vim.o.list = true
vim.o.listchars = "space:~"

-- always show tabline, even only one file opened
vim.o.showtabline = 2

-- Reference line to indicate the maximum length
vim.wo.colorcolumn = "80"

-- theme settings
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true
-- vim.o.background = "dark"

-- Show colum indicator of the left icon
-- vim.wo.signcolumn = "yes"

-- still show mode
vim.o.showmode = true

vim.o.syntax = "enable"

vim.o.ruler = true


--#endregion
