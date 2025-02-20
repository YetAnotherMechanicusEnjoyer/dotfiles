local ts = require("nvim-treesitter.configs")

ts.setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "json",
    "jsonc",
    "html",
    "css",
    "scss",
    "lua",
    "bash",
    "fish",
    "diff",
    "vim",
    "regex",
    "markdown",
    "markdown_inline",
  },
  -- Comments in jsx and js
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "<CR>",
      scope_incremental = "grc",
      node_decremental = "<BS>",
    },
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = function(_, bufnr) --
      -- Extend this to other languages by adding `lang == "x"` where x is the language
      return vim.api.nvim_buf_line_count(bufnr) > 10000
    end,
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true,
    disable = {
      "dart",
    },
  },
})

