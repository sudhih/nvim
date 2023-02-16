local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI' },
  config = conf.vim_dadbod_ui,
  dependencies = { 'tpope/vim-dadbod' },
})

package({ 'glepnir/coman.nvim', dev = true, event = 'BufRead' })

package({
  'glepnir/template.nvim',
  dev = true,
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  config = conf.template_nvim,
})

package({
  'glepnir/easyformat.nvim',
  dev = true,
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'typescript' },
  config = conf.easyformat,
})

package({
  'norcalli/nvim-colorizer.lua',
  ft = { 'lua', 'css', 'html', 'sass', 'less', 'typescriptreact' },
  config = function()
    require('colorizer').setup()
  end,
})

package({
  'glepnir/mutchar.nvim',
  dev = true,
  ft = { 'c', 'cpp', 'go', 'rust', 'lua' },
  config = conf.mut_char,
})

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = true,
})

package({
  'glepnir/dbsession.nvim',
  cmd = { 'SessionSave', 'SessionLoad', 'SessionDelete' },
  opts = true,
})

package({ 'phaazon/hop.nvim', event = 'BufRead', config = conf.hop })
