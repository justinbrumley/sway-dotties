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

-- Setup ack to use rg (ripgrep) for searching
vim.g.ackprg = 'rg --color=never --no-heading --with-filename --line-number --column'
vim.g.ack_autoclose = 1

-- Ack aliases
vim.cmd('cnoreabbrev ag Ack!')
vim.cmd('cnoreabbrev aG Ack!')
vim.cmd('cnoreabbrev Ag Ack!')
vim.cmd('cnoreabbrev AG Ack!')

-- Open Quickfix
vim.cmd('nnoremap <C-c> :copen<CR>')

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
vim.cmd('colorscheme tender')
vim.cmd('syntax enable')
vim.opt.termguicolors = true

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

-- Map CTRL-P To Telescope
vim.cmd('nnoremap <C-p> :Telescope find_files<CR>')

-- Transparent Background
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
