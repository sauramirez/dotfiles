local js_inlay_hints_opts = {
  parameterNames = { enabled = "all" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
}

return {
  --- Uncomment the two plugins below if you want to manage the language servers from neovim
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  {
    "marilari88/twoslash-queries.nvim", -- https://github.com/marilari88/twoslash-queries.nvim
    config = true,
    lazy = true,
    cmd = "TwoslashQueriesInspect",
    keys = {
      {
        "<leader>it",
        "<CMD>TwoslashQueriesInspect<CR>",
        desc = "[I]nspect [T]ype",
      },
    },
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "marilari88/twoslash-queries.nvim", -- https://github.com/marilari88/twoslash-queries.nvim
    },
    branch = "v3.x",

    opts = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("flutter-tools").setup({})
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver", "html", "cssls", "svelte", "rust_analyzer" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = lsp_capabilities,
            })
          end,
          tsserver = function()
            -- use prettier for formatting
            require("lspconfig").tsserver.setup({
              capabilities = lsp_capabilities,
              settings = {
                format = {
                  enable = false,
                },
              },
            })
          end,
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              capabilities = lsp_capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = "LuaJIT",
                  },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = {
                      vim.env.VIMRUNTIME,
                    },
                  },
                },
              },
            })
          end,
          svelte = function()
            require("lspconfig").svelte.setup({
              on_attach = function(client, bufnr)
                require("twoslash-queries").attach(client, bufnr)
              end,
              settings = {
                javascript = {
                  inlayHints = js_inlay_hints_opts,
                },
                typescript = {
                  inlayHints = js_inlay_hints_opts,
                },
              },
            })
          end,
        },
      })

      ---
      -- Autocompletion config
      ---
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        -- Copilot Source
        sources = {
          -- Copilot Source
          { name = "copilot", group_index = 2 },
          -- Other Sources
          { name = "nvim_lsp", group_index = 2 },
          { name = "path", group_index = 2 },
          { name = "luasnip", group_index = 2 },
        },
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          -- Tab for navigating the completion menu
          --['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          --['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
  },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
}
