return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      prompts = {
        Explain = {
          prompt = 'Explain this code.',
          mapping = '<leader>ae',
          description = 'Explain selected code',
        },
        Review = {
          prompt = 'Review this code.',
          mapping = '<leader>ar',
          description = 'Review selected code',
        },
        Fix = {
          prompt = 'Fix this code.',
          mapping = '<leader>af',
          description = 'Fix selected code',
        },
        Test = {
          prompt = 'Write tests for this code.',
          mapping = '<leader>at',
          description = 'Generate tests for selected code',
        },
        CustomStyle = {
          prompt = 'Give me a custom explanation',
          system_prompt = 'You are very good at explaining things clearly and concisely.',
          mapping = '<leader>ax',
          description = 'Custom prompt with system personality',
        },
      },
    },
    config = function()
      local chat = require 'CopilotChat'
      chat.setup()

      -- Manual chat window toggle
      vim.keymap.set('n', '<leader>ap', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat window' })

      -- Manual prompt input (visual mode only)
      vim.keymap.set('v', '<leader>ac', function()
        vim.ui.input({ prompt = 'Ask Copilot: ' }, function(input)
          if input then
            chat.ask(input, {})
          end
        end)
      end, { desc = 'Custom Copilot prompt' })
    end,
  },
}
