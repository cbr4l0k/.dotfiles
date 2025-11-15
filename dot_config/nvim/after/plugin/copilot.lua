local vim = vim

vim.g.copilot_filetypes = {
  dotenv = false,
}

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set('i', '<C-K>', '<Plug>(copilot-accept-word)')

-- Command for double lider plus C to toggle copilot
vim.api.nvim_create_user_command('CopilotToggle', function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd('Copilot disable')
    print("Copilot OFF")
  else
    vim.cmd('Copilot enable')
    print("Copilot ON")
  end
end, { nargs = 0 })

vim.keymap.set('', '<leader><leader>c', ':CopilotToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'solarized',
  -- group = ...,
  callback = function()
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
      fg = '#555555',
      ctermfg = 8,
      force = true
    })
  end
})
