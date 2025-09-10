-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { noremap = true, silent = true })
-- Set tabspace to 2
-- set comma as mapleader
vim.g.mapleader = ","
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = ""

-- set number                " show line numbers
-- set cul                   " highlight current line
-- set laststatus=2          " last window always has a statusline
-- set nohlsearch            " Don't continue to highlight searched phrases.
-- set incsearch             " But do highlight as you type your search.
-- set ignorecase            " Make searches case-insensitive.
-- set ruler                 " Always show info along bottom.
-- set showmatch
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.ruler = true
vim.opt.showmatch = true

--vim.g.copilot_proxy = "http://localhost:11435"
--vim.g.copilot_proxy_strict_ssl = false
