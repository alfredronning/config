syntax on

set noerrorbells
set nu
filetype plugin indent on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set undodir=~/.vim/undodir
set undofile
set incsearch

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'| " style themes
Plug 'Valloric/YouCompleteMe'| " autocomletion
Plug 'mbbill/undotree'| " difflog of undoos graphstyle
Plug 'rust-lang/rust.vim'| " rust syntax higlighting/formatting

call plug#end()

" use gruvbox color scheme
colorscheme gruvbox
set background=dark

" vertical split before open, no banner, size 25
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" steady bar cursor insert mode, steady block cursor normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" leader shortcuts
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>


set shellcmdflag=-ic| " loading from paths aliases etc from .zshrc

" custom python commands
:command Main :normal! iif __name__ == "__main__":<ESC>
:command Open :normal! aopen("").read().strip().split("\n")<ESC>9b2l

