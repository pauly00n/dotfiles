return {
  "lervag/vimtex",
  init = function()
    vim.g['vimtex_view_method'] = 'zathura'
    vim.g['vimtex_quickfix_mode'] = 0              -- suppress error reporting on save and build
    vim.g['tex_conceal'] = 'mgs'
    vim.g['vimtex_matchparen_enabled'] = 0
    vim.g['vimtex_delim_stopline'] = 1
    vim.o.conceallevel = 1
    vim.g['vimtex_log_ignore'] = ({                -- Error suppression:
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })
  end,
}
