-- Flutter development tools
vim.pack.add {
  'https://github.com/nvim-flutter/flutter-tools.nvim',
  'https://github.com/stevearc/dressing.nvim',
}

require('flutter-tools').setup {
  widget_guides = { enabled = true },
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      renameFilesWithClasses = 'prompt',
      updateImportsOnRename = true,
    },
  },
  dev_log = {
    enabled = false,
  },
  debugger = {
    enabled = true,
  },
}

vim.keymap.set('n', '<leader>0', require('telescope').extensions.flutter.commands, { desc = 'Flutter tools commands' })
