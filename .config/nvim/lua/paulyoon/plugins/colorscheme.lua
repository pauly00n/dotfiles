return {
    "tomasiser/vim-code-dark",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme codedark")
        vim.cmd("let loaded_matchparen = 1")
    end,
}
