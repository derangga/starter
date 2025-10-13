require("nvchad.configs.lspconfig").defaults()

local vue_language_server = vim.fn.expand(vim.fn.stdpath "data" ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server")
local servers = {
    bashls = {},
    clangd = {},
    cssls = {},
    gopls = {},
    html = {},
    jsonls = {},
    lua_ls = {},
    marksman = {},
    sqls = {},
    tailwindcss = {},
    ts_ls = {
        init_options = {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server,
                    languages = { "vue", "javascript", "typescript" },
                },
            },
        },
        filetypes = {
            "typescript",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
        },
    },
    vue_ls = {
        init_options = {
            vue = {
                hybridMode = false, -- Recommended to turn off hybridMode
            },
        },
        filetypes = { "vue" },
    },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- https://github.com/naborisk/dotfiles/blob/383041e06c070d78e4d990b662cfa13d35ce0a64/nvim/after/plugin/nvim-lspconfig.lua#L158
vim.diagnostic.config {
    virtual_text = false, -- Show text after diagnostics
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = {
        border = "rounded",
        header = "",
    },
}

-- Show diagnostics text on cursor hold
local lspGroup = vim.api.nvim_create_augroup("Lsp", { clear = true })

-- https://github.com/naborisk/dotfiles/blob/383041e06c070d78e4d990b662cfa13d35ce0a64/nvim/after/plugin/nvim-lspconfig.lua#L169-L172
vim.api.nvim_create_autocmd("CursorHold", {
    command = "lua vim.diagnostic.open_float()",
    group = lspGroup,
})
-- read :h vim.lsp.config for changing options of lsp servers
