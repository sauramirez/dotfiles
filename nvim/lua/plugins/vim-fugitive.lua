return {
  {
    'tpope/vim-fugitive',
    loaded = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
    keys = {
      -- leader gs for git status
      {'<leader>gs', '<cmd>Git<cr>'},
      -- gb for git blame
      {'<leader>gb', '<cmd>GBrowse<cr>'},
      -- gc for git commit
      {'<leader>gc', '<cmd>Git commit<cr>'},
      -- gd for git diff
      {'<leader>gd', '<cmd>Gvdiffsplit<cr>'},

      {'<leader>ga', '<cmd>Gwrite<cr>'},
      {'<leader>gp', '<cmd>Git push<cr>'},
    }
  },
  {'tpope/vim-rhubarb'},
}
