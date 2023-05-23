-- Install Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

vim.g.mapleader = " "

-- Install your plugins here
lazy.setup({
  -- My plugins here
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup()
    end,
  },
  "goolord/alpha-nvim",

  -- Colorschemes
  "ellisonleao/gruvbox.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "RRethy/vim-illuminate",
  "lspcontainers/lspcontainers.nvim",
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  "smjonas/inc-rename.nvim",

  -- Markdown/Latex Previewer
  "frabjous/knap",

  -- Remote containers
  "jamestthompson3/nvim-remote-containers",

  -- Which Key
  "folke/which-key.nvim",

  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.0" },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",

  -- Leap
  "ggandor/leap.nvim",

  -- Surround
  "kylechui/nvim-surround",

  -- Git
  "lewis6991/gitsigns.nvim",
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- DAP
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "ravenxrz/DAPInstall.nvim",

  "shortcuts/no-neck-pain.nvim",
})
