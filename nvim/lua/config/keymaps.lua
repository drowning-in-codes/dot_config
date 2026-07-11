-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- @docs https://github.com/Civitasv/cmake-tools.nvim/blob/master/docs/all_commands.md
-- use keymap for cmake-tools.nvim
local cmake = require("cmake-tools")
vim.keymap.set("n", "<leader>cg", function()
  cmake.select_launch_target(function()
    vim.cmd("CMakeGenerate")
  end)
end, { desc = "generate with default configuration" })

vim.keymap.set("n", "<leader>cb", function()
  cmake.select_launch_target(function()
    vim.cmd("CMakeBuild")
  end)
end, { desc = "build with default configuration" })

vim.keymap.set("n", "<leader>cu", function()
  cmake.select_launch_target(function()
    vim.cmd("CMakeRun")
  end)
end, { desc = "run with target select" })

vim.keymap.set("n", "<leader>dg", function()
  cmake.select_launch_target(function()
    vim.cmd("CMakeDebug")
  end)
end, { desc = "run with target select" })
