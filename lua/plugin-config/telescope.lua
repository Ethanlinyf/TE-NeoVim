local uConfig = require("uConfig")
local uTelescope = uConfig.telescope

if uTelescope == nil or not uTelescope.enable then
  return
end

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("no telescope")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- initial_mode: insert, could be as normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- in window
    mappings = {
      i = {
        -- move up and down
        [uTelescope.move_selection_next] = "move_selection_next",
        [uTelescope.move_selection_previous] = "move_selection_previous",
        -- 历史记录
        [uTelescope.cycle_history_next] = "cycle_history_next",
        [uTelescope.cycle_history_prev] = "cycle_history_prev",
        -- close windows
        -- ["<esc>"] = actions.close,
        [uTelescope.close] = "close",
        -- preview_scrolling_up and down
        [uTelescope.preview_scrolling_up] = "preview_scrolling_up",
        [uTelescope.preview_scrolling_down] = "preview_scrolling_down",
      },
    },
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- optional： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
        initial_mode = "normal",
      }),
    },
  },
})

vim.keymap.set("n", uTelescope.find_files, ":Telescope find_files<CR>")
vim.keymap.set("n", uTelescope.live_grep, ":Telescope live_grep<CR>")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
