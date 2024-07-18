-- function used to clean the lines of formatting used in colab for ipynb files

return {
    "GCBallesteros/jupytext.nvim",
    config = function()
        require("jupytext").setup({
            style = "markdown",
            output_extension = "md",
            force_ft = "markdown",
        })
    -- Autocmd to clean Colab comments after loading a buffer
    -- 
        vim.cmd([[
            augroup JupytextCleanup
                autocmd!
                autocmd BufReadPost *.md lua require('paulyoon.core.cleanlines').clean_colab_comments()
            augroup END
        ]])
    end
}

