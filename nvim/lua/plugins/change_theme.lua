-- return {
--   -- Configure LazyVim to load gruvbox
--   { "folke/tokyonight.nvim", opts = {
--     style = "storm",
--     light_style = "day",
--    transparent = true,
--    styles = {
--    sidebars = "transparent",
--    floats = "transparent",
--    }
--   } },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "tokyonight",
--     },
--   },
-- }
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            Type = { fg = colors.yellow, style = { "bold" } },
            Function = { fg = colors.green, style = { "italic" } },
            Keyword = { fg = colors.red, style = { "bold" } },
          }
        end,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
