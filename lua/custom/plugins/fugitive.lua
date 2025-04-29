-- File: lua/custom/plugins/fugitive.lua

return {
  'tpope/vim-fugitive',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>gts', ':Git status<CR>', { noremap = true, silent = true, desc = 'Git status' })
    vim.api.nvim_set_keymap('n', '<leader>gta', ':Gwrite<CR>', { noremap = true, silent = true, desc = 'Git add current file' })
    vim.api.nvim_set_keymap('n', '<leader>gtc', ':Git commit<CR>', { noremap = true, silent = true, desc = 'Git commit' })
    vim.api.nvim_set_keymap('n', '<leader>gtp', ':Git push<CR>', { noremap = true, silent = true, desc = 'Git push' })
    vim.api.nvim_set_keymap('n', '<leader>gtd', ':Gdiffsplit<CR>', { noremap = true, silent = true, desc = 'Git diff split' })
  end,
}
