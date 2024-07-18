-- shorthand once again
local g = vim.g
local o = vim.o

vim.api.nvim_command('filetype plugin indent on')

-- clipboard from other apps
o.clipboard = 'unnamedplus'

-- line numbers/relative line numbers hybrid
o.number = true
o.relativenumber = true

-- cursor line which is rly cool
o.cursorline = true

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

-- airline options
g['airline_solorized_bg'] = 'dark'
g['airline_powerline_fonts'] = 1
g['airline#extension#tabline#enable'] = 1
g['airline#extension#tabline#left_sep'] = ' '
g['airline#extension#tabline#left_alt_sep'] = '|'
g['airline#extension#tabline#formatter'] = 'unique_tail'

-- disables those weird ~ things for end of buffer lines
vim.opt.fillchars = {eob = " "}

-- neoterm options
g['neoterm_default_mod'] = 'vertical'
g['neoterm_size'] = 60
g['neoterm_autoinsert'] = 1

vim.g.python3_host_prog = vim.fn.expand("~/path/to/venv/bin/python3")
