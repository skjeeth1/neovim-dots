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

        local has_tree_sitter_cli = vim.fn.executable('tree-sitter') == 1

        local has_compiler = vim.fn.executable('gcc') == 1
            or vim.fn.executable('clang') == 1
            or vim.fn.executable('cl') == 1
            or vim.fn.executable('zig') == 1
            or vim.fn.executable('cc') == 1

        if lang and vim.list_contains(treesitter.get_available(), lang) then
            if not vim.list_contains(treesitter.get_installed(), lang)
                and not vim.list_contains(pre_installed_parsers, lang)
                and has_tree_sitter_cli
                and has_compiler then
                local ch = vim.fn.confirm("Download treesitter for " .. lang, "&Yes\n&No", 2)
                if ch == 1 then
                    treesitter.install(lang):wait()
                    vim.treesitter.start(args.buf)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end
        end
    end,
    desc = "Enable nvim-treesitter and install parser if CLI and compiler are available"
})
