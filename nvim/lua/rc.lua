local o = vim.o
local g = vim.g

o.nu = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 5
o.updatetime = 50

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

