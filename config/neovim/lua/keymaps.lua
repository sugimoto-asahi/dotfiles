-- Contains general vim keymaps
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", ":vertical resize e2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Centre after moving up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Centre after moving down" })

vim.keymap.set("n", "<Esc>", "<C-\\><C-n>", { desc = "Terminal to normal mode" })

vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all other tabs" })

vim.keymap.set("n", "<leader>go", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostic in floating window" })
