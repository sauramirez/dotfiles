return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
              return { "ruff_format" }
            else
              return { "isort", "black" }
            end
          end,

          dart = { "dart_format" },

          go = { "gofmt", "goimports" },

          rust = { "rustfmt" },

          swift = { "swiftformat" },
          -- Use a sub-list to run only the first available formatter
          --javascript = { { "prettierd", "eslint_d", "prettier",
          --timeout_ms = 2000;
          --stop_after_first = true } },
          javascript = {
            "prettierd",
            "eslint_d",
            "prettier",
            timeout_ms = 2000,
            stop_after_first = true,
          },

          svelte = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 800,
          lsp_format = "fallback",
        },
        formatters = {
          dart_format = {
            inherit = true,
            append_args = { "-l", "120" },
          },
        },
      }
    end,
  },
}
