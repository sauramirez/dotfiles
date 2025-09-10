

--local lsp_zero = require("lsp-zero")
--lsp_zero.setup({
--tsserver = {
--enable = true,
--filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--},
--})
--require("modules.lsp")
--require("mason").setup()
--require("mason-lspconfig").setup {
--ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "gopls" },
--}

--require("mason-lspconfig").tsserver.setup {}

-- add any tools you want to have installed below
--{
--"williamboman/mason.nvim",
--"williamboman/mason-lspconfig.nvim",
--"stylua",
--"shellcheck",
--"shfmt",
--"flake8",
--"prettier",
--"tsserver",
--"gopls",
--"rust-analyzer",
--},

--lsp_zero.on_attach(function(client, bufnr)
  --lsp_zero.default_keymaps({ buffer = bufnr })
--end)

require('flutter-tools').setup({
  })
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'rust_analyzer'},
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = lsp_capabilities,
          })
      end,
      lua_ls = function()
        require('lspconfig').lua_ls.setup({
            capabilities = lsp_capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = {'vim'},
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
      end,
    }
  })

---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- Tab for navigating the completion menu
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- show completion menu
        ['<C-n>'] = cmp.mapping.complete({}),
    -- show virtual text for completion
        ['<C-h>'] = cmp.mapping.complete({}),
      }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })
