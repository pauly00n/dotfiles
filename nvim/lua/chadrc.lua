-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "vscode_dark",
    transparency = true,

	hl_override = {
        CursorLine = {
            bg = "one_bg",
        },
        LineNr = {
            fg = "light_grey",
        },
        Include = {
            fg = "dark_purple",
        },
        Comment = {
            fg = "comment",
        },
    },
    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default",
    },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
    statusline = {
        theme = "vscode_colored",
    },
}

return M
