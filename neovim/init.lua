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
require("vim-options")
require("lazy").setup("plugins")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Deixa o fundo do buffer transparente
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]

-- Barra de números opaca com background do OneDark
vim.opt.cursorline = true
vim.cmd [[
  hi LineNr guibg=#282c34 guifg=#5c6370
  hi CursorLineNr guibg=#282c34 guifg=#ffffff
]]

require("ibl").setup()
vim.snippet = nil
vim.opt.signcolumn = "yes"
