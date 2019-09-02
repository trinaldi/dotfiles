execute pathogen#infect()
syntax on
filetype plugin indent on
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
autocmd VimEnter * hi Normal ctermbg=none
set t_Co=256
set noswapfile
set hidden
set number
set nocompatible
let g:esearch = {
      \ 'adapter':    'grep',
      \ 'backend':    'vim8',
      \ 'out':        'win',
      \ 'batch_size': 1000,
      \ 'use':        ['visual', 'hlsearch', 'last'],
      \}
inoremap <c-x><c-k> <c-x><c-k>
let g:javascript_plugin_jsdoc = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
let g:indent_guides_auto_colors = 1
set pastetoggle=<F2>
" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>
" Colors {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
endif
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#cursormode#enabled=0
let g:airline_theme="base16"
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" Default color scheme
set background=dark
" }}}
" Misc {{{
filetype indent plugin on
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set backspace=indent,eol,start
" }}}
" Spaces & Tabs {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set modelines=2
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
filetype indent on
filetype plugin on
set autoindent
autocmd BufNewFile,BufRead *.go setlocal noexpandtab softtabstop=4 tabstop=4 shiftwidth=4
" }}}
" UI Layout {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu
set lazyredraw
set showmatch " higlight matching parenthesis
" }}}
" Searching {{{
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent " fold based on indent level
set foldnestmax=10 " max 10 depth
set foldenable " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10 " start with fold level of 1
"  }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>w :NERDTree<CR>
silent! map <F5> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="<F5>"
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ag
nnoremap <leader>1 :set number!<CR>
vnoremap <leader>y "+y
inoremap jk <esc>

let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'dist', 'docs']

let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END

" Custom Functions {{{
" }}}

set runtimepath^=~/.vim/bundle/ctrlp.vim
set pastetoggle=<F2>
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:vim_jsx_pretty_colorful_config = 1
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = "Don't use this!"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
set runtimepath^=~/.vim/bundle/ag
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F10>     :ShowSpaces 1<CR>
nnoremap <S-F10>   m`:TrimSpaces<CR>``
vnoremap <S-F10>   :TrimSpaces<CR>
" unicode symbols
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

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts=1

"GO
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
au filetype go inoremap <buffer> . .<C-x><C-o>
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
