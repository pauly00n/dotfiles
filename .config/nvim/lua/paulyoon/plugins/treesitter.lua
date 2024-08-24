return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "javascript", "html", "tsx" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
