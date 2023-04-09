return require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gruvbox theme
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline 
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
        -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")

    -- surround
    use("ur4ltz/surround.nvim")

    -- Comment
    use("numToStr/Comment.nvim")

    -- lualine
    use {
       'nvim-lualine/lualine.nvim',
       requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- dashboard-nvim
    use {
       'glepnir/dashboard-nvim',
       requires = {'kyazdani42/nvim-web-devicons'}
    }

----------------------------------------------------------------------
    -- coloizer: https://github.com/norcalli/nvim-colorizer.lua
----------------------------------------------------------------------
    -- lsp
    use({
          "williamboman/mason.nvim",
          run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    })
    use({ "williamboman/mason-lspconfig.nvim" })

    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- completion-nvim
    use("hrsh7th/nvim-cmp")
    -- Snippet 
    use("hrsh7th/vim-vsnip")
    -- completion-source
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- snippet-language
    use("rafamadriz/friendly-snippets")
    -- UI enhancement
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- code format
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript 
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- Lua 
    use("folke/lua-dev.nvim")
    -- JSON 
    use("b0o/schemastore.nvim")
    -- Rust 
    use("simrat39/rust-tools.nvim")

    -- project
    use("ahmedkhalf/project.nvim")
end)
