set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set cursorline
set showcmd
set number
set hidden
set hlsearch
set backspace=2
let mapleader=","
autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd bufread *.coffee set ft=coffee
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd bufread Cakefile set ft=coffee

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
    endif
endif
" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/Vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/Vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle/'
call vundle#rc(s:editor_root . '/bundle')

Bundle 'Vundle'
Bundle 'vim-ctrlp'
Bundle 'vim-easilymotion'
Bundle 'syntastic'
Bundle 'tagbar'
Bundle 'nerdtree'
Bundle 'fugitive'
Bundle 'nerdcommenter'
Bundle 'php.vim'
Bundle 'php-phpqa'
Bundle 'snipmate'
Bundle 'ultisnips'
Bundle 'vim-easytags'
Bundle 'vim-less'
Bundle 'vim-misc'
Bundle 'vim-supertab'
Bundle 'vim-sensible'
Bundle 'colorschemes'
Bundle 'vim-blade'
if vundle_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
filetype off
syntax on
filetype plugin indent on

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_phpcs_disable=1
let g:syntastic_puppet_lint_arguments="--no-only_variable_string-check --no-80chars-check --no-hard_tabs-check"
let g:syntastic_phpcs_conf="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

" Fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
  \ }
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set autoread

let mapleader = ","
let g:mapleader = ","

set ignorecase
set smartcase

set hlsearch
set incsearch

set lazyredraw

set showmatch
set mat=2

set nobackup
set nowb
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nowritebackup " Only in case you don't want a backup file while editing
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set expandtab
set autoindent
set smartindent

set lbr
set tw=500

set ai
set si
set wrap

map j gj
map k gk

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

colorscheme Tomorrow-Night-Eighties

" auto complete and tab functionality :D
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
