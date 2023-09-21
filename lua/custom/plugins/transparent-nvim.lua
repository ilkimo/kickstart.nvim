return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({ -- Optional, you don't have to run setup.
      groups = {                   -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {},   -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })


    -- Set nvim-neo-tree/neo-tree.nvim transparent
    require('transparent').clear_prefix('NeoTree')
  end,
}

-- HELP
-- Toggle transparency --> :TransparentToggle
