require('blink.cmp').setup({
    completion = {
        menu = {
            auto_show = false,
        },
    },
    keymap = {
        preset = 'default',
        ['<Return>'] = { 'select_and_accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
