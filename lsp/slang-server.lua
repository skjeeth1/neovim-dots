--- @type vim.lsp.Config
return {
	cmd = { 'slang-server' },
	filetypes = { 'systemverilog', 'verilog' },
	root_markers = { '.git', '.slang' },
}
