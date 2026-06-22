vim.pack.add({"https://www.github.com/stevearc/oil.nvim"})
require("oil").setup()

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open explorer" })

