-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'

------------------------------------------------------------
local uConfig = require("uConfig")
local uTree = uConfig.nvimTree

if uTree == nil or not uTree.enable then
  return
end

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

-- ------------------------------------------------------------
local function on_attach(bufnr) -- See: https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'sh', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'i', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'u', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'I', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', ']', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '[', api.tree.change_root_to_parent, opts('Up'))

end

--------------------------------------------------------------------

nvim_tree.setup({
      on_attach = on_attach,
  -- open_on_setup = true,
  -- Disabling netrw builtin entirely
  disable_netrw = true,
  -- Don't show git status icons
  git = {
    enable = true,
    ignore = true,
  },
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  filters = {
    -- hide .file
    dotfiles = true,
    -- hide node_modules folders
    -- custom = { "node_modules" },
  },
  view = {
    -- width
    width = 34,
    -- 'right' also wokes
    side = "left",
    -- hide the root foler
    hide_root_folder = false,
    -- Shortcut keys in the custom list
    mappings = {
      -- Only use built-in shortcut keys
      custom_only = true,
      list = list_keys,
    },
    -- do not show row count
    number = false,
    relativenumber = false,
    -- display icons
    signcolumn = "yes",
  },
  actions = {
    open_file = {
      -- Open size adaptation for the first time
      resize_window = true,
      -- close tree when opening file
      quit_on_open = false,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = "open",
    -- windows
    -- cmd = "wsl-open",
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
    },
  },
})
