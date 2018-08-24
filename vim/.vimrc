syntax on
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
colorscheme gruvbox
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"    source ~/.vimrc_background
"endif
let g:airline_extensions = []
let g:airline_theme="base16"
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" Default color scheme
set background=dark
" }}}
" Misc {{{
filetype indent plugin on
set ttyfast " faster redraw
set backspace=indent,eol,start
" }}}
" Spaces & Tabs {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set modelines=1
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
filetype indent on
filetype plugin on
set autoindent
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
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ag
nnoremap <leader>1 :set number!<CR>
vnoremap <leader>y "+y
inoremap jk <esc>

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|node_modules/|target/|\.(o|swp|pyc|egg)$'
" }}}
" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
" }}}
" L aunch Config {{{
runtime! debian.vim
set nocompatible
call pathogen#infect()
" }}}
" AutoGroups {{{
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
" strips trailing whitespace at the end of files. this
"  " is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  "  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
function! <SID>CleanFile()
  "Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  "  " Do the business:
  %!git stripspace
  "  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "r"
    let c = "["
  endif
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"  " }}}
"  " vim:foldmethod=marker:foldlevel=0
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
