vim.pack.add({ "https://github.com/dlyongemallo/diffview-plus.nvim" })

local hooks = {
	-- disable formatting in diffivew, because we don't want to format on save
	-- after making changes to the indexs
	view_enter = function(view)
		vim.g.disable_autoformat = true
		vim.g.disable_autoformat = true
	end,
	view_leave = function(view)
		vim.g.disable_autoformat = false
		vim.b.disable_autoformat = false
	end,
}

require("diffview").setup({
	hooks = hooks,
})

vim.api.nvim_create_user_command("Gd", "DiffviewOpen", {})
vim.keymap.set("v", "do", ":diffget<CR>", { desc = "Diffget anything in selected range" })
vim.keymap.set("v", "dp", ":diffput<CR>", { desc = "Diffput anything in selected range" })
