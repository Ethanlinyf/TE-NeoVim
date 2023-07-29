-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind-nvim
local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
  return
end

local status, config = pcall(require, "uConfig")
if not status then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local mapping = {
  -- popup cmp
  [config.keys.cmp_complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  -- cancle
  [config.keys.cmp_abort] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),

  -- confirm
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
  [config.keys.cmp_confirm] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  }),
  -- scroll when too much in a display window
  [config.keys.cmp_scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
  [config.keys.cmp_scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

  -- previous one 
  [config.keys.cmp_select_prev_item] = cmp.mapping.select_prev_item(),
  -- next one
  [config.keys.cmp_select_next_item] = cmp.mapping.select_next_item(),
}

cmp.setup({
  -- specify snippet engine luasnip
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  -- keybinding
  -- mapping = mapping,
  mapping = mapping,
  -- source
  sources = cmp.config.sources({
    {
      name = "luasnip",
      group_index = 1,
    },
    {
      name = "nvim_lsp",
      group_index = 1,
    },
    {
      name = "nvim_lsp_signature_help",
      group_index = 1,
    },
    {
      name = "buffer",
      group_index = 2,
    },
    {
      name = "path",
      group_index = 2,
    },
  }),

  -- use lspkind-nvim to display type icons
  formatting = require("cmp.lspkind").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { {
    name = "buffer",
  } },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ {
    name = "path",
  } }, { {
    name = "cmdline",
  } }),
})

cmp.setup.filetype({ "markdown", "help" }, {
  sources = { {
    name = "luasnip",
  }, {
    name = "buffer",
  }, {
    name = "path",
  } },
})

require("cmp.luasnip")
