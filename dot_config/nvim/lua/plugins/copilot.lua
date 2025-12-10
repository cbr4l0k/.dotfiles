return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Disable Copilot by default
    vim.g.copilot_enabled = false
    vim.cmd('Copilot disable')

    -- Disable Copilot for sensitive files
    vim.g.copilot_filetypes = {
      dotenv = false,
    }

    -- Disable default tab mapping
    vim.g.copilot_no_tab_map = true

    -- Keybindings
    -- Accept full suggestion: <C-l> (consistent with "complete/forward" pattern)
    vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion"
    })

    -- Accept word: <M-l> (Alt+l - partial accept forward)
    vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-word)', {
      desc = "Accept Copilot word"
    })

    -- Accept line: <M-L> (Alt+Shift+l)
    vim.keymap.set('i', '<M-L>', '<Plug>(copilot-accept-line)', {
      desc = "Accept Copilot line"
    })

    -- Next suggestion: <M-]>
    vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', {
      desc = "Next Copilot suggestion"
    })

    -- Previous suggestion: <M-[>
    vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', {
      desc = "Previous Copilot suggestion"
    })

    -- Dismiss suggestion: <C-e> is already used by cmp for abort, which also dismisses copilot

    -- Toggle Copilot: <leader><leader>c (consistent with your toggle pattern)
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

    vim.keymap.set('n', '<leader><leader>c', ':CopilotToggle<CR>', {
      noremap = true,
      silent = true,
      desc = "Toggle Copilot"
    })

    -- Customize highlight for solarized colorscheme
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'solarized',
      callback = function()
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
          fg = '#555555',
          ctermfg = 8,
          force = true
        })
      end
    })
  end
}
