local M = {}
function M.createwin(items)
	local width = 40
	local height = #items + 2
	local row = math.floor(vim.o.lines / 2) - math.floor(height / 2)
	local col = math.floor(vim.o.columns / 2) - math.floor(width / 2)
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = bufnr })
	for i, item in ipairs(items) do
		vim.api.nvim_buf_set_lines(bufnr, i - 1, i, false, { item.name })
	end
	vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
	vim.api.nvim_set_option_value("readonly", true, { buf = bufnr })

	local win_id = vim.api.nvim_open_win(bufnr, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})
	vim.api.nvim_set_option_value("winhl", "Normal:Normal,FloatBorder:FloatBorder", { win = win_id })

	local current_line = 1
	local ns_id = vim.api.nvim_create_namespace("highlight_current_line")
	local function highlight_and_move_cursor()
		vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
		if current_line >= 1 and current_line <= #items then
			vim.api.nvim_buf_add_highlight(bufnr, ns_id, "Visual", current_line - 1, 0, -1)
			vim.api.nvim_win_set_cursor(win_id, { current_line, 0 })
		end
	end
	highlight_and_move_cursor()
	local function handle_keys(key)
		if key == "k" or key == "<Up>" then
			if current_line > 1 then
				current_line = current_line - 1
			end
		elseif key == "j" or key == "<Down>" then
			if current_line < #items then
				current_line = current_line + 1
			end
		elseif key == "CR" then
			local plugin_name = items[current_line].name
			print("Selected item:", plugin_name)
			require("lazy.core.loader").reload(plugin_name)
			-- 关闭窗口
			vim.api.nvim_win_close(win_id, true)
			return
		end
		highlight_and_move_cursor()
	end

	-- 辅助函数用于设置按键映射
	local function set_keymap(key, action)
		vim.keymap.set("n", key, function()
			handle_keys(action)
		end, {
			buffer = bufnr,
			noremap = true,
			silent = true,
		})
	end
	-- 设置按键映射
	set_keymap("k", "k")
	set_keymap("j", "j")
	set_keymap("<Up>", "Up")
	set_keymap("<Down>", "Down")
	set_keymap("<CR>", "CR")
	-- 允许用户通过 q 键关闭窗口，仅限于当前缓冲区
	vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = bufnr, noremap = true, silent = true })
end

return M
