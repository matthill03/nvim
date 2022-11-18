local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopent neovim..."
  vim.cmd[[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenver you save the plugins.lua file
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- packer manages itself
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Colourschemes
  use "lunarvim/colorschemes"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Char toggle
  use "saifulapm/chartoggle.nvim"

  -- Git signs
  use "lewis6991/gitsigns.nvim"

  -- Live Server
  use "manzeloth/live-server"


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
