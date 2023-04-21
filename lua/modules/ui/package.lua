local conf = require('modules.ui.config')

packadd({
  'nvimdev/dashboard-nvim',
  -- dev = true,
  event = 'VimEnter',
  config = conf.dashboard,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

packadd({
  'nvimdev/whiskyline.nvim',
  --dev = true,
  config = conf.whisky,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

packadd({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})

packadd({
  'nvimdev/indentmini.nvim',
  --dev = true,
  event = { 'BufEnter' },
  config = function()
    require('indentmini').setup({})
  end,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
})
