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

                local filepath = query
                if opts.cwd and opts.cwd ~= "" then
                    filepath = opts.cwd .. "/" .. query
                end

                local dir = vim.fn.fnamemodify(filepath, ":h")
                if vim.fn.isdirectory(dir) == 0 then
                    vim.fn.mkdir(dir, "p")
                end

                vim.cmd("edit " .. vim.fn.fnameescape(filepath))
            end,
        }
    }
})
