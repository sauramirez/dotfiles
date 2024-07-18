return {

  { "junegunn/fzf" },
  { "junegunn/fzf.vim",
    opts = function ()
      vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git/*'"
    end,
    keys = {
      -- ctrl-p for fzf
      {'<c-p>', '<cmd>Files<cr>'},
    }
  },
}
