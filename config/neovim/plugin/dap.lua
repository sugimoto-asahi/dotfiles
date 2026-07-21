vim.pack.add({ "https://github.com/mfussenegger/nvim-dap", "https://github.com/igorlfs/nvim-dap-view" })

local dap = require("dap")
dap.adapters["lldb-dap"] = {
	type = "executable",
	command = "lldb-dap",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb-dap",
		request = "launch",
	},
}
