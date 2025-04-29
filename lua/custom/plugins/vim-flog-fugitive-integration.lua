return {
  'rbong/vim-flog',
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  dependencies = { 'tpope/vim-fugitive' },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>gtl', ':Flog<CR>', { noremap = true, silent = true, desc = 'Git log (Flog)' })
    vim.api.nvim_set_keymap('n', '<leader>gtL', ':Flogsplit<CR>', { noremap = true, silent = true, desc = 'Git log split (Flog)' })
  end,
}
