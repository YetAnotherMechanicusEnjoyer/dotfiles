local keymap = vim.keymap
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- basic keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<Left>", "h")
keymap.set("n", "<Down>", "j")
keymap.set("n", "<Right>", "l")
keymap.set("n", "<Up>", "k")
keymap.set("v", "<Left>", "h")
keymap.set("v", "<Down>", "j")
keymap.set("v", "<Right>", "l")
keymap.set("v", "<Up>", "k")


-- nvim-tree

keymap.set("n", "<leader>e", ":Neotree<CR>")

-- telescope

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fn", "<cmd>Telescope help_tags<cr>")

-- formatter
keymap.set("n", "<leader>c", "<cmd>ClangFormat<cr>")

-- lsp
keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)

-- transparency
keymap.set("n", "<leader>cc", "<cmd>TransparentToggle<cr>")

-- bufferline
keymap.set("n", "<leader><Right>", ":BufferLineCycleNext<cr>")
keymap.set("n", "<leader><Left>", ":BufferLineCyclePrev<cr>")
