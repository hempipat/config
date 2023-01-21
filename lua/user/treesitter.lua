--------------------------------------------------------
-- Treesitter for syntax highlighting
--------------------------------------------------------

require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "java", "lua", "python", "bash", "json", "html"},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {  },

  autopairs = {
	enable = true
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- the name of the parser) list of language that will be disabled
    --[[ disable = { "c", "rust", "lua", "python", "bash", "cpp", "json5" }, ]]
	disable = { "rust", "vim" },

	autopairs = {
		enabled = true,
	},

	indent = { enable = true, disable = { "python", "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	autotag = {
		enable = true,
		disable = { "xml" },
	},

	rainbow = {
		enable = true,
		colors = {
			"Gold",
			"Orchid",
			"DodgerBlue",
			-- "Cornsilk",
			-- "Salmon",
			-- "LawnGreen",
		},
		disable = { "html" },
	},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
