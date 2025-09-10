local js_inlay_hints_opts = {
  parameterNames = { enabled = "all" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
}

return {
  -- lualine
  { "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        sections = {
          lualine_c = {
            { "filename", path = 1 },
            { "require('flutter-tools').statusline()" },
          },
        },
      }
    end,
  },
  --- Uncomment the two plugins below if you want to manage the language servers from neovim
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      -- enabble vim diagnostic
      vim.diagnostic.enable()
      vim.diagnostic.config({
        virtual_text = true,
      })
      return {
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = {
          { name = "nvim_lsp", group_index = 2 },
          { name = "path", group_index = 2 },
          { name = "buffer", group_index = 2 },
        },
      }
    end
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
  },
  { "dart-lang/dart-vim-plugin" }, -- specific for dart

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").ts_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      -- rust
      require("lspconfig").rust_analyzer.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      -- python
      require("lspconfig").pyright.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      -- go
      require("lspconfig").gopls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      require("flutter-tools").setup({
        fvm = true,
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        lsp = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
        settings = {
          completeFunctionCalls = true,
        },
        on_init = function(client)
          -- disable formatting capabilities
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
      })
      local cmp = require("cmp")

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
          --["<C-f>"] = cmp_action.luasnip_jump_forward(),
          --["<C-b>"] = cmp_action.luasnip_jump_backward(),

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
}
