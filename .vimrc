" ================================================== "
" PLUGINS                                            "
" ================================================== "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
" unfocus NERD_tree when opening new buffer
Plugin 'baopham/vim-nerdtree-unfocus'

Plugin 'lervag/vimtex'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'tpope/vim-fugitive'
"Plugin 'powerline/powerline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ================================================== "
" YouCompleteMe ~ YCM                                "
" ================================================== "
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_filetype_whitelist={}
"let g:ycm_filetype_blacklist={}
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_compilation_database_folder = './build'
let g:ycm_extra_conf_vim_data = [ 'g:ycm_compilation_database_folder' ]
"

" ================================================== "
" NERDTree
" ================================================== "
nnoremap <F2> :NERDTreeToggle<CR>


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
set encoding=utf-8
set laststatus=2
set clipboard=unnamedplus
set number

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Fold with spacebar
nnoremap <space> za

" Save file with C-S
noremap <silent> <C-S> :update<CR><esc>
vnoremap <silent> <C-S> <C-C>:update<CR><esc>
inoremap <silent> <C-S> <C-O>:update<CR><esc>

syntax on
filetype plugin indent on

" highlightning colors " highly WIP
"hi Visual term=reverse cterm=reverse guibg=Blue
"hi Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan

set tabstop=2
set shiftwidth=2
set expandtab " spaces instead of tabs

set mouse=a
" Fix mouse issues with Alacritty
set ttymouse=sgr


" Spelling
"set spell
"filetype on
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=it,en_us
"autocmd FileType gitcommit setlocal spell spelllang=it,en_us
" C-L corrects previous spelling mistake
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

" Latex
autocmd FileType tex setlocal spell spelllang=it,en_us
au BufRead,BufNewFile *.tex,*.sty,*.cls set filetype=tex
au FileType tex syntax on
"au filetype tex syntax region texZone start='\\begin{lstlisting}' end='\\end{lstlisting}'
let g:tex_flavor = "latex"
"let g:vimtex_view_general_viewer = "zathura"
"let g:netrw_browserx_viewer="setsid xdg-open"

" CPP
autocmd FileType cpp
  \ nnoremap <F5> :w!<CR>:!./run.sh<CR> |


