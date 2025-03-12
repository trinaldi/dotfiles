vim.g.mapleader = ","
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- Colorscheme
  { "folke/tokyonight.nvim" },


  -- LSP and Autocompletion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter for Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Telescope for Navigation
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Rails-specific Plugins
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
  { "tpope/vim-endwise" },
  { "tpope/vim-rake" },
  { "tpope/vim-dispatch" },
  { "RRethy/nvim-treesitter-endwise"},

  -- Testing
  { "vim-test/vim-test" },

  -- Git Integration
  { "tpope/vim-fugitive" },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons", -- Optional, but adds icons
    config = function()
      require("bufferline").setup {
        options = {
          numbers = "buffer_id", -- You can use "ordinal", "buffer_id", or "both" for displaying numbers
          close_command = "bdelete %d", -- Command to close buffer
          right_mouse_command = "bdelete %d", -- Command to close buffer on right-click
          indicator = {
            style = "icon", -- Can use "none", "icon", or "underline"
            icon = "|", -- Icon to show on the active buffer
          },
          buffer_close_icon = "", -- Icon for closing the buffer
          modified_icon = "●", -- Icon to indicate modified buffers
          show_buffer_icons = true, -- Enable icons for file types
          show_buffer_close_icons = true, -- Enable close icons
          show_tab_indicators = true, -- Show tab indicators
          persist_buffer_sort = true, -- Keep buffers sorted across restarts
          separator_style = "thin", -- "slant", "thick", "thin", or "none"
          enforce_regular_tabs = false, -- Disable enforced regular tab width
        }
      }
    end
  },
})

require("tokyonight").setup({
  transparent = true,
})
vim.cmd [[colorscheme tokyonight]]

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight")

-- LSP Setup
local lspconfig = require("lspconfig")
lspconfig.solargraph.setup({
  settings = {
    solargraph = {
      diagnostics = true, -- Enable linting
      completion = true,  -- Enable autocompletion
      formatting = true,  -- Enable formatting
      useBundler = true,
    }
  }
})

-- Autocomplete
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  })
})

-- Treesitter Setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "ruby", "lua", "javascript", "html", "css" },
  highlight = { enable = true }
})

-- Rails navigation
vim.api.nvim_set_keymap("n", "<leader>a", ":A<CR>", { noremap = true, silent = true })

-- nvim keymaps
vim.api.nvim_set_keymap("n", "<leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>T", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "bd", ":bd<CR>", { noremap = true, silent = true })

