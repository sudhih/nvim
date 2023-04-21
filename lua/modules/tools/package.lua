local conf = require('modules.tools.config')

packadd({
  'nvimdev/flybuf.nvim',
  --dev = true,
  cmd = 'FlyBuf',
  config = function()
    require('flybuf').setup({})
  end,
})

packadd({ 'nvimdev/coman.nvim', 
--dev = true, 
event = 'BufRead' })

packadd({
  'nvimdev/template.nvim',
  --dev = true,
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  config = conf.template_nvim,
})

packadd({
  'nvimdev/easyformat.nvim',
  --dev = true,
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'typescript', 'javascrip', 'javascriptreact' },
  config = conf.easyformat,
})

packadd({
  'norcalli/nvim-colorizer.lua',
  ft = { 'lua', 'css', 'html', 'sass', 'less', 'typescriptreact', 'conf' },
  config = function()
    require('colorizer').setup()
  end,
})

packadd({
  'nvimdev/mutchar.nvim',
  --dev = true,
  ft = { 'c', 'cpp', 'go', 'rust', 'lua' },
  config = conf.mut_char,
})

packadd({
  'nvimdev/hlsearch.nvim',
  event = 'BufRead',
  config = true,
})

packadd({
  'nvimdev/dbsession.nvim',
  --dev = true,
  cmd = { 'SessionSave', 'SessionLoad', 'SessionDelete' },
  opts = true,
})

packadd({ 'phaazon/hop.nvim', event = 'BufRead', config = conf.hop })

packadd({
  'nvimdev/nerdicons.nvim',
  --dev = true,
  cmd = 'NerdIcons',
  opts = true,
})
