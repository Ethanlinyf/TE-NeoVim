local packer = require("packer")


packer.startup({
      function(use)-- Packer management for itself
         use 'wbthomason/packer.nvim'
         ------------------------themes------------------------------------
         use("folke/tokyonight.nvim")
         -- OceanicNext
         use("mhartington/oceanic-next")
         -- gruvbox
         use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
         -- nord
         use("shaunsingh/nord.nvim")
         -- onedark
         use("ful1e5/onedark.nvim")
         -- nightfox
         use("EdenEast/nightfox.nvim")
         ------------------------------------------------------------
         -- nvim-tree
         use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
         -- bufferline
         use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
         -- lualine
         use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
         use("arkav/lualine-lsp-progress")
         -- telescope
         use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
         use "LinArcX/telescope-env.nvim"
         use { "nvim-telescope/telescope-ui-select.nvim" }
         -- dashboard-nvim
         use("glepnir/dashboard-nvim")
         -- project
         use("ahmedkhalf/project.nvim")
         -- comment
         use("numToStr/Comment.nvim")
         -- nvim-surround
         use("ur4ltz/surround.nvim")
         -- treesitter （新增）
         use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
         ------------------------------------------------------------
         -- lsp
         use({ "williamboman/mason.nvim" })
         use({ "williamboman/mason-lspconfig.nvim" })

         -- Lspconfig
         use({ "neovim/nvim-lspconfig" })

         -- completion engine
         use("hrsh7th/nvim-cmp")
         -- snippet 
         use("hrsh7th/vim-vsnip")
         -- completion source
         use("hrsh7th/cmp-vsnip")
         use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
         use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
         use("hrsh7th/cmp-path") -- { name = 'path' }
         use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
         -- normal programming snipets
         use("rafamadriz/friendly-snippets")

         -- Lua development
         use("folke/neodev.nvim")

      end,
      config = {
         -- fixed the version in the snapshots directory
         snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
         -- fiexed in v1，which will not update
         -- snapshot = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots") .. "/v1",
         -- snapshot = "v1",

         -- occurence maximum
         max_jobs = 10,
         -- define the git source
         git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
         },
         -- display = {
         -- --use the floating window to demonstrate 
         --   open_fn = function()
         --     return require("packer.util").float({ border = "single" })
         --   end,
         -- },
      },
})

-- save plugin buffer and PackerSync to install the plugins
-- [[ ... ]] is the vimscript 
pcall(
   vim.cmd,
   [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
