local status, mason = pcall(require, "mason")
if not status then
  vim.notify("No mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("No mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("No lspconfig")
  return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "taplo",
    "yamlls",
    "gopls",
    "clangd",
    "cmake",
    -- "eslint_d",
    -- "shfmt",
    -- "prettier",
    -- "rubocop",
    -- "fixjson",
  },
})

-- Install List
-- { key: server， value: configuration }
-- key in the following listed  server name
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  pyright = require("lsp.config.pyright"),
  html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  tsserver = require("lsp.config.typescript"),
  yamlls = require("lsp.config.yamlls"),
  dockerls = require("lsp.config.docker"),
  tailwindcss = require("lsp.config.tailwindcss"),
  rust_analyzer = require("lsp.config.rust"),
  taplo = require("lsp.config.taplo"), -- toml
  gopls = require("lsp.config.gopls"),
  -- remark_ls = require("lsp.config.markdown"),
  clangd = require("lsp.config.clangd"),
  cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- Custom initialization configuration files must implement the on_setup method
    config.on_setup(lspconfig[name])
  else
    -- use the default parameters
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
