vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope-fzy-native.nvim" })
vim.pack.add({ "https://www.github.com/nvim-telescope/telescope.nvim" })

require("telescope").load_extension("fzy_native")

-- keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in project" })
vim.keymap.set("n", "<leader>fa", function()
	builtin.find_files({ no_ignore = true })
end, { desc = "Find files (including ignored)" })

vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fls", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>gx", builtin.diagnostics, { desc = "Diagnostics" })

-- lsp related
vim.keymap.set("n", "<leader>gd", function()
	builtin.lsp_definitions({
		-- jump_type = "tab",
	})
end, opts)

vim.keymap.set("n", "<leader>gD", function()
	builtin.lsp_implementations({
		jump_type = "tab",
	})
end, opts)

vim.keymap.set("n", "<leader>gu", builtin.lsp_references, { desc = "References" })

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
})
