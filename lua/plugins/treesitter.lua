return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "VeryLazy",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "lua",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<bs>",
        }
      },
      refactor = {
        highlight_definitions = {
          enable = false,
          clear_on_cursor_move = false,
        },
        highlight_current_scope = { enable = false },
        smart_rename = {
          enable = true,
          -- keymaps = { smart_rename = "<leader>r" }
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gd",
            list_definitions = "gl",
            --   list_definitions_toc = "gO",
            goto_next_usage = "]]",
            goto_previous_usage = "[[",
          }
        }
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ab"] = "@block.outer",
            ["ic"] = "@call.inner",
            ["ac"] = "@call.outer",
            ["is"] = "@class.inner",
            ["as"] = "@class.outer",
            ["im"] = "@comment.inner",
            ["am"] = "@comment.outer",
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["if"] = "@function.inner",
            ["af"] = "@function.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["ip"] = "@parameter.inner",
            ["ap"] = "@parameter.outer",
            ["ir"] = "@return.inner",
            ["ar"] = "@return.outer"
          }
        },
        swap = {
          -- enable = true,
          -- swap_next = { ["<leader>w"] = "@parameter.inner" },
          -- swap_previous = { ["<leader>W"] = "@parameter.inner" }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]c"] = "@call.outer",
            ["]s"] = "@class.outer",
            ["]m"] = "@comment.outer",
            ["]i"] = "@conditional.outer",
            ["]f"] = "@function.outer",
            ["]l"] = "@loop.outer",
            ["]p"] = "@parameter.outer",
            ["]r"] = "@return.outer"
          },
          goto_previous_start = {
            ["[c"] = "@call.outer",
            ["[s"] = "@class.outer",
            ["[m"] = "@comment.outer",
            ["[i"] = "@conditional.outer",
            ["[f"] = "@function.outer",
            ["[l"] = "@loop.outer",
            ["[p"] = "@parameter.outer",
            ["[r"] = "@return.outer"
          }
        },
        -- lsp_interop = {
        --   enable = true,
        --   border = "rounded",
        --   floating_preview_opts = {},
        --   peek_definition_code = {
        --     ["<leader>df"] = "@function.outer",
        --     ["<leader>ds"] = "@class.outer",
        --   }
        -- }
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}
