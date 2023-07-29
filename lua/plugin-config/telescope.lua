local uConfig = require("uConfig")
local uTelescope = uConfig.telescope

if uTelescope == nil or not uTelescope.enable then
  return
end

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("No telescope")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- The initial mode entered after opening the pop-up window, the default is insert, and it can also be normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- Shortcut keys in the window
    mappings = {
      i = {
        -- move up/down
        [uTelescope.move_selection_next] = "move_selection_next",
        [uTelescope.move_selection_previous] = "move_selection_previous",
        -- history
        [uTelescope.cycle_history_next] = "cycle_history_next",
        [uTelescope.cycle_history_prev] = "cycle_history_prev",
        -- close windows
        -- ["<esc>"] = actions.close,
        [uTelescope.close] = "close",
        -- Scroll the preview window up and down
        [uTelescope.preview_scrolling_up] = "preview_scrolling_up",
        [uTelescope.preview_scrolling_down] = "preview_scrolling_down",
      },
    },
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
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

keymap("n", uTelescope.find_files, ":Telescope find_files<CR>")
keymap("n", uTelescope.live_grep, ":Telescope live_grep<CR>")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
