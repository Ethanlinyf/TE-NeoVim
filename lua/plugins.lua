-- auto-install Packer.nvim
-- plugin folder
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("Installing Pakcer.nvim，please wait...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim installed")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.nvim, not installed")
  return
end

packer.startup({
  function(use)
    -- Packer upgrade itself
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------
    -- use("lewis6991/impatient.nvim")
    -- use("nathom/filetype.nvim")

    -- nvim-notify
    use({
      "rcarriga/nvim-notify",
      config = function()
        require("plugin-config.nvim-notify")
      end,
    })
    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.nvim-tree")
      end,
    })

    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
      config = function()
        require("plugin-config.bufferline")
      end,
    })

    -- lualine
    use("arkav/lualine-lsp-progress")
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("plugin-config.lualine")
      end,
    })

    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      -- opt = true,
      -- cmd = "Telescope",
      requires = {
        -- telescope extensions
        { "LinArcX/telescope-env.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
      },
      config = function()
        require("plugin-config.telescope")
      end,
    })

    -- dashboard-nvim
    use({
      "glepnir/dashboard-nvim",
      config = function()
        require("plugin-config.dashboard")
      end,
    })

    -- project
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("plugin-config.project")
      end,
    })

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        -- require("nvim-treesitter.install").update({ with_sync = true })
      end,
      requires = {
        { "p00f/nvim-ts-rainbow" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
      config = function()
        require("plugin-config.nvim-treesitter")
      end,
    })

    -- indent-blankline
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugin-config.indent-blankline")
      end,
    })

    -- toggleterm
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("plugin-config.toggleterm")
      end,
    })

    -- surround
    -- use({
    --   "ur4ltz/surround.nvim",
    --   config = function()
    --     require("plugin-config.surround")
    --   end,
    -- })

    -- nvim-surround
    use({
      "kylechui/nvim-surround",
      config = function()
        require("plugin-config.nvim-surround")
      end,
    })

    -- Comment
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("plugin-config.comment")
      end,
    })

    -- nvim-autopairs
    use({
      "windwp/nvim-autopairs",
      config = function()
        require("plugin-config.nvim-autopairs")
      end,
    })

    -- fidget.nvim
    use({
      "j-hui/fidget.nvim",
      config = function()
        require("plugin-config.fidget")
      end,
    })

    -- todo-comments.nvim
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("plugin-config.todo-comments")
      end,
    })

    -- mkdnflow.nvim
    use({
      "jakewvincent/mkdnflow.nvim",
      ft = { "markdown" },
      commit = "739b8b93530adbd5dfb2d3abff66752637442d41",
      config = function()
        require("plugin-config.mkdnflow")
      end,
    })

    -- venn drawing
    use({
      "jbyuki/venn.nvim",
      config = function()
        require("plugin-config.venn")
      end,
    })

    -- zen mode
    use({
      "folke/zen-mode.nvim",
      config = function()
        require("plugin-config.zen-mode")
      end,
    })
    --------------------- LSP --------------------
    -- installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- cmp engine
    use("hrsh7th/nvim-cmp")
    -- Snippet engine
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- cmp sources
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- snippet 
    use("rafamadriz/friendly-snippets")
    -- UI enhancement
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- format
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript enhancement
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    use("jose-elias-alvarez/typescript.nvim")

    -- Lua enhancement
    use("folke/neodev.nvim")
    -- JSON enhancement
    use("b0o/schemastore.nvim")
    -- Rust enhancement
    use("simrat39/rust-tools.nvim")
    --------------------- colorschemes --------------------
    -- tokyonight
    use({
      "folke/tokyonight.nvim",
      config = function()
        require("plugin-config.tokyonight")
      end,
    })

    -- OceanicNext
    -- use({ "mhartington/oceanic-next", event = "VimEnter" })

    -- gruvbox
    -- use({
    --   "ellisonleao/gruvbox.nvim",
    --   requires = { "rktjmp/lush.nvim" },
    -- })

    -- zephyr
    -- use("glepnir/zephyr-nvim")

    -- nord
    -- use("shaunsingh/nord.nvim")

    -- onedark
    -- use("ful1e5/onedark.nvim")

    -- nightfox
    -- use("EdenEast/nightfox.nvim")

    -------------------------------------------------------
    -- git
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("plugin-config.gitsigns")
      end,
    })
    -- vimspector
    use({
      "puremourning/vimspector",
      cmd = { "VimspectorInstall", "VimspectorUpdate" },
      fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
      config = function()
        require("dap.vimspector")
      end,
    })
    ----------------------------------------------
    -- nvim-dap
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")

    -- node
    use({
      "mxsdev/nvim-dap-vscode-js",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("dap.nvim-dap.config.vscode-js")
      end,
    })

    -- go
    use("leoluz/nvim-dap-go")

    --[[ not work

    use({
      "mfussenegger/nvim-dap-python",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("dap-python").setup("/Users/nn/.local/share/nvim/mason/bin/debugpy")
      end,
    })

    --]]

    -- use("jbyuki/one-small-step-for-vimkind")
    --[[ use("dstein64/vim-startuptime") ]]

    if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- foxed the pluging in the folder snapshots
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- foxed v1，not upgrade
    -- snapshot = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots") .. "/v1",
    -- snapshot = "v1",

    -- max paralles
    max_jobs = 10,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    -- display = {
    -- use floating windows to display
    --   open_fn = function()
    --     return require("packer.util").float({ border = "single" })
    --   end,
    -- },
  },
})
