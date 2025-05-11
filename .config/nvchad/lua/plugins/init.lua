return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    --config = function()
    --  local mason_registry = require('mason-registry')
    --  local codelldb = mason_registry.get_package("codelldb")
    --  local extension_path = codelldb:get_install_path() .. "/extension/"
    --  local codelldb_path = extension_path .. "adapter/codelldb"
    --  local liblldb_path = extension_path .. "lld/lib/liblldb.dylib"
    --  local cfg = require('rustaceanvim.config')

    --  vim.g.rustaceanvim = {
    --    dap = {
    --      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    --    },
    --  }
    --end
  },

  {
    "mfussennegger/nvim-dap",
    config = function()
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('dapui').setup()
    end,
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require("cmp").setup.buffer({
        sources = { { name = "crates" } }
      })
    end
  },

  "deadbaed/vim-epitech",
  vim.keymap.set('n', '<leader>ce', ':TekAddHeader<CR>'),

  "vim-test/vim-test",
  vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>tT', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>'),

  "MunifTanjim/nui.nvim",
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
    init = function()
      local banned_messages = {
        "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
        "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
  },

  -- Noice (cmdline)
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      messages = { enabled = false },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    })
  end
  },

  -- test new blink
  --
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
    		"vim", "lua", "vimdoc",
        "html", "css"
  	  },
    },
  },
}
