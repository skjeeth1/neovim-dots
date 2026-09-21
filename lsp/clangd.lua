---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--query-driver=**/*gcc,**/*g++",
		"--header-insertion=never",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { ".clangd", ".git", "MakeFile" }
}
