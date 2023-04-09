--[[
   Copyleft (CL) 2022-2032 Ethan YF Lin

   Something good as indicated, by Dr YF Lin <e.yflin@gmail.com>
   URL: https://github.com/Ethanlinyf/TE-NeoVim
   Under ThingsEngine Project: https://www.thethingsengine.org
   -------------------------------------------------------------------
   Commentary:
   Basic keybindings configurations 
   -------------------------------------------------------------------
--]]

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   terminal_mode = "t",
--   command_mode = "c",

-- leader key space
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- vim.api.nvim_set_var('mapleader', ',')
-- vim.api.nvim_set_var('maplocalleader', ',')

local opt = {
  noremap = true,
  silent = true,
}

-- local variable
local map = vim.api.nvim_set_keymap

-- $ to the end of line ( swap $ and g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- conmand line Ctrl+j/k  previous and next ones
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- scroll view
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- ctrl u / ctrl + d  move half of screen
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual mode indent
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- move the marked region
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- visual mode paste
map("v", "p", '"_dP', opt)

-- exit
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert in the beginning and  end
map("i", "<C-h>", "<ESC>I", opt) 
map("i", "<C-l>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows split the windows
------------------------------------------------------------------
-- ignor s default 
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt) -- hold "s" to press "v"
map("n", "sh", ":sp<CR>", opt)
-- close recent window
map("n", "sc", "<C-w>c", opt)
-- clase others
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  switch to other windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- <leader> + hjkl swith to others
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- horizon change the weight
map("n", "<C-Left>", ":vertical resize -2<CR>", opt) -- not effective in Mac
map("n", "<C-Right>", ":vertical resize +2<CR>", opt) -- not effective in Mac
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
-- change the higth
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<A-Down>", ":resize +2<CR>", opt)
map("n", "<A-Up>", ":resize -2<CR>", opt)
-- set back to equal
map("n", "s=", "<C-w>=", opt)

-- Terminal related
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)
-- Esc back to normal
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
--------------------------------------------------------------------
-- plugin shortcuts
local pluginKeys = {}

-- nvim-tree
-- alt + m open tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- List
pluginKeys.nvimTreeList = {
  -- open files or directories
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- open in a new window
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- show the hidden files
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- operation
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- bufferline
-- Tab switch
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- close
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- find files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- find by grep
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope mappings in List with different modes
pluginKeys.telescopeList = {
  i = {
    -- move up and down
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- history
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- close window
    ["<C-c>"] = "close",
    -- preview_scrolling_up and down
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

return pluginKeys
