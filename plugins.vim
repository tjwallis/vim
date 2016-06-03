" nvim or vim
if has('nvim')
	let s:editor_root=expand("~/.config/nvim")
else
	let s:editor_root=expand("~/.vim")
endif

" Mac or Linux change the python path
if has("unix")
	let s:uname = system("uname")
	let g:python_host_prog='/usr/bin/python'
	if s:uname == "Loren\n"
		let g:python_host_prog='/usr/bin/python'
	endif
endif

" Setting up Vundle - the vim plugin bundler
filetype off
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin()

" Vundle Manages itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'joshtronic/php.vim'
"Plugin 'joonty/vim-phpqa'
"Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Optional:
"Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/UltiSnips'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'pangloss/vim-javascript'

Plugin 'matze/vim-move'

Plugin 'mattn/emmet-vim'

Plugin 'junegunn/goyo.vim'

" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neosnippet.vim'

" Enable Markdown Preview + GitHub flavored markdown
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'

Plugin 'jwalton512/vim-blade'

" Color Schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on    " required
" Setting up Vundle - the vim plugin bundler end

