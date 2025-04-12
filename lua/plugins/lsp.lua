return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = require('blink.cmp').get_lsp_capabilities(),
            on_attach = function(_, bufnr)
              local nmap = function(keys, func, desc)
                if desc then desc = "LSP: " .. desc end
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
              end
              nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
              nmap("gi", vim.lsp.buf.implementation, "Goto Implementation")
              nmap("gr", vim.lsp.buf.references, "Goto References")
              nmap("K", vim.lsp.buf.hover, "Hover Documentation")
              nmap("<leader>r", vim.lsp.buf.rename, "Rename")
              nmap("<leader>a", vim.lsp.buf.code_action, "Code Action")
              nmap("<leader>c", vim.lsp.codelens.run, "Run Codelens")
              nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
              nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
              nmap("<leader>k", vim.diagnostic.setloclist, "Quickfix Diagnostics")
            end
          }
        end
      }
    }
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = " ",
          }
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          -- auto format on saves
          if not client:supports_method('textDocument/willSaveWaitUntil')
              and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,
  }
}
