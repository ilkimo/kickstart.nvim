return {
  'ilkimo/harpoon',
  branch = 'hotfix/kimo_remove',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('harpoon').setup {}

    -- Telescope configuration begin
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-l>', function()
      toggle_telescope(require('harpoon'):list())
    end, { desc = 'Harpoon quick menu' })
    -- Telescope configuration end

    vim.keymap.set('n', '<leader>ht', function()
      require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
    end, { noremap = true, silent = true, desc = 'Harpoon quick menu' })

    vim.keymap.set('n', '<leader>ha', function()
      require('harpoon'):list():add()
    end, { noremap = true, silent = true, desc = 'Harpoon add buffer to list' })

    vim.keymap.set('n', '<leader>hr', function()
      require('harpoon'):list():remove()
    end, { noremap = true, silent = true, desc = 'Harpoon remove buffer from list' })

    vim.keymap.set('n', '<leader>hc', function()
      require('harpoon'):list():clear()
    end, { noremap = true, silent = true, desc = 'Harpoon clear buffer list' })

    vim.keymap.set('n', '<leader>hh', function()
      require('harpoon'):list():select(1)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 1' })

    vim.keymap.set('n', '<leader>h,', function()
      require('harpoon'):list():select(2)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 2' })

    vim.keymap.set('n', '<leader>h.', function()
      require('harpoon'):list():select(3)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 3' })

    vim.keymap.set('n', '<leader>hn', function()
      require('harpoon'):list():select(4)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 4' })

    vim.keymap.set('n', '<leader>he', function()
      require('harpoon'):list():select(5)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 5' })

    vim.keymap.set('n', '<leader>hi', function()
      require('harpoon'):list():select(6)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 6' })

    vim.keymap.set('n', '<leader>hl', function()
      require('harpoon'):list():select(7)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 7' })

    vim.keymap.set('n', '<leader>hu', function()
      require('harpoon'):list():select(8)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 8' })

    vim.keymap.set('n', '<leader>hy', function()
      require('harpoon'):list():select(9)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 9' })

    vim.keymap.set('n', '<C-n>', function()
      require('harpoon'):list():next()
    end, { noremap = true, silent = true, desc = 'Harpoon go to next buffer' })

    vim.keymap.set('n', '<C-e>', function()
      require('harpoon'):list():prev()
    end, { noremap = true, silent = true, desc = 'Harpoon go to previous buffer' })
  end,
}
