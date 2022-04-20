" Downlaod packer if fresh install
" git clone --depth 1 https://github.com/wbthomason/packer.nvim ./pack/packer/start/packer.nvim

lua require('plugins')
lua require('configs')

" ================================================== "
" SPLITS                                             "
" ================================================== "
set splitbelow splitright

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>


" ================================================== "
" MISC                                               "
" ================================================== "

" Save file with C-S
 noremap <silent> <C-S>      :w<CR><esc>
vnoremap <silent> <C-S> <C-C>:w<CR><esc>
inoremap <silent> <C-S> <C-O>:w<CR><esc>

set tabstop=2
set shiftwidth=2
set expandtab " spaces instead of tabs

set encoding=utf-8
"set laststatus=2
set clipboard=unnamedplus
set number

set mouse=a
"set ttymouse=sgr " Fix mouse issues with Alacritty

