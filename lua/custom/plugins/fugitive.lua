-- File: lua/custom/plugins/fugitive.lua

return {
  'tpope/vim-fugitive',
  config = function()
    -- Here you can place any configuration commands specific to vim-fugitive,
    -- though by default it doesn't require any setup to use its basic features.
    -- For example, setting key bindings:
    vim.api.nvim_set_keymap('n', '<leader>gts', ':Git<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>gta', ':Git add .<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>gtc', ':Git commit<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>gtp', ':Git push<CR>', { noremap = true, silent = true })
    -- Add more key bindings as needed
  end,
}
