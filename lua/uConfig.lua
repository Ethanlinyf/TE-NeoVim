local M = {
  config_path = vim.fn.stdpath("config"),

  keys = {

    leader_key = " ",

    -- modes
    c_next_item = "<C-j>",
    c_prev_item = "<C-k>",

    -- normal mode
    n_save = "<leader>w", -- :w
    n_save_quit = "<leader>wq", --:wq
    n_save_all = "<leader>wa", -- :wa
    -- n_save_all_quit = "<leader>qa", -- :wqa
    n_force_quit = "<leader>q", -- :qa!

    n_v_5j = "<C-j>",
    n_v_5k = "<C-k>",

    n_v_10k = "<C-u>",
    n_v_10j = "<C-d>",

    -- cmp shortcuts
    cmp_complete = "<A-.>",
    cmp_abort = "<A-,>",
    cmp_confirm = "<CR>",
    cmp_scroll_doc_up = "<C-u>",
    cmp_scroll_doc_down = "<C-d>",
    cmp_select_prev_item = "<C-k>",
    cmp_select_next_item = "<C-j>",

    -- luasnip
    snip_jump_next = "<C-l>",
    snip_jump_prev = "<C-h>",
    snip_next_choice = "<C-j>",
    snip_prev_choice = "<C-k>",

    s_windows = {

      enable = true,

      -- windows operations
      split_vertically = "sv",
      split_horizontally = "sh",
      close = "sc",
      close_others = "so",

      -- jumping to
      jump_left = "<A-h>",
      jump_right = "<A-l>",
      jump_up = "<A-k>",
      jump_down = "<A-j>",

      -- <leader> + hjkl 
      -- jump_left = "<leader>h",
      -- jump_right = "<leader>j",
      -- jump_up = "<leader>k",
      -- jump_down = "<leader>l",

      -- change sizes
      width_decrease = "s,",
      width_increase = "s.",
      height_decrease = "sj",
      height_increase = "sk",
      size_equal = "s=",
    },

    s_tab = {
      split = "ts",
      prev = "th",
      next = "tl",
      first = "tj",
      last = "tk",
      close = "tc",
    },

    fold = {
      open = "Z",
      close = "zz",
    },

    format = "<leader>f",

    terminal_to_normal = "<Esc>",
    -- TODO

    -- proxy
    -- im-select
  },

  enable_magic_search = true,

  nvimTree = {

    enable = true,

    toggle = "<A-m>",
    -- toggle = "<leader>m"
    edit = { "o", "<2-LeftMouse>" },
    system_open = "<CR>",
    -- v
    vsplit = "sv",
    -- h
    split = "sh",
    -- toggle .gitignore (git enable)
    toggle_git_ignored = "i",
    -- Hide (dotfiles)
    toggle_dotfiles = ".",
    -- togglle custom config
    toggle_custom = "u",

    refresh = "R",
    -- file operations
    create = "a",
    remove = "d",
    rename = "r",
    cut = "x",
    copy = "c",
    paste = "p",
    copy_name = "y",
    copy_path = "Y",
    copy_absolute_path = "gy",
    toggle_file_info = "I",
    tabnew = "t",
    -- next level
    cd = "]",
    -- up level
    dir_up = "[",
  },

  bufferLine = {

    enable = true,

    prev = "<C-h>",
    next = "<C-l>",
    close = "<C-w>",
    -- close = "<leader>bc",
    close_left = "<leader>bh",
    close_right = "<leader>bl",
    close_others = "<leader>bo",
    close_pick = "<leader>bp",
  },

  telescope = {

    enable = true,

    find_files = "<C-p>",
    live_grep = "<C-f>",

    -- move up and down
    move_selection_next = "<C-j>",
    move_selection_previous = "<C-k>",
    -- move_selection_next = "<C-n>",
    -- move_selection_previous = "<C-p>",
    -- history
    cycle_history_next = "<Down>",
    cycle_history_prev = "<Up>",
    -- close windows
    -- close = "<C-c>",
    close = "<esc>",
    -- preview_scrolling_up and down
    preview_scrolling_up = "<C-u>",
    preview_scrolling_down = "<C-d>",
  },

  mkdnflow = {
    enable = true,
    next_link = "gn",
    prev_link = "gp",
    next_heading = "gj",
    prev_heading = "gk",
    go_back = "<C-o>",
    follow_link = "gd",
    toggle_item = "tt",
  },

  comment = {
    enable = true,
    -- Normal 
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    -- Visual
    opleader = {
      line = "gc",
      bock = "gb",
    },
  },

  toggleterm = {
    enable = true,

    -- <leader>ta 
    toggle_window_A = "<leader>ta",
    -- <leader>tb 
    toggle_window_B = "<leader>tb",
    -- <leader>tc 
    toggle_window_C = "<leader>tc",
  },

  venn = {
    -- toggle keymappings for venn using <leader>v
    enable = true,
    -- venn.nvim: enable or disable keymappings
    toggle = "<leader>v",
    -- draw a box by pressing "f" with visual selection
    draw_box = "f",
  },

  zen = {
    enable = true,
    toggle = "<leader>z",
  },

  lsp = {
    rename = "<leader>rn",
    code_action = "<leader>ca",
    format = "<leader>f",
    definition = "gd",
    references = "gr",
    hover = "gh",
    -- diagnostic
    open_flow = "gp",
    goto_next = "gj",
    goto_prev = "gk",
    -- typescript
    ts_organize = "gs",
    ts_rename_file = "gR",
    ts_add_missing_import = "gi",
    ts_remove_unused = "gu",
    ts_fix_all = "gf",
    ts_goto_source = "gD",
  },
}

return M
