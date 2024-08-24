return {
    'benlubas/molten-nvim',
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    init = function()
        -- Key mappings for molten-nvim
        -- I find auto open annoying, keep in mind setting this option will require setting
        -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
        -- vim.g.molten_auto_open_output = false

        -- optional, I like wrapping. works for virt text and the output window
        vim.g.molten_wrap_output = true

        -- Output as virtual text. Allows outputs to always be shown, works with images, but can
        -- be buggy with longer images
        vim.g.molten_virt_text_output = true

        -- this will make it so the output shows up below the \`\`\` cell delimiter
        vim.g.molten_virt_lines_off_by_1 = true

        vim.api.nvim_set_hl(0, "MoltenVirtualText", { fg = "#000000", bg = "#FFFFFF" })

        vim.keymap.set("n", "<space>mi", ":MoltenInit<CR>",
            { silent = true, desc = "Initialize the plugin" })
        vim.keymap.set("n", "<space>e", ":MoltenEvaluateOperator<CR>",
            { silent = true, desc = "run operator selection" })
        vim.keymap.set("n", "<space>rl", ":MoltenEvaluateLine<CR>",
            { silent = true, desc = "evaluate line" })
        vim.keymap.set("n", "<space>rr", ":MoltenReevaluateCell<CR>",
            { silent = true, desc = "re-evaluate cell" })
        vim.keymap.set("v", "<space>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
            { silent = true, desc = "evaluate visual selection" })
        vim.keymap.set("n", "<space>so", ":MoltenShowOutput<CR>", { desc = "show output window", silent = true })
    end,
}
