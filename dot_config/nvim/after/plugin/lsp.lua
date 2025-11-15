local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
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
  },
  handlers = {
    lsp_zero.default_setup,
  },
})


---- Setup tsserver with specific settings
--lsp_zero.nvim_lsp.tsserver.setup({
--  on_attach = lsp_zero.on_attach,
--  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
--  cmd = { 'typescript-language-server', '--stdio' }
--})
