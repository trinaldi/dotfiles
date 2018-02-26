execute pathogen#infect()
set rtp+=~/.fzf
set runtimepath^=~/.vim/bundle/ctrlp.vim
syntax on
set hidden
set number
set nocompatible
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
endif
" for tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1
" " start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:esearch = {
  \ 'adapter':    'grep',
  \ 'backend':    'vim8',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = "vertical"
inoremap <c-x><c-k> <c-x><c-k>
let g:indent_guides_auto_colors = 0
" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
" Colors {{{
syntax enable " enable syntax processing
let base16colorspace=256
colorscheme base16-seti
set background=dark
set t_Co=256
set term=screen-256color
"set term=xterm
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
set colorcolumn=110
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
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
"  }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>l :call StripTrailingWhitespaces()<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
vnoremap <leader>y "+y
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>

" Powerline {{{
"set encoding=utf-8
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
set laststatus=2
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
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
autocmd BufEnter *.sh,*.rb setlocal tabstop=2
autocmd BufEnter *.sh,*.rb setlocal shiftwidth=2
autocmd BufEnter *.sh,*.rb setlocal softtabstop=2
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
" Custom Functions {{{
function! RunTestFile()
if(&ft=='python')
exec ":!" . ". venv/bin/activate; nosetests " .bufname('%') . " --stop"
endif
endfunction
function! RunGoFile()
if(&ft=='go')
exec ":new|0read ! go run " . bufname('%')
endif
endfunction
function! RunTestsInFile()
if(&ft=='php')
:execute "!" . "/Users/dblack/pear/bin/phpunit -d memory_limit=512M -c
/usr/local/twilio/src/php/tests/config.xml --bootstrap
/usr/local/twilio/src/php/tests/bootstrap.php " . bufname('%') . ' \| grep
-v Configuration \| egrep -v "^$" '
 elseif(&ft=='go')
 exec ":!gp test"
 elseif(&ft=='python')
 exec ":read !" . ". venv/bin/activate; nosetests " . bufname('%') . "
 --nocapture"
 endif
 endfunction
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

" YouCompleteMe
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"set tags+=./.tags
" Airline
 if !exists('g:airline_symbols')
   let g:airline_symbols = {}
 endif
 " unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 let g:airline_symbols.crypt = '🔒'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.whitespace = 'Ξ'
 " powerline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''
 " old vim-powerline symbols
 let g:airline_left_sep = '⮀'
 let g:airline_left_alt_sep = '⮁'
 let g:airline_right_sep = '⮂'
 let g:airline_right_alt_sep = '⮃'
 let g:airline_symbols.branch = '⭠'
 let g:airline_symbols.readonly = '⭤'
 let g:airline_symbols.linenr = '⭡'
 let g:jsx_ext_required = 0
 let g:xml_syntax_folding = 1
 let g:javascript_plugin_jsdoc = 1
 let g:user_emmet_mode='a'
 let g:user_emmet_leader_key='<C-Z>'
set runtimepath^=~/.vim/bundle/ag
