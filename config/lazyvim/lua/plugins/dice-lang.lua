return {
    {
        "YetAnotherMechanicusEnjoyer/dice-syntax.nvim",
        lazy = false,
    },
    {
        "YetAnotherMechanicusEnjoyer/dice-lsp.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("dice_lsp").setup()
        end,
    },
}
