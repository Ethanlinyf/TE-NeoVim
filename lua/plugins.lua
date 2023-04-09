local packer = require("packer")



packer.startup({
      function(use)-- Packer management for itself
         use 'wbthomason/packer.nvim'
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
