require('vis')

require('plugins/complete-filename')
require('plugins/complete-word')
require('plugins/filetype')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme base16-gruvbox-dark-hard')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
end)
