return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {"williamboman/mason.nvim"},
    { "hrsh7th/cmp-nvim-lsp" },
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local default = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html lsp 
    lspconfig["html"].setup({
      capabilities = default,
      filetypes = { "html" }
    })

    -- configure css lsp
    lspconfig["cssls"].setup({
      capabilities = default,
      filetypes = { "css" }
    })

    -- configure .md lsp
    lspconfig["marksman"].setup({
      capabilities = default,
      filetypes = { "md" },
    })

    -- configure clangd lsp
    lspconfig["clangd"].setup({
      capabilities = default,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },

    })

    -- configure texlab lsp 
    lspconfig["texlab"].setup({
      capabilities = default,
      filetypes = { "tex" }
    })

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup({
      capabilities = default,
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = default,
      filetypes = { "html", "typescriptreact", "javascriptreact" }, -- , "css", "sass", "scss", "less", "svelte"
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = default,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = default,
      settings = {
                   -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
