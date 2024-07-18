local M = {}

function M.clean_colab_comments()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local cleaned_lines = {}

    for _, line in ipairs(lines) do
        if not string.match(line, "<!-- #region") and not string.match(line, "<!-- #endregion") then
            table.insert(cleaned_lines, line)
        end
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, cleaned_lines)
end

return M
