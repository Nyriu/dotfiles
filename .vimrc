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

Plugin 'jpalardy/vim-slime'
Plugin 'hanschen/vim-ipython-cell'

"Debugger Plugins
Plugin 'puremourning/vimspector'
"Plugin 'szw/vim-maximizer'



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
"let g:ycm_filetype_whitelist={
"      \ "c":1,
"      \ "cpp":1,
"      \ "sh":1,
"      \ "python":1,
"      \ "py":1,
"      \ }
"let g:ycm_filetype_blacklist={}
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:ycm_compilation_database_folder = './build'
"let g:ycm_extra_conf_vim_data = [ 'g:ycm_compilation_database_folder' ]
let g:ycm_confirm_extra_conf = 0 " turn off question

" Not necessary, fixed with appropriate ycm_extra_conf
"" CUDA
"" Map cuda files to c++ so that Ycm can parse
""autocmd BufNewFile,BufRead *.cu set filetype=cpp
""let g:ycm_semantic_triggers={'c,cpp,python,cuda': ['re!\w{2}'] }


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
autocmd BufRead,BufNewFile *.md,*.txt setlocal spell spelllang=it,en_us
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
let g:netrw_browsex_viewer= "exec chromium" " TODO not working properly
let g:vimtex_compiler_latexmk = { 
      \ 'executable' : 'latexmk',
      \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}


" Vim-Slime
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_vimterminal_config = {"term_finish": "close"}

" Git
if &diff
  "syntax off
  colorscheme elflord
  "colorscheme evening
  "highlight! link DiffText MatchParen

  "hi DiffAdd      ctermfg=NONE          ctermbg=Green
  "hi DiffChange   ctermfg=NONE          ctermbg=NONE
  "hi DiffDelete   ctermfg=LightBlue     ctermbg=Red
  "hi DiffText     ctermfg=Yellow        ctermbg=Red
endif


"" CPP
"autocmd FileType cpp
"  \ nnoremap <F5> :w!<CR>:!./run.sh<CR> | " in conflitto con vimspector



" ################### Vimspector ###################
let g:vimspector_enable_mappings='HUMAN'
nnoremap <F1>       :VimspectorReset<CR>
nmap <Leader>b <Plug>VimspectorBalloonEval
xmap <Leader>b <Plug>VimspectorBalloonEval
"nmap <Leader>h <Plug>VimspectorStepOut
"nmap <Leader>j <Plug>VimspectorStepOver
""nmap <Leader>j <Plug>VimspectorTO DECIDE
"nmap <Leader>l <Plug>VimspectorStepInto

""nnoremap <Leader>dd :call vimspector#Launch()<CR>
""nnoremap <F5>       :call vimspector#Launch()<CR>
"
""nnoremap <F1>       :VimspectorReset<CR>
""nnoremap <Leader>de :call vimspector#Reset()<CR>
"nnoremap <Leader>dc :call vimspector#Continue()<CR>
"
"nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
"nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
"
""nmap <Leader>dk <Plug>VimspectorRestart
""nmap <F4>       <Plug>VimspectorRestart
"nmap <Leader>dh <Plug>VimspectorStepOut
"nmap <Leader>dl <Plug>VimspectorStepInto
"nmap <Leader>dj <Plug>VimspectorStepOver
