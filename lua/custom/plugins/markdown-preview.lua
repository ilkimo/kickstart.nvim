-- File: lua/custom/plugins/markdown_preview.lua

return {
  "iamcco/markdown-preview.nvim",
  run = 'cd app && npm install',
  config = function()
    vim.cmd [[
      let g:mkdp_auto_start = 0
      let g:mkdp_auto_close = 1
      let g:mkdp_refresh_slow = 0
      let g:mkdp_command_for_global = 0
    ]]
  end,
}
