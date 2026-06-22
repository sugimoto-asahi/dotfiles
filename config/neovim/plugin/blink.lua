vim.pack.add({
	-- autocomplete plugin
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

local blink = require("blink.cmp")
blink.setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true },
	},
	signature = { enabled = true },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			snippets = {
				opts = {
					friendly_snippets = false,
				},
				override = {
					get_trigger_characters = function(_)
						return { "/" }
					end,
				},
			},
		},
	},
	-- built in plugin directory with cargo build --release
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
