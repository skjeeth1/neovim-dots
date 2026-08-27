local lint = require('lint')

local xvlog_parser = require('lint.parser').from_errorformat(
    "%tRROR: %m [%f:%l]",
    { source = "xvlog" }
)

lint.linters.xvlog_sv = {
    cmd = 'xvlog',
    stdin = false,
    append_fname = true,
    args = { '--sv' },
    stream = 'stdout',
    ignore_exitcode = true,
    parser = xvlog_parser
}

lint.linters.xvlog_v = {
    cmd = 'xvlog',
    stdin = false,
    append_fname = true,
    args = {},
    stream = 'stdout',
    ignore_exitcode = true,
    parser = xvlog_parser
}

lint.linters_by_ft = {
    systemverilog = { "xvlog_sv" },
    verilog = { "xvlog_v" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("nvim-lint-autocmds", { clear = true }),
    callback = function()
        require("lint").try_lint()
    end,
})
