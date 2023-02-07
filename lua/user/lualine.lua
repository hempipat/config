local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow }
	}
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = ' ', modified = '柳 ', removed = ' ' }, -- changes diff symbols
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	update_in_insert = false,
	always_visible = true
  -- cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local mode = {
	"mode",
	icons_enabled = true,
	icon = nil,
	separator = nil,
	cond = nil,
	color = nil,
	type = nil,
	padding = 1,
	fmt = nil,
	on_click = nil,
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    component_separators = '',
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "dashboard", "Outline"},
    -- ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {'branch', diff },
    lualine_c = { },
    lualine_x = { diagnostics, 'encoding', filetype },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
