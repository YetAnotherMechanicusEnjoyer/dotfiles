return {
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "eldritch",
        },
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                groups = {
                    "Normal",
                    "NormalNC",
                    "NormalFloat",
                    "Comment",
                    "Constant",
                    "Special",
                    "Identifier",
                    "Statement",
                    "PreProc",
                    "Type",
                    "Underlined",
                    "Todo",
                    "String",
                    "Function",
                    "Conditional",
                    "Repeat",
                    "Operator",
                    "Structure",
                    "LineNr",
                    "NonText",
                    "SignColumn",
                    "CursorLineNr",
                    "EndOfBuffer",
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "SnacksNormal",
                },
            })
        end,
    },
}
