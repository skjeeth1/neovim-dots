vim.lsp.enable({
    'lua_ls',
    'clangd',
    'slang-server',
    'zuban',
    'taplo',
    'svelte',
    'vtsls',
})

vim.diagnostic.config({
    signs = {
        linehl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
            [vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
        },
    },
    float = {
        border = "rounded",
        source = true,
    },
    severity_sort = true,
    underline = true,
    update_in_insert = true,
    virtual_lines = {
        current_line = true,
    },
    virtual_text = false,
})
