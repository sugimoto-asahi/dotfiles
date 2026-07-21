require("dapc").setup()

local dapc = require("dapc")

vim.api.nvim_create_user_command("Dap", function()
	dapc.start()
end, {})

vim.keymap.set("n", "<F5>", function()
	vim.cmd("Dap")
end, {})
