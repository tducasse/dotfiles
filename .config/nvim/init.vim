" PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-tslint', 'coc-pairs', 'coc-rust-analyzer']
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-test/vim-test'
Plug 'fratajczak/one-monokai-vim'
Plug 'gcmt/taboo.vim'
Plug 'mhinz/vim-signify'
Plug 'szw/vim-maximizer'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'brooth/far.vim'
call plug#end()

" THEMES
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
colorscheme one-monokai

" SESSIONS
let g:session_autosave = 'no'

" NERDTREE
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeUseTCD = 1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeFocus<CR>

" GIT
function! DiffNav()
	exe 'tabedit %'
	exe 'term git log -p %'
	exe 'startinsert'
endfunction
nnoremap <leader>d :call DiffNav()<CR>

" TERMINAL
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+j
function! OpenTerminal()
	vsplit term://zsh
	vertical resize 80
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'fd -t f'
let $FZF_DEFAULT_OPTS = '--ansi --preview ''bat --color=always --style=numbers {}'''
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
			\   <bang>0)
nnoremap <C-g> :Rg<CR>
nnoremap <leader><Tab> :Buffers<CR>

" COC.NVIM
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		if (coc#float#has_float())
			call coc#float#close_all()
		else
			call CocActionAsync('doHover')
		endif
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" TABS
let g:taboo_tab_format	= " %P "

" FAR.VIM
let g:far#source = 'rg'
let g:far#enable_undo = 1
let g:far#auto_preview = 0

" MAXIMIZER
nnoremap <C-f> :MaximizerToggle<CR>

" MISC
set hidden
set nocompatible
set lazyredraw
set encoding=utf-8
set splitright
set splitbelow
set expandtab
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set number relativenumber
set wildmenu
set nrformats-=octal
set laststatus=2
set ruler
set wildmenu
if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline
set mouse=a
set clipboard=unnamedplus
set incsearch
set autoread
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
map <space> <leader>

