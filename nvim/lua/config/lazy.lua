vim.g.mapleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require('lazy').setup({
    -- lua functions
    "nvim-lua/plenary.nvim",

    --colorscheme
    {"bluz71/vim-moonfly-colors", branch = 'cterm-compat'},
    "rktjmp/lush.nvim",
    "ray-x/aurora",
    "folke/tokyonight.nvim",
    "Abstract-IDE/Abstract-cs",
    "Mofiqul/vscode.nvim",
    "shaunsingh/nord.nvim",
    {"rose-pine/neovim", as = "rose-pine" },
    "dam9000/colorscheme-midnightblue",
    'nonetallt/vim-neon-dark',
    'backdround/melting',
    'daenuprobst/lcarsoft',
    "catppuccin/nvim",
    "scottmckendry/cyberdream.nvim",
    "navarasu/onedark.nvim",
    "eldritch-theme/eldritch.nvim",
    {
        'mustardfrog/pinkish_day',
        lazy = true,
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {
      'comfysage/evergarden',
      priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
      opts = {
        transparent_background = true,
        contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
        overrides = { }, -- add custom overrides
      }
    },
    'roobert/palette.nvim',
    {
      "timofurrer/edelweiss",
      lazy = false, -- make sure we load this during startup, because it's the main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/nvim")
        vim.cmd([[colorscheme edelweiss]])
      end
    },
    "xero/evangelion.nvim",

    -- utility
    "jghauser/mkdir.nvim",

    -- notification
     'rcarriga/nvim-notify',

    -- indent_blankline
    "lukas-reineke/indent-blankline.nvim",

    --transpartent
    "xiyaowong/transparent.nvim",

    -- essentials
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",

    -- leetcode
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    },

    -- file explorer
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"nvim-telescope/telescope.nvim", branch = "0.1.x"},

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    -- icons
    "kyazdani42/nvim-web-devicons",

    -- cursorline
    "yamatsum/nvim-cursorline",


    -- autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup{} end
    },

    -- Discord Rich presence
    'andweeb/presence.nvim',

    -- LSP
    {
        --"williamboman/mason.nvim",
        --"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    -- header
    "Nero-F/vim-tek-header",

    -- treesitter
    "nvim-treesitter/nvim-treesitter",

    -- formatter
    {
      'stevearc/conform.nvim',
    },

    --clang
    "rhysd/vim-clang-format",

    --scroll
    "karb94/neoscroll.nvim",

    --floating windows
    "tamton-aquib/flirt.nvim",

    --Github
    "lewis6991/gitsigns.nvim",

    --Highlight Colors
    "brenoprata10/nvim-highlight-colors",

    --Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    --Dressing
    {
        'stevearc/dressing.nvim',
        opts = {},
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    --Status Bar
    "nvimdev/galaxyline.nvim",

    --Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },

    --Toggle Terms
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        keys = {
            { "<Leader>at", "<cmd>ToggleTerm direction=float<CR>", desc = "terminal float" },
        },
    },

    --Which Key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>;",
                function()
                    require("which-key").show()
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    --Numb
    "nacro90/numb.nvim",

})
