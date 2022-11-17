local opts = {noremap = true}

local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------
-- Modes
-------------------
--  Normal Mode = "n"
--  Insert Mode = "i"
--  Visual Mode = "v"
--  Visual Block Mode = "x"
--  Terminal Mode = "t"
--  Command Mode = "c"

-- Insert --
-- Better way to exit insert mode
keymap("i", "jk", "<Esc>", opts)


-- Normal --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Manage Windows
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>se", "<C-w>e", opts)
keymap("n", "<leader>dd", ":close<cr>", opts)
-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

keymap("n", "<leader>sc", "<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>sk", "<cmd>lua require'telescope.builtin'.keymaps(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

keymap("n", "<leader>gb", "<cmd>lua require'telescope.builtin'.git_branches(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require'telescope.builtin'.git_status(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Neo Tree
keymap("n", "<leader>e", ":NvimTreeFocus<cr>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
