vim.lsp.enable({
    'lua_ls',
    'clangd',
    'verible',
    'zuban',
    'taplo'
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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if client:supports_method('textDocument/formatting', args.buf) then
            vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end
            })
        end
    end
})
