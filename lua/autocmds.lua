local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- Automatically switch input methods, need to install im-select
-- https://github.com/daipeihust/im-select
autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = require("utils.im-select").insertLeave,
})
autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = require("utils.im-select").insertEnter,
})

-- Enter Terminal to automatically enter Insert mode
autocmd("TermOpen", {
  group = myAutoGroup,
  command = "startinsert",
})

-- Auto format on save
autocmd("BufWritePre", {
  group = myAutoGroup,
  pattern = { "*.lua", "*.py", "*.sh" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Modify lua/plugins.lua to automatically update plugins
autocmd("BufWritePost", {
  group = myAutoGroup,
  -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
  callback = function()
    if vim.fn.expand("<afile>") == "lua/plugins.lua" then
      vim.api.nvim_command("source lua/plugins.lua")
      vim.api.nvim_command("PackerSync")
    end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = myAutoGroup,
  pattern = "*",
})

-- wrap with o do not continue comments
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

-- Keep Fold
local saveable_type = { "*.lua", "*.js", "*.jsx", "*.ts", "*.tsx" }

autocmd("BufWinEnter", {
  group = myAutoGroup,
  pattern = saveable_type,
  command = "silent! loadview",
})
autocmd("BufWrite", {
  group = myAutoGroup,
  pattern = saveable_type,
  command = "mkview",
})
