local utils = require("utils")
local M = {}
function showPlugins()
	local plugins = require("lazy").plugins()
	utils.createwin(plugins)
end
function M.setup(opts)
	local augroup = vim.api.nvim_create_augroup("plugin_reloader::relaod", { clear = true })
	vim.api.nvim_create_user_command("Reload", showPlugins, {
		desc = "Reload plugins",
	})
end

return M
