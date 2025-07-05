vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.cmd("set rnu")
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard","unnamedplus")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require("lazy").setup("plugins")
local builtin = require ("telescope.builtin")
vim.keymap.set('n','<C-p>',builtin.find_files, {})
vim.keymap.set('n','<C-n>', ':Neotree toggle<CR>')


local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "c", "vim","vimdoc","javascript", "html","lua", "css"},
  highlight = { enable = true },
  indent = { enable = true },
})

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- If using the above, then `/path/to/venv/bin/python -m debugpy --version`
-- must work in the shell

vim.cmd("colorscheme carbonfox")
