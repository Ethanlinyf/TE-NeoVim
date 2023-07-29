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


-- require("impatient")
require("utils.global")

require("basic")
require("keybindings")

require("plugins")
require("colorscheme")
require("autocmds")
require("lsp.setup")

-- Completion
require("cmp.setup")
-- Format
require("format.setup")
-- DAP
require("dap.setup")
require("dap.vimspector")
-- utils
require("utils.fix-yank")

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "typescript", "cmake" },
})
