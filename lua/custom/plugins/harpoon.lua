return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('harpoon').setup {}

    -- Telescope configuration begin
    local conf = require('telescope.config').values

    local function remove_prefix(entry)
      return entry:match '%[%d+%]%s*(.*)' or entry
    end

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for i, item in ipairs(harpoon_files.items) do
        local value = item and item.value or ''
        table.insert(file_paths, string.format('[%d] %s', i, value))
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
            entry_maker = function(line)
              return {
                value = line,
                display = line, -- Show the indexed version
                ordinal = line, -- Used for sorting/filtering
                path = remove_prefix(line), -- Extract the actual file path
              }
            end,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry()
              if selection and selection.path then
                require('telescope.actions').close(prompt_bufnr)
                vim.cmd('edit ' .. vim.fn.fnameescape(selection.path))
              end
            end)
            return true
          end,
        })
        :find()
    end

    local harpoon_get_paths = function(files)
      local paths = {}
      local items = files.items
      local len = files._length

      for i = 1, len do
        paths[i] = ''
        local item = items[i]
        if item ~= nil then
          paths[i] = item.value
        end
      end

      return paths
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

    vim.keymap.set('n', '<leader>hsh', function()
      require('harpoon'):list():replace_at(1)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 1' })

    vim.keymap.set('n', '<leader>h,', function()
      require('harpoon'):list():select(2)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 2' })

    vim.keymap.set('n', '<leader>hs,', function()
      require('harpoon'):list():replace_at(2)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 2' })

    vim.keymap.set('n', '<leader>h.', function()
      require('harpoon'):list():select(3)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 3' })

    vim.keymap.set('n', '<leader>hs.', function()
      require('harpoon'):list():replace_at(3)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 3' })

    vim.keymap.set('n', '<leader>hn', function()
      require('harpoon'):list():select(4)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 4' })

    vim.keymap.set('n', '<leader>hsn', function()
      require('harpoon'):list():replace_at(4)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 4' })

    vim.keymap.set('n', '<leader>he', function()
      require('harpoon'):list():select(5)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 5' })

    vim.keymap.set('n', '<leader>hse', function()
      require('harpoon'):list():replace_at(5)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 5' })

    vim.keymap.set('n', '<leader>hi', function()
      require('harpoon'):list():select(6)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 6' })

    vim.keymap.set('n', '<leader>hsi', function()
      require('harpoon'):list():replace_at(6)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 6' })

    vim.keymap.set('n', '<leader>hl', function()
      require('harpoon'):list():select(7)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 7' })

    vim.keymap.set('n', '<leader>hsl', function()
      require('harpoon'):list():replace_at(7)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 7' })

    vim.keymap.set('n', '<leader>hu', function()
      require('harpoon'):list():select(8)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 8' })

    vim.keymap.set('n', '<leader>hsu', function()
      require('harpoon'):list():replace_at(8)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 8' })

    vim.keymap.set('n', '<leader>hy', function()
      require('harpoon'):list():select(9)
    end, { noremap = true, silent = true, desc = 'Harpoon go to 9' })

    vim.keymap.set('n', '<leader>hsy', function()
      require('harpoon'):list():replace_at(9)
    end, { noremap = true, silent = true, desc = 'Harpoon swap current buffer with index 9' })

    vim.keymap.set('n', '<C-n>', function()
      require('harpoon'):list():next()
    end, { noremap = true, silent = true, desc = 'Harpoon go to next buffer' })

    vim.keymap.set('n', '<C-e>', function()
      require('harpoon'):list():prev()
    end, { noremap = true, silent = true, desc = 'Harpoon go to previous buffer' })

    vim.keymap.set('n', '<leader>hgl', function()
      require('harpoon.logger'):show()
    end, { noremap = true, silent = true, desc = 'Harpoon go to previous buffer' })
  end,
}
