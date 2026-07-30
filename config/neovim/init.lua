local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local dev = os.getenv("NVIM_DEV")
if dev then
	if dev == "DEV" then
		vim.g.mode = "DEV"
		local dev_config_dir = vim.fs.normalize("~/.config/nvim-dev")
		vim.opt.runtimepath:append(dev_config_dir)
		local dev_config = require("config")
		-- add dev paths
		for name, dir in pairs(dev_config) do
			vim.opt.runtimepath:append(dir)
		end
		vim.notify("Config: DEV")
	elseif dev == "RELEASE" then
		vim.g.mode = "RELEASE"
		vim.notify("Config: RELEASE")
	else
		vim.g.mode = "RELEASE"
		vim.notify('Invalid value for NVIM_DEV. Accepted values: "DEV", "RELEASE"', vim.log.levels.WARN)
	end
else
	vim.notify("NVIM_DEV environment variable not set, defaulting to release config", vim.log.levels.INFO)
end

require("keymaps")
require("options")
require("lsp")
