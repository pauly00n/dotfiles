return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require('lualine').setup({
            options = {
                theme = 'vscode',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- component_separators = '',
                -- section_separators = '',
                icons_enabled = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = {
                    { 'mode', color = { gui = 'bold' } },
                },
                lualine_b = {
                    { 'filename', colored = false }
                },
                lualine_c = {
                    { 'branch' },
                    { 'diagnostics' }
                },

                lualine_x = {
                    { 'diff',     colored = true },
                    { 'location', color = { gui = 'bold' } },
                    'encoding',
                    'filetype',
                    'fileformat',
                },
                lualine_y = {
                    function()
                        local filepath = vim.fn.expand('%:p')                   -- Get the full path of the current file
                        local directory = vim.fn.fnamemodify(filepath, ':h')    -- Get the directory part of the path
                        local folder_name = vim.fn.fnamemodify(directory, ':t') -- Get the directory part of the path
                        return '󰉖 ' .. folder_name
                    end,
                },
                lualine_z = {
                },
            },
            extensions = { 'quickfix', 'nvim-tree' },
        })
    end
}
