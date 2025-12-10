local vim = vim
return {
  {
    'neovim/nvim-lspconfig',
    lazy=false,
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      -- Format Rust files on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
          vim.lsp.buf.format({ timeout_ms = 2000 })
        end,
      })

      -- Capabilities (so LSP knows about cmp completion capabilities)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- on_attach: similar idea to lsp-zero default keymaps
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set

      -- LSP navigation
      keymap('n', 'Gd', vim.lsp.buf.definition, opts)
      keymap('n', 'GD', vim.lsp.buf.declaration, opts)
      keymap('n', 'Gr', vim.lsp.buf.references, opts)
      keymap('n', 'Gi', vim.lsp.buf.implementation, opts)

      -- Info / actions
      keymap('n', 'K', vim.lsp.buf.hover, opts)
      keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
      keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)

      -- Diagnostics
      keymap('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap('n', ']d', vim.diagnostic.goto_next, opts)
      keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
      keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

      mason_lspconfig.setup({
        ensure_installed = {
          'bashls',
          'clangd',
          'jsonls',
          'julials',
          'marksman',
          'intelephense',
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'texlab',
          'dockerls',
          -- 'tsserver', -- add if you want TS again via mason
        },
        handlers = {
          -- default handler for every server
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Example of custom per-server config: Lua
          lua_ls = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    checkThirdParty = false,
                  },
                },
              },
            })
          end,


          -- Example for tsserver, equivalent to your commented block
          tsserver = function()
            lspconfig.tsserver.setup({
              capabilities = capabilities,
              filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
              cmd = { 'typescript-language-server', '--stdio' },
            })
          end,

          -- LTeX configuration for grammar/spell checking
          ltex = function()
            lspconfig.ltex.setup({
              capabilities = capabilities,
              settings = {
                ltex = {
                  enabled = { "latex", "tex", "bib", "markdown" },
                  language = "auto",  -- Auto-detect language
                  -- Or specify both: language = "en-US,es",
                  additionalRules = {
                    enablePickyRules = false,
                  },
                  checkFrequency = "save",  -- Only check on save, not as you type
                },
              },
            })
          end,

          -- Rust Analyzer configuration
          rust_analyzer = function()
            lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    features = "all",
                  },
                  checkOnSave = {
                    enable = true,
                  },
                  check = {
                    command = "clippy",
                  },
                  imports = {
                    group = {
                      enable = false,
                    },
                  },
                  completion = {
                    postfix = {
                      enable = false,
                    },
                  },
                  inlayHints = {
                    enable = true,
                    typeHints = {
                      enable = true,
                    },
                    parameterHints = {
                      enable = true,
                    },
                    chainingHints = {
                      enable = true,
                    },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
