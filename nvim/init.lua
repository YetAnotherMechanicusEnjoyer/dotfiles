require("config.lazy")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins.comment")
require("plugins.telescope")
require("plugins.lsp-config")
require("plugins.completions")
require("plugins.rich-presence")
require("plugins.transparent")
require("plugins.cursorline")
require("plugins.neoscroll")
require("plugins.flirt")
require("plugins.indent-blankline")
require("plugins.nvim-tree")
require("plugins.gitsigns")
require("plugins.bufferline")
require("plugins.neotree")
require("plugins.galaxyline")
require("plugins.treesitter")
require("plugins.noice")
require("plugins.toggleterm")
require("plugins.which-key")
require("plugins.numb")

vim.g.strip_whitespace_confirm = 0
vim.opt.termguicolors = true

vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"})
