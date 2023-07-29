local uConfig = require("uConfig")
local uBufferLine = uConfig.bufferLine

if uBufferLine == nil or not uBufferLine.enable then
  return
end

local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("没有找到 bufferline")
  return
end
-- bfferline setup
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- turn Tab 
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- sidebar configuration
    -- The left side gives way to the position of nvim-tree, displaying the text File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- nvim default LSP
    ---@diagnostic disable-next-line: assign-type-mismatch
    diagnostics = "nvim_lsp",
    -- option, display LSP error icons
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})

-- Left and right Tab swap
keymap("n", uBufferLine.prev, ":BufferLineCyclePrev<CR>")
keymap("n", uBufferLine.next, ":BufferLineCycleNext<CR>")
-- "moll/vim-bbye" clase recent buffer
keymap("n", uBufferLine.close, ":Bdelete!<CR>")
-- Close left/right tabs
keymap("n", uBufferLine.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", uBufferLine.close_right, ":BufferLineCloseRight<CR>")
-- close other tab pages
keymap("n", uBufferLine.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
-- close the selected tab page
keymap("n", uBufferLine.close_pick, ":BufferLinePickClose<CR>")
