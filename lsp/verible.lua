return {
    cmd = { "verible-verilog-ls" },
    filetypes = { "v", "systemverilog" },
    root_markers = { ".git", },
    settings = {},
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
    }
}
