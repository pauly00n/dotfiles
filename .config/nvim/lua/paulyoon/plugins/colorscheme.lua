return {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
        vim.o.background = 'dark'
        require('vscode').setup({
            -- If using alacritty, turn transparency on. Otherwise don't
            transparent = true,
            underline_links = true;
        })
        vim.cmd("colorscheme vscode")
    end,
}
