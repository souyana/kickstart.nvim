-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Filer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      },
      vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>', { desc = 'Open [O]il' }),
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  -- Alternatives of typescript-language-server
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- Markdown preview for nvim
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        theme = 'light',
        -- Open default browser
        app = 'browser',
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  -- Call Lazygit from nvim
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
  },
  -- Persist and toggle terminal in nvim
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = vim.o.columns * 0.4,
        open_mapping = [[<c-\>]],
        hide_number = true, -- hide the number column in toggleterm buffers
        start_in_insert = true,
        direction = 'vertical', -- 'vertical' | 'horizontal' | 'tab' | 'float'
      }
    end,
  },
  -- UV python package manager integration
  {
    'benomahony/uv.nvim',
    opts = {
      picker_integration = true,
    },
  },
  -- Flutter development tools
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        widget_guides = { enabled = true },
        lsp = {
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = 'prompt', -- or 'always'
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
    end,
  },
  -- Animate the cursor with effect
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      legacy_computing_symbols_support = true,
      stiffness = 0.5,
      trailing_stiffness = 0.5,
      matrix_pixel_threshold = 0.5,
    },
  },
  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
}
