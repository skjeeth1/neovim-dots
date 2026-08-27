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
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        timeout_ms = 10000,
        async = false,
        lsp_format = "fallback",
    },
})
