-- General
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- Spaces and tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Visual
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.colorcolumn = "80"

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitright = true

-- Prevent "o", when pressed on a comment line, from starting the next line
-- with a comment
vim.api.nvim_create_autocmd("FileType", {
	group = "UserConfig",
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "o" })
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "UserConfig",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Persistent undo
vim.opt.undofile = true

local undodir = vim.fn.stdpath("data") .. "/undo"

-- Create the directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.undodir = undodir

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.treesitter.foldexpr()"

-- Start editing buffers with all folds open
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "auto"
