local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("No nvim-tree")
  return
end

-- List
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- not show git status
    git = {
        enable = false,
    },
    -- project plugin 
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    --  not show . and node_modules 
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- width
        width = 40,
        -- side, could be 'right'
        side = 'left',
        -- hide root folder
        hide_root_folder = false,
        -- mappings in List
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- Do not show lines
        number = false,
        relativenumber = false,
        -- show icons
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- resize window
            resize_window = true,
            -- quit on open a file
            quit_on_open = true,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open', -- mac default is open
    },
})
-- automatically close 
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
