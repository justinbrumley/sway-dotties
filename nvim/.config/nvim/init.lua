-- Remap <leader> key to comma
vim.keymap.set("", ",", "<Nop>")
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.lazy")
require('leap').create_default_mappings()

-- Some general setup
vim.opt.filetype = 'off'

-- Undo and backup file(s) setup
if vim.fn.has('vms') then
  vim.opt.backup = false
else
  vim.opt.backup = true

  if vim.fn.has('persistent_undo') then
    vim.opt.undofile = true
  end
end

-- Ale setup
vim.g.ale_fixers = {
   ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
   javascript = {'eslint'},
   markdown = {'write-good'},
}

vim.g.ale_set_signs = 0
vim.g.ale_fix_on_save = 1
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1
-- vim.g.ale_open_list = 1 -- Auto-open quickfix list

-- "Save" and "Save and Quit"
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":wq<CR>")

-- New splits go right
vim.opt.splitright = true

-- Tabs to Spaces (4 lyfe)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Keep buffers open in background
vim.opt.hidden = true

-- Show trailing space after line
vim.opt.list = true
vim.opt.lcs = 'trail:·,tab:»·'

vim.opt.wildignore = vim.opt.wildignore + '*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/*,*/public/js/_*'

-- Theming
vim.opt.termguicolors = true
vim.o.background = 'dark'
vim.cmd([[colorscheme gruvbox]])
vim.cmd('syntax enable')

-- Fuzzy File Search
vim.opt.rtp = vim.opt.rtp + '~/.fzf'

vim.opt.encoding = 'utf-8'

-- Hybrid line numbers
vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.nu = true;
vim.opt.rnu = true;

-- Rust
vim.g.rustfmt_autosave = 1

-- Map CTRL-P To Telescope::find_files
vim.cmd('nnoremap <C-p> :Telescope find_files<CR>')
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")

-- Map CTRL-F to Telescope::live_grep
vim.cmd('nnoremap <C-f> :Telescope live_grep<CR>')
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>")

-- Transparent Background
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
