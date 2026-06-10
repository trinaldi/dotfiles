return {
  {
    "mattn/emmet-vim",
    event = "InsertEnter",
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.cmd([[autocmd FileType html,css,typescriptreact EmmetInstall]])

      vim.api.nvim_set_keymap(
        "i",
        "<C-z><Leader>",
        "<C-y>,",
        { noremap = true, silent = true }
      )
    end
  }
}
