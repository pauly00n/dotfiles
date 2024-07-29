-- shorthand for the vim remap variables  
local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- sets mapleader key
vim.g.mapleader = " "

-- map to easily access init.lua file
map('n', '<leader>v', ":exe 'edit' stdpath('config').'/init.lua'<CR>")

-- map to easily access neotree which is the best
map('n', '<leader>n', ":Neotree<CR>")

-- map for maximizer 
map('n', '<leader>m', ':MaximizerToggle!<CR>')

-- map(s) for neoterm
map('n', '<leader>tm', ':Ttoggle<CR>')
map('i', '<c-q>', '<Esc>:Ttoggle<CR>')
map('t', '<c-q>', '<C-d>')

-- map(s) for telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- lets me switch windows easier
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')

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

local map2 = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map2('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map2('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map2('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map2('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map2('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map2('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map2('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map2('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map2('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map2('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map2('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map2('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map2('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map2('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map2('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map2('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map2('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map2('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map2('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map2('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map2('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map2('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
