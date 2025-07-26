return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            { "3rd/image.nvim", opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        opts = {},
        config = function()
            require("neo-tree").setup({
                default_component_configs = {
                    git_status = {
                        symbols = {
                            added = "＋",
                            deleted = "🗑",
                            renamed = "🖊",
                            untracked = "+",
                            ignored = "⮿",
                            unstaged = "",
                            staged = "",
                            conflict = "⮻",
                        },
                    },
                },
                filesystem = {
                    window = {
                        mappings = {
                            ["<F5>"] = "refresh",
                            ["p"] = {
                                "toggle_preview",
                                config = {
                                    use_float = false,
                                    use_image_nvim = true,
                                    title = "Neo-tree Preview",
                                },
                            },
                        },
                        width = 30,
                    },
                    filtered_items = {
                        visible = true,
                    },
                },
            })
        end,
    },
}
