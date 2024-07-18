require("conform.formatters.eslint_d").cwd = require("conform.util").root_file({
  ".eslint.js",
  ".eslintrc.js",
  ".eslint.cjs",
  ".eslint.yaml",
  ".eslint.yml",
  ".eslint.json",
})
require("conform.formatters.eslint_d").require_cwd = true
