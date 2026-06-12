-- Persist and toggle terminal in nvim
vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  size = vim.o.columns * 0.4,
  open_mapping = [[<c-\>]],
  hide_number = true,
  start_in_insert = true,
  direction = 'vertical',
}
