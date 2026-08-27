-- ~/.config/nvim-new/lua/keymaps.lua
local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- ==========================================
-- 1. General Keymaps
-- ==========================================
keymap("n", "<space>", "<Nop>")
keymap('n', ';', ':')
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)
keymap("n", "<Leader>q", "<cmd>q<CR>", s)
keymap("t", "<Esc>", "<C-\\><C-N>")
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

-- ==========================================
-- 2. Movement & Navigation
-- ==========================================
keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- ==========================================
-- 3. Window & Tab Management
-- ==========================================
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)
keymap("n", "<Leader>-", "<cmd>split<CR>", s)

-- ==========================================
-- 4. Clipboard & Registers
-- ==========================================
keymap("x", "y", [["+y]], s)
keymap({ 'n', 'v', 'x' }, '<leader>y', '"+y', { desc = "Copy to clipboard" })
keymap({ 'n', 'v', 'x' }, '<leader>p', '"+p', { desc = "Paste from clipboard" })

-- Paste without overwriting the default register.
keymap("x", "<leader>P", '"_dP', { desc = "Paste without overwriting register" })

-- ==========================================
-- 5. Treesitter / LSP Node Selection
-- ==========================================
keymap("n", "<leader>tm", "<cmd>TreesitterManage<CR>", { desc = "Treesitter: Manage Installed Parsers" })

-- Expand / Shrink (Vertical Tree Movement)
keymap({ 'x', 'o' }, '<CR>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = 'Select parent (outer) node' })

keymap({ 'x', 'o' }, '<BS>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = 'Select child (inner) node' })

-- Jump Siblings (Lateral Tree Movement)
keymap({ 'x', 'o' }, '<S-Tab>', function()
    require('vim.treesitter._select').select_prev(vim.v.count1)
end, { desc = 'Select previous node' })

keymap({ 'x', 'o' }, '<Tab>', function()
    require('vim.treesitter._select').select_next(vim.v.count1)
end, { desc = 'Select next node' })

-- Grow Siblings (Expanding Laterally)
keymap({ 'x', 'o' }, '-', function()
    require('vim.treesitter._select').select_grow_prev(vim.v.count1)
end, { desc = 'Select previous sibling node (Grow)' })

keymap({ 'x', 'o' }, '=', function()
    require('vim.treesitter._select').select_grow_next(vim.v.count1)
end, { desc = 'Select next sibling node (Grow)' })

-- ==========================================
-- 6. FZF & LSP Mappings
-- ==========================================
local fzf = require("fzf-lua")
local function nmap(kmap, cmd, desc)
    vim.keymap.set("n", kmap, cmd, { noremap = true, silent = true, desc = desc })
end

-- FZF Files & Buffers
nmap("<leader>ff", fzf.files, "Find files")
nmap("<leader>fr", fzf.oldfiles, "Recent files")
nmap("<leader>fc", function() fzf.files({ cwd = vim.fn.stdpath("config") }) end, "Find config files")
nmap("<leader>bb", fzf.buffers, "List buffers")

-- FZF Search
nmap("<leader>sg", fzf.live_grep, "Live grep (project)")
nmap("<leader>sw", fzf.grep_cword, "Search word under cursor")
nmap("<leader>sb", fzf.lines, "Search in buffer")

-- FZF Diagnostics
nmap("<leader>fd", fzf.diagnostics_document, "Document diagnostics")
nmap("<leader>fD", fzf.diagnostics_workspace, "Workspace diagnostics")

-- Git
nmap("<leader>fg", fzf.git_files, "Git files")
nmap("<leader>gc", fzf.git_commits, "Git commits")
nmap("<leader>gs", fzf.git_status, "Git status")

-- LSP & Formatting
keymap("n", "<Leader>fo", ":lua require('conform').format()<CR>", s)
keymap("n", "grd", vim.lsp.buf.definition, opts)
nmap("gd", fzf.lsp_definitions, "Goto definition (FZF)")
nmap("gr", fzf.lsp_references, "Goto references")
nmap("gi", fzf.lsp_implementations, "Goto implementations")
nmap("<leader>ds", fzf.lsp_document_symbols, "Document symbols")
