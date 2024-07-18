return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require('lualine').setup({
                options = {
                    theme = 'vscode',
                    component_separators = '',
                    section_separators = '',
                    icons_enabled = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {
                        { 'mode', color = { gui = 'bold' } },
                    },
                    lualine_b = {
                        { 'branch' },
                        { 'diff', colored =false },
                    },
                    lualine_c = {
                        { 'filename', file_status = true },
                        { 'diagnostics' },
                    },
                    lualine_x = {
                        'filetype',
                        'encoding',
                        'fileformat',
                    },
                    lualine_y = { 'progress' },
                    lualine_z = {
                        { 'location', color = { gui = 'bold' } },
                    },
                },
                extensions = { 'quickfix', 'nvim-tree' }
        })
    end
}
