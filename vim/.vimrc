syntax on
set number
set nocompatible
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsEditSplit = "vertical"
inoremap <c-x><c-k> <c-x><c-k>
let g:indent_guides_auto_colors = 0
" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

" Colors {{{
syntax enable " enable syntax processing
colorscheme Monokai
"set background=dark
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set modelines=1
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
filetype indent on
filetype plugin on
set autoindent
let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict'
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k
" }}}
" UI Layout {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu
"set lazyredraw
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
"nnoremap B ^
"nnoremap E $
"nnoremap $ <nop>
"nnoremap ^ <nop>
"nnoremap gV `[v`]
"onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
"xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
"onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
"xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
"onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
"xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
"onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
"xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
"  }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
"nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>

"#### Go Language ####
let g:neocomplete#enable_at_startup = 1
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}
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
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
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
autocmd BufEnter *.sh,*.rb setlocal tabstop=2
autocmd BufEnter *.sh,*.rb setlocal shiftwidth=2
autocmd BufEnter *.sh,*.rb setlocal softtabstop=2
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
" Custom Functions {{{
function! ToggleNumber()
if(&relativenumber == 1)
set norelativenumber
set number
else
set relativenumber
endif
endfunc
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
