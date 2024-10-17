vim.cmd("set conceallevel=0")
vim.cmd("set concealcursor=")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.g.mapleader = " "
-- vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.compatible = false
vim.opt.showmode = false

-- ----------------
-- Kaymaps Configs
-- ----------------



-- Navegação de paneis vim
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- 
-- Salvar arquivo com Ctrl + s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- Sair do arquivo com Ctrl + q
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>")

-- Manipulação de buffers (abas)
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<C-x>", ":bdelete!<CR>")
