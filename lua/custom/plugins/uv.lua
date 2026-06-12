-- UV python package manager integration
vim.pack.add { 'https://github.com/benomahony/uv.nvim' }

require('uv').setup {
  picker_integration = true,
}
