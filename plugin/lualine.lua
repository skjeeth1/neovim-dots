require('lualine').setup({
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
        always_show_tabline = true,
    },
    sections = {
        lualine_a = { {
            'mode',
            padding = { left = 1, right = 0 },
            icons_enabled = true,
        } },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { { 'filename' } },
        lualine_x = { 'filetype', 'diff' },
        lualine_y = {
            { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
            function()
                local root = nil
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if clients and #clients > 0 then
                    local candidate = clients[1].root_dir
                    if type(candidate) == "string" and candidate ~= "" then
                        root = candidate
                    end
                end
                if not root then
                    root = vim.fn.getcwd()
                end
                if not root or root == "" then
                    return ""
                end
                -- root = root:gsub(vim.env.HOME, "~")
                local top = root:match("([^/]+)$") or root

                return "  " .. top
            end,
        }
    },
})
