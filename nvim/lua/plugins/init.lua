return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        opts = {}, -- nuke NvChad's opts merge
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup()

            local parsers = {
                "vim", "vimdoc", "lua", "rust", "html", "css",
                "markdown", "markdown_inline", "javascript", "typescript",
                "tsx", "c", "json", "bash",
            }
            ts.install(parsers)

            local disable = { tex = true, latex = true }
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    if disable[ft] then return end
                    local lang = vim.treesitter.language.get_lang(ft)
                    if lang and pcall(vim.treesitter.start, args.buf, lang) then
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g["vimtex_view_method"] = "sioyek"
            vim.g["vimtex_view_sioyek_exe"] = "/Applications/sioyek.app/Contents/MacOS/sioyek"
            -- old zathura setup (GTK redraw-loop / 150% cpu bug). revert by uncommenting:
            -- vim.g["vimtex_view_method"] = "zathura_simple"
            -- vim.g["vimtex_view_zathura_options"] = "--fork"
            -- vim.g["vimtex_view_zathura_use_synctex"] = 0
            vim.g["vimtex_quickfix_mode"] = 0 -- suppress error reporting on save and build
            vim.g["tex_conceal"] = "mgs"
            vim.o.conceallevel = 2
            -- vim.g.vimtex_matchparen_enabled = 0 -- NO MATCHPAREN!!! HOORAY
            -- vim.g.loaded_matchparen = 1
            vim.g["vimtex_log_ignore"] = { -- Error suppression:
                "Underfull",
                "Overfull",
                "specifier changed to",
                "Token not allowed in a PDF string",
            }
        end,
    },
    {
        "sirver/ultisnips",
        lazy = false,
        config = function()
            vim.g["UltiSnipsExpandTrigger"] = "<tab>"
            vim.g["UltiSnipsJumpForwardTrigger"] = "<tab>"
            vim.g["UltiSnipsJumpBackwardTrigger"] = "<s-tab>"
        end,
    },
    

    {
        "folke/noice.nvim",
        lazy = false,
        opts = {
            -- add any options here
            lsp = {
                signature = {
                    enabled = false,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                            { find = "%d fewer lines" },
                            { find = "%d more lines" },
                        },
                    },
                    opts = { skip = true },
                },
            },
            presets = {
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   "rcarriga/nvim-notify",
        },
    },
    
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        event = "User FilePost",
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "blankline")

            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)

            dofile(vim.g.base46_cache .. "blankline")
        end,
    },
}
