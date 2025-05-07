require("nvchad.configs.lspconfig").defaults()

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup{}
lspconfig.bashls.setup{}
lspconfig.gitlab_ci_ls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.bashls.setup{}
lspconfig.vimls.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.dockerls.setup{}
lspconfig.gh_actions_ls.setup{}
lspconfig.jsonls.setup{}
lspconfig.ts_ls.setup{}
lspconfig.yamlls.setup{}
lspconfig.pyright.setup{}

-- read :h vim.lsp.config for changing options of lsp servers 
