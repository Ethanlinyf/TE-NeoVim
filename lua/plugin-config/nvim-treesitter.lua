local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
   vim.notify("no nvim-treesitter")
   return
end

treesitter.setup({
      -- install language parser
      -- :TSInstallInfo check the support languages
      ensure_installed = { "bash", "python", "rust", "latex", "bibtex", "java", "go", "julia", "norg", "markdown", "matlab", "org", "sql", "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx"},
      -- highlight enable
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
         },
      },

      -- indent
      indent = {
         enable = true,
      },

      -- -- Folding 
      -- vim.opt.foldmethod = "expr"
      -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      -- -- no folding default
      -- -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      -- vim.opt.foldlevel = 99

})

