require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ii", "/", { desc = "search within file easier" })

-- nohlsearch
map('n', '<ESC>', ":nohlsearch<CR>")

-- lets me scroll down on lines that take up multiple lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')

-- lets me switch windows easier
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')

-- lets me switch buffers easier
map('n', '<leader>[', ':bp<CR>')
map('n', '<leader>]', ':bn<CR>')

-- tmux pane changing keybinds
map('n', '<A-h>', ':TmuxNavigateLeft<CR>')
map('n', '<A-j>', ':TmuxNavigateDown<CR>')
map('n', '<A-k>', ':TmuxNavigateRight<CR>')
map('n', '<A-l>', ':TmuxNavigateUp<CR>')

-- obsidian keybinds
map("n", "<leader>oo", ":cd /Users/paulyoon/Library/Mobile\\ Documents/iCloud~md~obsidian/documents/paulyoon<cr>")
map("n", "<leader>on", ":ObsidianTemplate<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>:noh<cr>")
map("n", "<leader>os", ":Telescope find_files search_dirs={\"/Users/paulyoon/Library/Mobile\\ Documents/iCloud~md~obsidian/documents/paulyoon\"}<cr>")
map("n", "<leader>og", ":Telescope live_grep search_dirs={\"/Users/paulyoon/Library/Mobile\\ Documents/iCloud~md~obsidian/documents/paulyoon\"}<cr>")
map("n", "<leader>ok", ":!mv '%:p' /Users/paulyoon/Library/Mobile\\ Documents/iCloud~md~obsidian/documents/paulyoon/sort<cr>:bd<cr>")
map("n", "<leader>oc", ":execute \"edit \". \"%:h/../inbox/\". strftime(\"%Y-%m-%d\") . \"_\"")

-- delete file in current buffer
map("n", "<leader>od", ":!rm '%:p'<cr>:bd<cr>")

map("n", "E", "$")
map("n", "B", "^")
map("v", "E", "$")
map("v", "B", "^")
