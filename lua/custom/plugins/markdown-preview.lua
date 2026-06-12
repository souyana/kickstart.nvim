-- Markdown preview for nvim
vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }

vim.g.mkdp_filetypes = { 'markdown' }

vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<cr>', { desc = '[M]arkdown [P]review' })
vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', { desc = '[M]arkdown preview [S]top' })

vim.cmd [[
  function! OpenMarkdownPreview(url)
    if has('mac')
      execute "silent !open -n -a 'Brave Browser' --args --new-window " . a:url
    elseif has('win32') || has('win64')
      execute "silent !start " . a:url
    endif
  endfunction
]]
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

-- Build step for markdown-preview
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'markdown-preview.nvim' then
      local kind = ev.data.kind
      if kind == 'install' or kind == 'update' then
        local result = vim.system({ 'npm', 'install' }, { cwd = ev.data.path .. '/app' }):wait()
        if result.code ~= 0 then
          vim.notify('markdown-preview.nvim build failed:\n' .. (result.stderr or ''), vim.log.levels.ERROR)
        end
      end
    end
  end,
})
