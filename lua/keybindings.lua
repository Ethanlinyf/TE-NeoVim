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
-- plugin shortcut
local pluginKeys = {}


-- bufferline switch tabs
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 
pluginKeys.telescopeList = {
  i = {
    -- move up & down
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- history
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- shut windows
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- scroll in preview
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

----------------------------------------------------------------------
-- comment
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal Mode
  toggler = {
    line = "gcc", -- line comment
    block = "gbc", -- block comment
  },
  -- Visual Mode
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

----------------------------------------------------------------------
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end

----------------------------------------------------------------------
return pluginKeys

