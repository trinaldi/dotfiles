execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd VimEnter * hi Normal ctermbg=none
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ycm_keep_logfiles = 1
"let g:ycm_log_level = 'debug'
"let g:ycm_use_clangd = 1
"let g:ycm_clangd_binary_path = 'clangd'
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
set hidden
set number
"set relativenumber
set nocompatible

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Vertical Gdiff
set diffopt+=vertical

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:esearch = {
      \ 'adapter':    'grep',
      \ 'backend':    'vim8',
      \ 'out':        'win',
      \ 'batch_size': 1000,
      \ 'use':        ['visual', 'hlsearch', 'last'],
      \}

inoremap <c-x><c-k> <c-x><c-k>
set pastetoggle=<F2>

" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

" Colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
endif
set background=dark
hi LineNr term=bold cterm=bold ctermfg=2 guifg=Grey guibg=Grey90
" Misc
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set backspace=indent,eol,start

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set modelines=2
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
filetype indent on
filetype plugin on
autocmd FileType c,cpp,python,ruby setlocal shiftwidth=4 softtabstop=4 expandtab

" UI Layout
set showcmd
set cursorline
hi CursorLineNr term=bold cterm=bold ctermfg=255 gui=bold
set wildmenu
set lazyredraw
set showmatch

" Searching
set ignorecase
set incsearch
set hlsearch

" Folding
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevelstart=10
nnoremap <space> za

" Leader Shortcuts
let mapleader=","
nnoremap <leader>w :NERDTree<CR>
silent! map <F5> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="<F5>"
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ag
vnoremap <leader>y "+y
inoremap jk <esc>
"
" NERDTree
let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'dist', 'docs']

" Custom Functions
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
set pastetoggle=<F2>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Hardmode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = "Don't use this!"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:xml_syntax_folding = 1

" Emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" The Silver Surfer
set runtimepath^=~/.vim/bundle/ag

" air-line
" required if using https://github.com/bling/vim-airline
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#cursormode#enabled=0
let g:airline_theme="base16"
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
