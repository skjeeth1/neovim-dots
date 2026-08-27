vim.lsp.enable({
    'lua_ls',
    'clangd',
    'slang-server',
    'zuban',
    'taplo',
    'svelte',
})

vim.diagnostic.config({
    underline = true,
    update_in_insert = true,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
    severity_sort = true,
})
