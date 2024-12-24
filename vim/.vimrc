execut pathogen#infect()
let g:deoplete#enable_at_startup = 1
let base16colorspace=256
colorscheme onedark
hi Normal ctermbg=0
let g:airline_theme='base16'
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
syntax on
set background=dark
set updatetime=100
vnoremap <leader>p "_dP"
set swapfile
set dir=~/.swap-files

filetype plugin indent on

if has('termguicolors')
  set termguicolors
endif

set hidden
set relativenumber

" transparent bg
" " For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE"
    autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
hi LineNr term=bold cterm=bold ctermfg=20
hi CursorLine cterm=none ctermbg=20
hi CursorLineNr term=bold cterm=bold ctermfg=255
hi Comment ctermfg=20 ctermbg=none cterm=italic
hi ColorColumn ctermbg=8
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set nocompatible
set nofixendofline
set nobackup
set nowb
set noswapfile

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Vertical Gdiff
set diffopt+=vertical

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

filetype indent on
filetype plugin on
autocmd FileType c setlocal shiftwidth=8 softtabstop=8 expandtab
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" UI Layout
set showcmd
set cursorline
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
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>
nnoremap <leader>a :TestSuite<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>g :TestVisit<CR>
silent! map <F6> :call RunNearestSpec()<CR>
silent! map <F7> :call RunCurrentSpecFile()<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ack
autocmd FileType go nnoremap <leader>t :GoTest<CR>
vnoremap <leader>y "+y
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
inoremap jk <esc>
nnoremap bd :bd<CR>

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

function RspecOnLine()
  !rspec %
endfunction

" JS Cleanup
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"Workspace
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_create_new_tabs = 0

" Indent Guide
let g:indent_guides_start_level = 2
let indent_guides_guide_size = 1


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

" Ack.vim
set runtimepath^=~/.vim/bundle/ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" air-line
" required if using https://github.com/bling/vim-airline
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#cursormode#enabled=0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_statusline_ontop = 0
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

" Go/golang specific settings. Works for any programming language other than Go
" at this time.
autocmd BufEnter *.go  setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=80 noexpandtab cindent cinoptions=:0,l1,t0,g0,(0,W8 filetype=go

let g:vim_jsx_pretty_highlight_close_tag = 1

let g:fixmyjs_use_local = 1

noremap <Leader><Leader>l :ALELint<CR>
noremap <Leader><Leader>f :ALEFix<CR>
noremap <Leader><Leader>d :ALEGoToDefinition<CR>
noremap <Leader><Leader>h :ALEHover<CR>
set ballooneval
set balloonevalterm
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_set_balloons = 1
let g:ale_set_loclist = 1
"
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint', 'prettier'],
      \   'typescript': ['prettier', 'eslint'],
      \   'python': ['black', 'autopep8'],
      \   'rust': ['rustfmt']
      \ }

let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'python': ['flake8', 'pylint'],
      \   'typescript': ['prettier','tsserver','eslint'],
      \   'javascript': ['eslint', 'prettier'],
      \   'rust': ['analyzer']
      \}
hi SpellBad cterm=underline ctermfg=red ctermbg=NONE
let g:ale_sign_error = 'E' " Less aggressive than the default '>>'
let g:ale_sign_warning = 'W'
let g:ale_sign_info = 'i'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1

" Svelte
let g:vim_svelte_plugin_load_full_syntax = 1

" vim-ruby indent
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'hanging'
let g:ruby_indent_hanging_elements = 1
let ruby_operators        = 1
let ruby_pseudo_operators = 1
let ruby_space_errors = 1
let ruby_line_continuation_error = 1
let ruby_global_variable_error   = 1

" Python Development
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Rust Development
let g:rustfmt_autosave = 1
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" javascript import
let g:vim_javascript_imports_map = '<Leader>e'

" vim-snippets
" Specify the snippet directories
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'vim-snippets']

" Trigger key for expanding snippets
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Enable UltiSnips in all filetypes
autocmd FileType * UltiSnipsAddFiletypes all

command! Snippets call fzf#run({
      \ 'source': 'find ~/.vim/bundle/vim-snippets -name "*.snippets" -print',
      \ 'sink':   'e',
      \ 'options': '--preview "cat {} | head -n 20"'
      \ })
