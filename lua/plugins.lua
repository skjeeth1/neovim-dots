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
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/mfussenegger/nvim-lint' },
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',
    -- { src = 'https://github.com/folke/which-key.nvim' },
})



vim.api.nvim_create_user_command("PackUpdate", function(info)
    vim.pack.update(nil, { force = info.bang })
end, { desc = "Update vim.pack plugins", bang = true })


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("conform").setup({
    formatters_by_ft = {
        systemverilog = { "verible" },
        verilog = { "verible" },
        python = { "ruff" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
    },
    default_format_opts = {
        lsp_format = "fallback",
        timeout_ms = 10000,
    },
    format_on_save = {
        timeout_ms = 10000,
        async = false,
        lsp_format = "fallback",
    },
})


local gs = require('gitsigns')

gs.setup({
    signs                   = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },

    signcolumn              = true,  -- Show signs in the sign column
    numhl                   = false, -- Highlight line numbers for changed lines
    linehl                  = false, -- Highlight the entire changed line
    word_diff               = false, -- Highlight changed words inside a line

    current_line_blame      = true,  -- Toggle inline virtual text commit blame
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 300,
    },

    on_attach               = function(bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']h', function()
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Next Git Hunk' })

        map('n', '[h', function()
            if vim.wo.diff then return '[h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Previous Git Hunk' })

        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
        map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
            { desc = 'Stage Hunk' })
        map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
            { desc = 'Reset Hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, { desc = 'Blame Line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diff This' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Inline Blame' })

        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })
    end,
})
