local use = require('packer').use
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- UI
  use 'preservim/nerdtree'
  use 'baopham/vim-nerdtree-unfocus' -- unfocus NERD_tree when opening new buffer
  use 'itchyny/lightline.vim'        -- light and configurable statusline/tabline

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  -- use 'neovim/nvim-lspinstall' -- conveniently install language servers
  -- use 'glepnir/lspsaga.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

  -- Git
  -- TODO
  use 'lewis6991/gitsigns.nvim'

  -- Syntax
  -- TODO
  use 'nvim-treesitter/nvim-treesitter'
  -- use 'lewis6991/spellsitter.nvim'

  -- Markdown
  use 'ellisonleao/glow.nvim'

  -- Quality Of Life
  use 'szw/vim-maximizer' -- maximize split windows and restore them <F3>

end)
