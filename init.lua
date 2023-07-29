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
