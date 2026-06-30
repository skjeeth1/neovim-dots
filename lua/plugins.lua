vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/folke/tokyonight.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    {
        src = 'https://github.com/Saghen/blink.cmp',
        version = vim.version.range("v1.*")
    },
    -- { src = 'https://github.com/folke/which-key.nvim' },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('blink.cmp').setup({
    completion = {
        menu = {
            auto_show = false,
        },
    },
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})

local fzf = require('fzf-lua')
fzf.setup({
    actions = {
        files = {
            ["default"] = fzf.actions.file_edit_or_qf,

            ["ctrl-n"] = function(selected, opts)
                local query = opts.last_query
                if not query or query == "" then
                    return
                end

                -- Create absolute path
                local filepath = query
                if opts.cwd and opts.cwd ~= "" then
                    filepath = opts.cwd .. "/" .. query
                end

                -- Make directory
                local dir = vim.fn.fnamemodify(filepath, ":h")
                if vim.fn.isdirectory(dir) == 0 then
                    vim.fn.mkdir(dir, "p")
                end

                -- Open the new file
                vim.cmd("edit " .. vim.fn.fnameescape(filepath))
            end,
        }
    }



})
