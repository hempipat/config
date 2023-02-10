local colorscheme = "ayu"

require('ayu').setup({
  mirage = true,
  overrides = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- require("colorbuddy").colorscheme "gruvbuddy"
require("colorizer").setup()
