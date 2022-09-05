# TE-Neovim
## From Vi to Vim, then to Neovim
Vi is short for “visual editor” and it is available in nearly identical form on every UNIX-like system. 
## Why Neovim
## The main features of TE-Neovim
## Installation
## 
![Neovim Configuration Layout](./figure/VimConfigarationLayout.png)
├── init.vim
└── lua                                   all lua configuration files
    ├── basic.lua                         Neovim basic configuration
    ├── keybindings.lua                   For keybindings
    ├── lsp                               LSP (Language Server Protocol) 
    │   ├── diagnostic_signs.lua
    │   ├── language_servers.lua
    │   └── nvim-cmp-config.lua
    ├── plugin-config                     Plugins for various purposes
    │   ├── bufferline.lua
    │   ├── comment.lua
    │   ├── nvim-autopairs.lua
    │   ├── nvim-colorizer.lua
    │   ├── nvim-tree.lua
    │   ├── nvim-treesitter.lua
    │   ├── rust-tools.lua
    │   ├── surround.lua
    │   ├── telescope.lua
    │   └── which-key.lua
    └── plugins.lua                      Plugin management
## Lisence
## Contributor
## Reference
