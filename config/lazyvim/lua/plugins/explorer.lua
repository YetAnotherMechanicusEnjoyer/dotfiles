return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerGitStatusModified",
                    { fg = "#A700FF", bold = true }
                )
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerGitStatusAdded",
                    { fg = "#03FF9C", bold = true }
                )
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerGitStatusUntracked",
                    { fg = "#03FF9C", bold = true }
                )
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerGitStatusDeleted",
                    { fg = "#FE016E", bold = true }
                )
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerPathHidden",
                    { fg = "#999999" }
                )
                vim.api.nvim_set_hl(
                    0,
                    "SnacksPickerPathIgnored",
                    { fg = "#777777", italic = true }
                )
            end,
        })
    end,
    ---@type snacks.Config
    opts = {
        picker = {
            sources = {
                explorer = {
                    focus = "list",
                    layout = {
                        layout = {
                            position = "right",
                            width = 40,
                        },
                    },
                    hidden = true,
                    ignored = true,
                },
            },
            win = {
                input = {
                    keys = {
                        ["p"] = "toggle_preview",
                        ["<F5>"] = "explorer_refresh",
                    },
                },
            },
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                local explorers = Snacks.picker.get({ source = "explorer" })

                if #explorers > 0 then
                    explorers[1].list.win:focus()
                else
                    Snacks.picker.explorer({
                        cwd = LazyVim and LazyVim.root() or vim.fn.getcwd(),
                        focus = "list",
                    })
                end
            end,
            desc = "Explorer Snacks (Root Dir)",
        },
    },
}
