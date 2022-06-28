local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
        vim.cmd('call DarkMode()')
	end,
	set_light_mode = function()
        vim.cmd('call LightMode()')
	end,
})
auto_dark_mode.init()
