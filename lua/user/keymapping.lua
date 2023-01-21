--------------------------------------------------
-- Keymaps and custom key settings
--------------------------------------------------

local opts = { noremap = true, silent = true }
-- local term_opts = { silent }
-- shortcut for creating a mapping
local keymap = vim.api.nvim_set_keymap

-- set leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move split panes
keymap("n", "<A-h>", "<C-W>H", opts)
keymap("n", "<A-j>", "<C-W>J", opts)
keymap("n", "<A-k>", "<C-W>K", opts)
keymap("n", "<A-l>", "<C-W>L", opts)

-- buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Telescope config
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

-- gitsigns config
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", opts)

-- nvim tree
keymap("n", "<leader>e", "<cmd>:NvimTreeToggle<CR>", opts)

-- stop highlighting formatted text
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)

-- close buffer
keymap("n", "Q", "<cmd>Bdelete<CR>", opts)

-- buffer switcher
vim.api.nvim_set_keymap(
  "n",
  "<leader>ja",
  "<cmd>JABSOpen<cr>",
  { noremap = true, silent = true, nowait = true }
)

-- formatting
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
keymap("n", "<leader>F", ":Format<CR>", opts)

-- delete without saving to register
keymap("n", "<leader>d", [["_d]], opts)

-- copy to system clipboard
keymap("n", "<leader>Y", [["+Y]], opts)
keymap("n", "<leader>y", [["+y]], opts)

-- terminals
-- keymap("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
-- keymap("n", "<leader>ip", ":lua _PYTHON_TOGGLE()<CR>", opts)
-- keymap("n", "<leader>ot", ":lua _TERM_TOGGLE()<CR>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)


-- Insert Mode --

-- exit insert mode
keymap("i", "ii", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)

-- move lines up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- exit insert mode
keymap("i", "ii", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)

-- Visual --

-- exit visual mode
--[[ keymap("v", "jk", "<Esc>", opts) ]]
--[[ keymap("v", "kj", "<Esc>", opts) ]]
keymap("v", "qq", "<Esc>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- copy to sytstem clipboard
keymap("v", "<leader>y", [["+y]], opts)

-- delete but do not save to register
keymap("v", "<leader>d", [["_d]], opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- save file 
keymap("n", "<leader>w", "<cmd>w!<CR>", opts)

-- lazygit
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- close buffer
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

-- No highlighting
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
