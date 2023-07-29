local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
  vim.notify("没有找到 indent_blankline")
  return
end

indent_blankline.setup({
  -- Blank space
  space_char_blankline = " ",
  -- Judging context with treesitter
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "element",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
  },
  -- echo &filetype
  filetype_exclude = {
    "null-ls-info",
    "dashboard",
    "packer",
    "terminal",
    "help",
    "log",
    "markdown",
    "TelescopePrompt",
    "lsp-installer",
    "lspinfo",
    "toggleterm",
    "text",
  },
  -- vertical bar style
  -- char = '¦'
  -- char = '┆'
  -- char = '│'
  -- char = "⎸",
  char = "▏",
})
