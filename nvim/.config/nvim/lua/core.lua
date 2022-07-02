-- set file encodings to utf-8 by default
vim.opt.encoding = 'utf-8'

-- enable highlighting search results
vim.opt.hls = true
-- enable relative and normal line numbering
vim.opt.relativenumber = true

-- keep some lines visible when scrolling
vim.opt.scrolloff = 3

vim.opt.modeline = true
vim.opt.modelines = 3

vim.opt.listchars = 'eol:¬,tab:▸ ,trail:·'
vim.opt.list = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'

----------
-- KEYS --
----------

vim.g.mapleader = " "

local keymap=vim.api.nvim_set_keymap

-- map esc key to jk keys to speed up exiting from insert mode 
keymap('i', 'jk', '<Esc>', { noremap = true })

-- disable cursor keys in insert mode
keymap('i', '<Left>', '<NOP>', { noremap = true })
keymap('i', '<Right>', '<NOP>', { noremap = true })
keymap('i', '<Up>', '<NOP>', { noremap = true })
keymap('i', '<Down>', '<NOP>', { noremap = true })

-- disable cursor keys in normal mode
keymap('n', '<Left>', '<NOP>', { noremap = true })
keymap('n', '<Right>', '<NOP>', { noremap = true })
keymap('n', '<Up>', '<NOP>', { noremap = true })
keymap('n', '<Down>', '<NOP>', { noremap = true })

-- shortcuts to open and reload vim config
keymap('n', '<Leader>ce :e', '$MYVIMRC<CR>', { noremap = true })
keymap('n', '<Leader>cr :source', '$MYVIMRC<CR>', { noremap = true })

-- map :W to :w
vim.api.nvim_create_user_command('W', 'w', { nargs = 1 })

------------
-- COLORS --
------------

vim.cmd [[colorscheme gruvbox]]
vim.g.syntax = 'on'
vim.opt.background = 'dark'
