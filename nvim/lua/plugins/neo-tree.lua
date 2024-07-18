return {
  { "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { '<C-e>', ':Neotree toggle<cr>' },
    },
    config = function ()
      require("neo-tree").setup({
          default_component_configs = {
            icon = {
              folder_closed = "-",
              folder_open = "v",
              folder_empty = "x",
              -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
              -- then these will never be used.
              default = "*",
              highlight = "NeoTreeFileIcon"
            },
            git_status = {
              symbols = {
                -- Change type
                added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "·", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖",-- this can only be used in the git_status source
                renamed   = "~",-- this can only be used in the git_status source
                -- Status type
                untracked = "?",
                ignored   = "*",
                unstaged  = "M",
                staged    = "S",
                conflict  = "C",
              }
            },
          }
        })
    end
  }
}
