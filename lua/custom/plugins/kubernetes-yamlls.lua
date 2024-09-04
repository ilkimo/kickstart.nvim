return {
  'ilkimo/kubernetes.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>ks', ':KubernetesGenerateSchema<CR>', { noremap = true, silent = true, desc = 'Generate Kubernetes Schemas' })
    vim.api.nvim_set_keymap(
      'n',
      '<leader>kp',
      ':KubernetesPatchYamlls<CR>',
      { noremap = true, silent = true, desc = 'Patch Yamlls yaml language server kubernetes hardcoding (read plugin README)' }
    )
    vim.api.nvim_set_keymap('n', '<leader>kc', ':KubernetesIsYamllsPatched<CR>', { noremap = true, silent = true, desc = 'Check if Yamlls are patched' })
  end,
}
