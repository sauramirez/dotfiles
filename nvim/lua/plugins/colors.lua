return {
  { "folke/tokyonight.nvim",
    opts = function ()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
