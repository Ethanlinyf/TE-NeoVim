local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("no telescope")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- initialised to be as insert, could be as normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- short cut in windows
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- parameters alternative： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),
    },
  },
})

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
