local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
    vim.cmd([[packadd telescope-file-browser.nvim]])
  end
  local fb_actions = require "telescope".extensions.file_browser.actions
  require('telescope').setup({
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      file_browser = {
        theme = 'ivy',
        mappings = {
          ["i"] = {
            ["<C-c>c"] = fb_actions.create,
            ["<C-c>r"] = fb_actions.rename,
            ["<C-c>d"] = fb_actions.remove,
            ["<C-c>o"] = fb_actions.open,
          }
        }
      }
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('dotfiles')
  require('telescope').load_extension('gosource')
  require('telescope').load_extension('file_browser')
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  local ignored = {
    'phpdoc',
    'astro',
    'beancount',
    'bibtex',
    'bluprint',
    'eex',
    'embedded_template',
    'vala',
    'wgsl',
    'verilog',
    'twig',
    'turtle',
    'm68k',
    'hocon',
    'lalrpop',
    'meson',
    'mehir',
    'rasi',
    'rego',
    'racket',
    'pug',
    'java',
  }

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    ignore_install = ignored,
    highlight = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
end

function config.mcc_nvim()
  local mcc = require('mcc')
  mcc.setup({
    go = { ';', ':=', ';' },
    rust = { '88', '::', '88' },
    c = { '-', '->', '-' },
    cpp = { '-', '->', '--' },
  })
end

function config.hop()
  local hop = require('hop')
  hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
  })
end

return config
