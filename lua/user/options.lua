-------------------------------------------------------------------
-- General vim options
-------------------------------------------------------------------

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}

  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                            -- display lines as one long line
  linebreak = true,                        -- companion to wrap, don't split words
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


-- vim.opt.number         = true -- Row numbers
-- vim.opt.relativenumber = false 
-- vim.opt.colorcolumn    = '100' -- right-side column
-- vim.opt.signcolumn     = 'yes' -- sign column
-- vim.opt.updatetime     = 300 -- timeout before writting to swap file
-- vim.opt.showmatch      = true -- match brackets
-- vim.opt.ignorecase     = true -- case insensetive pattern searches
-- vim.opt.hlsearch       = true -- highlight search matches
-- vim.opt.tabstop        = 2 -- tab size
-- -- vim.opt.softtabstop    = 4
-- vim.opt.shiftwidth     = 2
-- vim.opt.autoindent     = true -- autoindent
-- vim.opt.completeopt    = { 'menuone', 'noselect' } -- autocomplete options
-- vim.opt.syntax         = 'true' -- syntax
-- vim.opt.mouse          = 'a' -- enable mouse support
-- vim.opt.cmdheight      = 1 -- more space in the neovim command line for displaying messages
-- vim.opt.fileencoding   = 'utf-8' -- file encoding
-- vim.opt.pumheight      = 10 -- popup menu hight
-- vim.opt.cursorline     = true -- highlight line
-- vim.opt.smartcase      = true -- smart case
-- vim.opt.smartindent    = true -- smart indentation
-- vim.opt.splitbelow     = true -- always split below
-- vim.opt.splitright     = true -- always split to the right
-- vim.opt.undofile       = true -- persistent undo
-- vim.opt.scrolloff      = 8 -- location of cursor in files
-- vim.opt.sidescrolloff  = 8
-- vim.opt.termguicolors  = true -- rich colors
-- vim.opt.laststatus     = 3
-- vim.cmd('filetype plugin indent on') -- plugin indent on
-- vim.cmd('filetype plugin on') -- plugin indent on
-- vim.g.neovide_scale_factor = 0.75 -- modify neovide scale factor
