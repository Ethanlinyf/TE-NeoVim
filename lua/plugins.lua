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
