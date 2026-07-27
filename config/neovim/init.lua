local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function make_plugin_path(name)
	local base_path = vim.fs.joinpath(vim.fn.stdpath("data"), "pack/core/opt")
	return vim.fs.joinpath(base_path, name)
end

local dev = os.getenv("NVIM_DEV")
if dev then
	if dev == "DEV" then
		local dev_config_dir = vim.fs.normalize("~/.config/nvim-dev")
		vim.opt.runtimepath:append(dev_config_dir)
		local dev_config = require("config")
		for name, dir in pairs(dev_config) do
			local original_path = make_plugin_path(name)
			local windows_original_path = original_path:gsub("/", "\\")
			-- remove original paths
			vim.opt.runtimepath:remove(original_path)
			vim.opt.runtimepath:remove(windows_original_path)

			-- add dev paths
			vim.opt.runtimepath:append(dir)
		end
		vim.notify("Config: DEV")
	elseif dev == "RELEASE" then
		vim.notify("Config: RELEASE")
	else
		vim.notify('Invalid value for NVIM_DEV. Accepted values: "DEV", "RELEASE"', vim.log.levels.WARN)
	end
else
	vim.notify("NVIM_DEV environment variable not set, defaulting to release config", vim.log.levels.INFO)
end

require("keymaps")
require("options")
require("lsp")
