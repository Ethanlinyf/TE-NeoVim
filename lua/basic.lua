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

-- jk movement 
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- line number and use the relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight line
vim.wo.cursorline = true

-- Show colum indicator of the left icon
-- vim.wo.signcolumn = "yes"
-- Reference line to indicate the maximum length
vim.wo.colorcolumn = "80"

-- indentation, 2 spaces = a tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- >> <<, moving length
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- Search is case insensitive, unless uppercase is included
vim.o.ignorecase = true
vim.o.smartcase = true

-- highlight search is not active
vim.o.hlsearch = false

-- incremental search
vim.o.incsearch = true

-- enhanced status bar and no need to show the specific mode
vim.o.showmode = false

-- sufficient space to show the command line
vim.o.cmdheight = 2

-- automaticly update the buffer changed outside 
vim.o.autoread = true
vim.bo.autoread = true

-- not allowed to wrap
vim.o.wrap = false
vim.wo.wrap = false

-- moving to next line 
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- the changed buffer can be hidden
vim.o.hidden = true

-- support using a mouse
vim.o.mouse = "a"

-- backup file is prohibited. 
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime 
vim.o.updatetime = 300
-- waiting mappings
vim.o.timeoutlen = 100

-- split window 
vim.o.splitbelow = true
vim.o.splitright = true

-- implementation, not selected
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- theme
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- diaplay the unvisuable characters
vim.o.list = true
vim.o.listchars = "space:·"

-- enhance the implementation
vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10

-- always show tabline
vim.o.showtabline = 2

--#endregion
