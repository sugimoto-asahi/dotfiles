local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("keymaps")
require("options")
require("lsp")
