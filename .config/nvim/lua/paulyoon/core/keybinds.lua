-- shorthand for the vim remap variables
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- sets mapleader key
vim.g.mapleader = " "

-- nohlsearch
map('n', '<CR>', ":nohlsearch<CR> <CR>")

-- map to easily access neotree which is the best
map('n', '<leader>n', ":Neotree right<CR>")

-- map for maximizer
map('n', '<leader>m', ':MaximizerToggle!<CR>')

-- map(s) for neoterm
map('n', '<leader>tm', ':Topen [resize=40]<CR>')
map('i', '<A-q>', '<Esc>:Ttoggle<CR>')
map('t', '<A-q>', '<C-d>')

-- map(s) for telescope
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- lets me switch windows easier
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')

-- lets me switch buffers easier
map('n', '[', ':bp<CR>')
map('n', ']', ':bn<CR>')

-- tmux pane changing keybinds
map('n', '<A-h>', ':TmuxNavigateLeft<CR>')
map('n', '<A-j>', ':TmuxNavigateDown<CR>')
map('n', '<A-k>', ':TmuxNavigateRight<CR>')
map('n', '<A-l>', ':TmuxNavigateUp<CR>')

-- obsidian keybinds
map("n", "<leader>oo", ":cd /Users/paulyoon/Library/Mobile\\ Documents/com~apple~CloudDocs/obsidian/paulyoon<cr>")
map("n", "<leader>on", ":ObsidianTemplate<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
map("n", "<leader>os", ":Telescope find_files search_dirs={\"/Users/paulyoon/Library/Mobile\\ Documents/com~apple~CloudDocs/obsidian/paulyoon\"}<cr>")
map("n", "<leader>og", ":Telescope live_grep search_dirs={\"/Users/paulyoon/Library/Mobile\\ Documents/com~apple~CloudDocs/obsidian/paulyoon\"}<cr>")
map("n", "<leader>ok", ":!mv '%:p' /Users/paulyoon/Library/Mobile\\ Documents/com~apple~CloudDocs/obsidian/paulyoon/sort<cr>:bd<cr>")
-- delete file in current buffer
map("n", "<leader>od", ":!rm '%:p'<cr>:bd<cr>")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
