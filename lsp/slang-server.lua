--- @type vim.lsp.Config
return {
    cmd = { 'slang-server', "--ignore-unknown-modules" },
    filetypes = { 'systemverilog', 'verilog' },
    root_markers = { '.git', '.slang' },
}
