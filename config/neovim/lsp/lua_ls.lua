---@brief
---
--- https://github.com/luals/lua-language-server
---
--- Lua language server.
---
--- `lua-language-server` can be installed by following the instructions [here](https://luals.github.io/#neovim-install).
---
--- The default `cmd` assumes that the `lua-language-server` binary can be found in `$PATH`.
---
--- If you primarily use `lua-language-server` for Neovim, and want to provide completions,
--- analysis, and location handling for plugins on runtime path, you can use the following
--- settings.
---
--- ```lua
--- vim.lsp.config('lua_ls', {
---   on_init = function(client)
---     if client.workspace_folders then
---       local path = client.workspace_folders[1].name
---       if
---         path ~= vim.fn.stdpath('config')
---         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
---       then
---         return
---       end
---     end
---
---     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
---       runtime = {
---         -- Tell the language server which version of Lua you're using (most
---         -- likely LuaJIT in the case of Neovim)
---         version = 'LuaJIT',
---         -- Tell the language server how to find Lua modules same way as Neovim
---         -- (see `:h lua-module-load`)
---         path = {
---           'lua/?.lua',
---           'lua/?/init.lua',
---         },
---       },
---       -- Make the server aware of Neovim runtime files
---       workspace = {
---         checkThirdParty = false,
---         library = {
---           vim.env.VIMRUNTIME,
---           -- Depending on the usage, you might want to add additional paths
---           -- here.
---           -- '${3rd}/luv/library',
---           -- '${3rd}/busted/library',
---         },
---         -- Or pull in all of 'runtimepath'.
---         -- NOTE: this is a lot slower and will cause issues when working on
---         -- your own configuration.
---         -- See https://github.com/neovim/nvim-lspconfig/issues/3189
---         -- library = vim.api.nvim_get_runtime_file('', true),
---       },
---     })
---   end,
---   settings = {
---     Lua = {},
---   },
--- })
--- ```
---
--- See `lua-language-server`'s [documentation](https://luals.github.io/wiki/settings/) for an explanation of the above fields:
--- * [Lua.runtime.path](https://luals.github.io/wiki/settings/#runtimepath)
--- * [Lua.workspace.library](https://luals.github.io/wiki/settings/#workspacelibrary)
---

local root_markers1 = {
	".emmyrc.json",
	".luarc.json",
	".luarc.jsonc",
}
local root_markers2 = {
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",
}

-- The lua language server indexes subdirectories of any directory specified in
-- workspace.library. Since this is the case, when we are in dev mode, we want
-- to make sure that all the LSP is able to see are our dev repositories, instead
-- of plugin code in packpath. Doing this will avoid problems such as the LSP
-- complaining about multiple definitions, and incorrect go-to-definitions.
-- To make this work, we use the names of plugins
-- that we have current dev repositories for, and remove them from workspace.library.
-- We also remove the data stdpath, since they are parent directories of
-- where plugin code sits.
-- @see https://luals.github.io/wiki/settings/#workspacelibrary
local data_dir = vim.fn.stdpath("data")
local plugin_base_dir = vim.fs.joinpath(data_dir, "site/pack/core/opt/")
local remove_list = { data_dir .. "/site" }
if vim.g.mode == "DEV" then
	for _, plugin in ipairs(vim.g.dev_plugins) do
		local plugin_dir = plugin_base_dir .. plugin
		table.insert(remove_list, plugin_dir)
	end
end

local runtime_files = vim.api.nvim_get_runtime_file("", true)
local filtered = vim.iter(runtime_files)
	:filter(function(item)
		return not vim.tbl_contains(remove_list, item)
	end)
	:totable()

vim.print(filtered)

---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers1, root_markers2, { ".git" } }
		or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { ".git" }),
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = "Disable" },
			workspace = {
				library = filtered,
			},
			diagnostics = {
				disable = { "unused-function" },
			},
		},
	},
}
