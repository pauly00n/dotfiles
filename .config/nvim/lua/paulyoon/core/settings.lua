-- shorthand once again
local g = vim.g
local o = vim.o

vim.api.nvim_command('filetype plugin indent on')

-- clipboard from other apps
o.clipboard = 'unnamedplus'

-- line numbers/relative line numbers hybrid
o.number = true
o.relativenumber = true

g['vimtex_matchparen_loaded'] = 1

-- cursor line which is rly cool
o.cursorline = true

-- auto set tabpage fill highlight group
-- local function set_highlight()
--    vim.cmd('highlight BufferTabpageFill guibg=NONE')
-- end

-- Create an auto command that runs when Neovim launches
-- vim.api.nvim_create_autocmd('VimEnter', {
--  pattern = '*',
--  callback = set_highlight,
-- })

-- hide unused buffers
o.hidden = true

-- show title of file
o.title = true

-- better searching options
o.ignorecase = true
o.smartcase = true

-- show replacement buffers in a split screen
o.splitbelow = true
o.splitright = true

-- fixed tab spacing
o.autoindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

-- better autocomplete
o.completeopt = 'noinsert'
o.completeopt = 'menuone'
o.completeopt = 'noselect'

-- show replacements in a split window
o.inccommand = 'split'

-- show an advanced menu
o.wildmenu = true

-- enable incremental search
o.incsearch = true

-- faster scrolling
o.ttyfast = true

-- doctest options
g['doctest_verbose_string'] = "Succeeded"
g['doctest_remove_pycache'] = 0
g['doctest_traceback_info'] = 0

-- disables those weird ~ things for end of buffer lines
vim.opt.fillchars = { eob = " " }

vim.g.python3_host_prog = vim.fn.expand("~/path/to/venv/bin/python3")
