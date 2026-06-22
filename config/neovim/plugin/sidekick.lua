vim.pack.add({ "https://github.com/folke/sidekick.nvim" })

require("sidekick").setup({
	-- cli keymaps for while we are inside the cli terminal
	cli = {
		win = {
			keys = {
				buffers = { "<leader>ab", "buffers", mode = "n", desc = "AI buffer picker" },
				files = { "<leader>af", "files", mode = "n", desc = "AI file picker" },
				prompt = { "<leader>ap", "prompt", mode = "n", desc = "AI prompt picker" },
			},
		},
		picker = "telescope",
	},
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal mode to normal mode" })

-- keymaps for invoking the cli
local cli = require("sidekick.cli")

vim.keymap.set({ "n", "t" }, "<leader>ai", function()
	cli.toggle({ name = "claude", focus = true })
end, { desc = "Toggle AI assistant" })

vim.keymap.set({ "n", "x" }, "<leader>at", function()
	cli.send({ msg = "{this}" })
end, { desc = "Send current context to AI" })

-- nes keymaps
-- jump or apply in normal mode (blink covers insert mode)
vim.keymap.set("n", "<Tab>", function()
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>"
	end
end, { desc = "Goto / Apply Next Edit Suggestion", expr = true })

-- clear active edits
vim.keymap.set("n", "<Esc>", function()
	if require("sidekick.nes").have() then
		require("sidekick.nes").clear()
		return ""
	end
	return "<Esc>"
end, { desc = "Clear NES edits or default Esc" })
