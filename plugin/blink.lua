require('blink.cmp').setup({
    completion = {
        menu = {
            auto_show = false,
        },

        documentation = {
            auto_show = true,
        },
    },

    signature = {
        enabled = true,
        window = {
            show_documentation = false,
        },
    },

    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Return>'] = { 'select_and_accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-U>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-D>'] = { 'scroll_documentation_down', 'fallback' },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
