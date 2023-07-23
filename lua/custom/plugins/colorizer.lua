return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    -- Use the `default_options` as the second parameter, which uses
    -- `foreground` for every mode. This is the inverse of the previous
    -- setup configuration.
    require 'colorizer'.setup({
      'css',
      'javascript',
      html = { mode = 'background' },
    }, { mode = 'foreground' })
    vim.cmd [[
      augroup colorizer
        autocmd!
        autocmd BufRead,BufNewFile * ColorizerToggle
      augroup END
    ]]
  end,
}
