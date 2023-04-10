local cmp = require("cmp")

cmp.setup({
-- snippet engine specification
  snippet = {
    expand = function(args)-- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.-- require('luasnip').lsp_expand(args.body)-- For `ultisnips` users.-- vim.fn["UltiSnips#Anon"](args.body)-- For `snippy` users.-- require'snippy'.expand_snippet(args.body)
    end,
  },
-- completion source
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
-- For vsnip users.
    { name = "vsnip" },

-- For luasnip users.-- { name = 'luasnip' },--For ultisnips users.-- { name = 'ultisnips' },-- -- For snippy users.-- { name = 'snippy' },
  }, { { name = "buffer" }, { name = "path" } }),

-- keybindings
  mapping = require("keybindings").cmp(cmp),
  -- use lspkind-nvim show the types
  formatting = require('lsp.ui').formatting
})

-- / serching mode using buffer 
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : command mode using path and cmdline source
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

