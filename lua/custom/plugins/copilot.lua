return {
  'github/copilot.vim',
  lazy = false, -- Load immediately
  config = function()
    -- Use vim.cmd to define insert mode mapping because copilot#Accept() is a Vimscript <expr> function.
    -- Lua's vim.keymap.set doesn't handle it correctly in insert mode and causes weird characters like <80>@7.
    vim.cmd [[
      imap <silent><script><expr> <C-w> copilot#Accept("")
      let g:copilot_no_tab_map = v:true
    ]]

    vim.keymap.set('n', '<leader>ad', '<cmd>Copilot disable<CR>', { desc = 'Disable Copilot' })
    vim.keymap.set('n', '<leader>ae', '<cmd>Copilot enable<CR>', { desc = 'Enable Copilot' })
    vim.keymap.set('n', '<leader>as', '<cmd>Copilot status<CR>', { desc = 'Copilot Status' })
  end,
}
