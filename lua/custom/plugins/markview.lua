return {
  'OXY2DEV/markview.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('markview').setup {
      lazy = false, -- Recommended
      initial_state = true,
    }
    -- Setup code for rainbow_csv, if needed
    -- For now, rainbow_csv works out of the box without additional setup
    -- ft = "markdown" -- If you decide to lazy-load anyway
  end,
}

-- https://github.com/OXY2DEV/markview.nvim
-- Useful commands:
-- markview.nvim has a single command :Markview.

-- When used without any subcommands, it toggles the plugin.

-- Available subcommands,

-- toggleAll
-- enableAll
-- disableAll
-- toggle {n}
-- enable {n}
-- disable {n}
-- hybridToggle
-- hybridEnable
-- hybridDisable
-- splitToggle {n}
-- splitEnable {n}
-- splitDisable {n}
