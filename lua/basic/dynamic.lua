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

-- j,k movement 
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- indentation, 2 spaces equal to one tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> <<, moving length
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- New line will align with the recent line
-- use two spaces to instead a tab
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

-- automaticly update the buffer changed outside 
vim.o.autoread = true
vim.bo.autoread = true

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

-- enhance the implementation
vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10

--#endregion
