---@type vim.lsp.Config
return {
	cmd = { "clangd",
		-- "--query-driver=**/*gcc,**/*g++",
		-- "--background-index",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { ".clangd", ".git", "MakeFile" }
}
