return {
  'cuducos/yaml.nvim',
  ft = { 'yaml' }, -- optional
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },

  config = function()
    vim.keymap.set('n', '<leader>yv', '<cmd>YAMLView<CR>', { desc = 'View YAML structure' })
    vim.keymap.set('n', '<leader>yt', '<cmd>YAMLTelescope<CR>', { desc = 'Open YAML telescope' })

    vim.keymap.set('n', '<leader>ya', function()
      vim.cmd 'YAMLYank +'
      print 'Yankzzzz ALL'
    end, { desc = 'Yank full path and value' })

    vim.keymap.set('n', '<leader>yl', function()
      vim.cmd 'write' -- Save the file before linting
      local filename = vim.fn.expand '%:p' -- Get full path of the current file
      local output = vim.fn.systemlist('yamllint ' .. filename)

      if #output == 0 then
        print 'YAML Lint: No issues found!'
      else
        vim.cmd 'new' -- Open a new split
        vim.cmd 'setlocal buftype=nofile' -- Make it a scratch buffer
        vim.cmd 'setlocal bufhidden=wipe' -- Auto-close buffer when hidden
        vim.cmd 'setlocal nobuflisted' -- Don't list in buffer list
        vim.api.nvim_buf_set_lines(0, 0, -1, false, output) -- Insert output
        print 'YAML Lint: Issues found (see split)'
      end
    end, { desc = 'Lint YAML file with yamllint' })

    vim.keymap.set('n', '<leader>yk', function()
      vim.cmd 'YAMLYankKey +'
      print 'Yankzzzz KEY'
    end, { desc = 'Yank full path of key for current key/value pair' })
  end,
}
