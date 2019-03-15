set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"download clang and ycm as instructed on
"http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
Plugin 'Valloric/YouCompleteMe'
"python syntax check
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
"color scheme
Plugin 'jnurmine/Zenburn'
"NERDtree fs viewer
Plugin 'scrooloose/nerdtree'
"FZF fuzzy finding
"You also need to get ag (the_silver_searcher)
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"enable mouse through tmux too
set mouse+=a
if &term =~ '^screen'
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

"map NERDTree stuff
nmap <C-N> :NERDTreeToggle<CR>

"key remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"fold/unfold paragraphs by typing :za
set foldmethod=indent
set foldlevel=99

"Python indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"mark whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h,*.hpp
			\ highlight BadWhitespace ctermbg=red guibg=red |
			\ match BadWhitespace /\s\+$/

"set encoding UTF8
set encoding=utf-8

"python virtualenv for autocomplete
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"python auto-complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python syntax highlight
let python_highlight_all=1
syntax on

"set colorscheme
colorscheme zenburn

"cscope keys
nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"load cscope db if exists
if filereadable("cscope.out")
  cs add cscope.out
endif
