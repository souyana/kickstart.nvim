-- Animate the cursor with effect
vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }

require('smear_cursor').setup {
  legacy_computing_symbols_support = true,
  stiffness = 0.5,
  trailing_stiffness = 0.5,
  matrix_pixel_threshold = 0.5,
}
