return {
  -- My plugins here
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "RRethy/vim-illuminate",
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
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
  "lspcontainers/lspcontainers.nvim",
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
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

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
}
