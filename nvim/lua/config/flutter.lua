-- keymaps for flutter tools
vim.keymap.set("n", "<space>fr", ":FlutterRun<CR>")
vim.keymap.set("n", "<space>fd", ":FlutterDevices<CR>")
vim.keymap.set("n", "<space>fR", ":FlutterRestart<CR>")
vim.keymap.set("n", "<space>fq", ":FlutterQuit<CR>")
vim.keymap.set("n", "<space>fi", ":FlutterPubGet<CR>")
--nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
--xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
