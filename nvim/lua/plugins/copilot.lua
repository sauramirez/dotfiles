return {
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "github/copilot.vim",
    },
    opts = {
      --copilot_proxy = "http://localhost:11435",
      --copilot_proxy_strict_ssl = false,
    },
    config = function()
      --require("copilot").setup({
      --suggestion = { enabled = false },
      --panel = { enabled = false },
      --})
      require("copilot_cmp").setup()
    end,
  },
}
