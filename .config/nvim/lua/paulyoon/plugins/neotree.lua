return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.cmd [[
      highlight NeoTreeDotFile guifg = #aaaaaa guibg = NONE
      ]]
        vim.cmd [[
      highlight NeoTreeStats guifg = #aaaaaa guibg = NONE
      ]]
        vim.cmd [[
      highlight NeoTreeDimText guifg = #aaaaaa guibg = NONE
      ]]
    end
}
