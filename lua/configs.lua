local opt = vim.opt

-- opt.colorcolumn = "80" -- Highlight column 80
opt.signcolumn = "yes"   -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true    -- Ignore case in search
opt.smartcase = true
opt.swapfile = false     -- Disable swap files
opt.autoindent = true    -- Enable auto indentation

opt.expandtab = true     -- Use spaces instead of tabs
opt.tabstop = 4          -- Number of spaces for a tab
opt.softtabstop = 4      -- Number of spaces for a tab when editing
opt.shiftwidth = 4       -- Number of spaces for autoindent
opt.shiftround = true    -- Round indent to multiple of shiftwidth
opt.smartindent = true
opt.smarttab = true

opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.list = true            -- Show whitespace characters

opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers

opt.wrap = true            -- Disable line wrapping
opt.cursorline = true      -- Highlight the current line
opt.scrolloff = 5          -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer

opt.splitright = true
opt.splitbelow = true

opt.undodir = vim.fn.stdpath('data') .. '/undodir' -- Directory for undo files
opt.undofile = true                                -- Enable persistent undo
opt.confirm = true

opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.winborder = "rounded"                            -- Use rounded borders for windows

opt.updatetime = 250
opt.timeoutlen = 1000

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

vim.cmd.colorscheme "tokyonight-night"
require('vim._core.ui2').enable({})
