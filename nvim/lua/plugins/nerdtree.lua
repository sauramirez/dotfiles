return {
  { "preservim/nerdtree",
    keys = {
      { '<C-e>', ':NERDTreeToggle<cr>:NERDTreeMirror<cr>' },
      { '<leader>e', ':NERDTreeFind<cr>' },
      { '<leader>nt', ':NERDTreeFind<cr>' },
    },
    dependencies = {
      "Xuyuanp/nerdtree-git-plugin",
      "PhilRunninger/nerdtree-buffer-ops",
    },
    opts = {
      NERDTreeShowBookmarks = 1,
      NERDTreeIgnore = { '\\.pyc', '\\~$', '\\.swo$', '\\.swp$', '\\.git', '\\.hg', '\\.svn', '\\.bzr' },
      NERDTreeChDirMode = 0,
      NERDTreeQuitOnOpen = 1,
      NERDTreeShowHidden = 1,
      NERDTreeKeepTreeInNewTab = 1,
      g = {
        nerdtree_tabs_open_on_gui_startup = 0,
      },
    },
    enabled = false,
    --opts = function ()
        --map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        --map <leader>e :NERDTreeFind<CR>
        --nmap <leader>nt :NERDTreeFind<CR>

        --let NERDTreeShowBookmarks=1
        --let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        --let NERDTreeChDirMode=0
        --let NERDTreeQuitOnOpen=1
        ---- let NERDTreeMouseMode=2
        --let NERDTreeShowHidden=1
        --let NERDTreeKeepTreeInNewTab=1
        --let g:nerdtree_tabs_open_on_gui_startup=0
    --end,
  },
}
