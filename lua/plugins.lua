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

