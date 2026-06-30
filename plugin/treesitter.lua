local pre_installed_parsers = {
    "c",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local treesitter = require('nvim-treesitter')
        local lang = vim.treesitter.language.get_lang(args.match)
        pcall(vim.treesitter.start)

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        if vim.list_contains(treesitter.get_available(), lang) then
            if not vim.list_contains(treesitter.get_installed(), lang)
                and not vim.list_contains(pre_installed_parsers, lang) then
                local ch = vim.fn.confirm("Download treesitter for " .. lang, "&Yes\n&No", 2)
                if ch == 1 then
                    treesitter.install(lang):wait()
                    vim.treesitter.start(args.buf)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end
        end
    end,
    desc = "Enable nvim-treesitter and install parser if not installed"
})
