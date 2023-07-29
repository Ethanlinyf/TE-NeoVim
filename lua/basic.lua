-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 8 lines around are kept
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- relative line number
vim.wo.number = true
vim.wo.relativenumber = true
-- highlight the current line
vim.wo.cursorline = true
-- the indication of the left icon for the colum 
vim.wo.signcolumn = "yes"
-- referen line 
vim.wo.colorcolumn = "80"
-- tapstop 4
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << shiftwidth
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- space to replace tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- align the recent line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- search 
vim.o.ignorecase = true
vim.o.smartcase = true
-- hilight the sesearch results
vim.o.hlsearch = false
-- incremental search
vim.o.incsearch = true
-- 2 lines for the command line height 
vim.o.cmdheight = 1
-- reload when the file changed outside
vim.o.autoread = true
vim.bo.autoread = true
-- wrap faulse
vim.wo.wrap = false
-- cursor in the end of line and <Left><Right> will jump to next line
vim.o.whichwrap = "<,>,[,]"
-- allow to hide the changed buffer
vim.o.hidden = true
-- support cursor
vim.o.mouse = "a"
-- inhibit creating backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- set timeoutlen for the continues hits with 500ms
-- https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 500
-- split window popping up from below and right
vim.o.splitbelow = true
vim.o.splitright = true
-- cmp not select automaticly 
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- mode 
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- Whether to display invisible characters
vim.o.list = false
-- The display of invisible characters, here only the space is displayed as a point
vim.o.listchars = "space:·,tab:··"
-- cmp enhancement
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- cmp display 10 maximant 
vim.o.pumheight = 10
-- display tabline always
vim.o.showtabline = 2
-- Vim's mode prompt is no longer needed after using the enhanced status bar plugin
vim.o.showmode = false
-- configure clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.foldtext = "v:lua.require('utils.simple_fold').simple_fold()"
