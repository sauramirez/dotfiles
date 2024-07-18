return {
  {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    "github/copilot.vim",
  },
  config = function ()
    --require("copilot").setup({
      --suggestion = { enabled = false },
      --panel = { enabled = false },
    --})
    require("copilot_cmp").setup()
  end
},
}
