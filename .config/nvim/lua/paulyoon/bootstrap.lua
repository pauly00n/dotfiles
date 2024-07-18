-- BOOSTRAP FOR LAZY.NVIM PACKAGE MANAGER

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- lazy configuration: imports from plugins and lsp folders, the lua files inside them simply return values.
require("paulyoon.core.cleanlines")

require("lazy").setup({
    { import = "paulyoon.plugins" },
    { import = "paulyoon.plugins.lsp" },
    }, {
    install = {
        colorscheme = { "codedark" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

