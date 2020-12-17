" PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-pairs']
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-test/vim-test'
Plug 'fratajczak/one-monokai-vim'
Plug 'gcmt/taboo.vim'
Plug 'mhinz/vim-signify'
call plug#end()

" THEMES
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
colorscheme one-monokai

" NERDTREE
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

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
let $FZF_DEFAULT_COMMAND = 'fd -t f'
let $FZF_DEFAULT_OPTS = '--ansi --preview ''bat --color=always --style=numbers {}'''
" search in files
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
			\   <bang>0)
nnoremap <C-g> :Rg<CR>

" COC.NVIM
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" TABS
let g:taboo_tab_format	= " %P "

" SESSIONS
" Creates a session
function! MakeSession()
	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd(1, 1)
	if (filewritable(b:sessiondir) != 2)
		exe 'silent !mkdir -p ' b:sessiondir
		redraw!
	endif
	let b:sessionfile = b:sessiondir . '/session.vim'
	exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
	exe "tabdo NERDTreeClose"
	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd(1, 1)
	let b:sessionfile = b:sessiondir . "/session.vim"
	if (filereadable(b:sessionfile))
		exe "mksession! " . b:sessionfile
		echo "updating session"
	endif
endfunction

" Loads a session if it exists
function! LoadSession()
	if argc() == 0
		let b:sessiondir = $HOME . "/.vim/sessions" . getcwd(1, 1)
		let b:sessionfile = b:sessiondir . "/session.vim"
		if (filereadable(b:sessionfile))
			exe 'source ' b:sessionfile
		else
			echo "No session loaded."
		endif
	else
		let b:sessionfile = ""
		let b:sessiondir = ""
	endif
endfunction

" MISC
" open new split panes to right and below
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


" KEYS
" leader is space
" :PlugInstall to install 
" :PlugClean to clean
" :PlugUpdate to update
" :PlugUpgrade to upgrade
" C-b is nerdtree
" 	- navigate with j-k
" 	- CR to open
" 	- s to vsplit
"   - t to tab
"   - cd to change pwd
"   - CD to root to pwd
"   - o to toggle
"   - O to cascade open
"   - X to cascade close
" C-j is terminal
" C-p to FZF
" C-g to global search
" :GF? to FZF Gstatus
" leader d to revision diff
"   - n and N to move
" leader c space to toggle comment
" C-n is visual multi
" :Test__ for the test commands
" :G for git status
"   - X to discard
"   - s to add
"   - u to unstange
"   - dv vdiffsplit
" :Gvd for vdiffsplit
" :Gblame for git blame
" C-w = to make all windows equal
" C-w h,j,k,l to move around windows
" gt or [num]gt to move around tabs
" C-space in insert to get completion
" 	- Tab and S-Tab to move around completions
"	]g and [g to go to next warn/err
" gd to go to def
" gr to get references
" :MakeSession() to create a new session, based on the folder
" :LoadSession() to load a previous session, based on the folder
" :UpdateSession() to update the current session if it exists
" :tabnew, then :tcd NEW_PATH to create a new tab in a different folder
" 	- nerdtree and the tab name auto-update
" C-l to dismiss the search highlights
