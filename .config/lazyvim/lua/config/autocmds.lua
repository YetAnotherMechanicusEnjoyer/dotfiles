-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "h", "cpp", "hpp" },
    callback = function()
        vim.b.autoformat = false
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.c",
    callback = function()
        vim.lsp.buf_notify(0, "workspace/didChangeWatchedFiles", {
            changes = {
                { uri = vim.uri_from_bufnr(0), type = 2 },
            },
        })
    end,
})
