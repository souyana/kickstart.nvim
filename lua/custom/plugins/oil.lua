-- Filer
vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('oil').setup {
  default_file_explorer = true,
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
  },
}

vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>', { desc = 'Open [O]il' })
