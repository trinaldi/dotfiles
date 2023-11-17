execut pathogen#infect()
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" " For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE"
    autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" let g:gruvbox_contrast_dark = 'soft'
" let g:gruvbox_bold=1
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_italic=1
" let g:gruvbox_termcolors=256
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
colorscheme material
autocmd VimEnter * ++nested colorscheme material
filetype plugin indent on
if has('termguicolors')
  set termguicolors
endif
syntax on
set background=dark
set hidden
set number
set nocompatible
set nofixendofline
set nobackup
set nowb
set noswapfile

" Show tabs and trailing spaces
set list
set lcs=tab:»_,trail:·

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

" Colors
" let g:gruvbox_transparent_bg = 1
" let g:gruvbox_italic = 1
" let g:srcery_italic = 1
" if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"  endif

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
silent! map <F6> :call RunNearestSpec()<CR>
silent! map <F7> :call RunCurrentSpecFile()<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ack
nnoremap <leader>t :GoTest<CR>
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
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
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
let g:airline_theme='material'
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
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
noremap <Leader><Leader>h :ALEHover<CR>
set ballooneval
set balloonevalterm
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_set_balloons = 1
let g:ale_set_loclist = 1
"
"let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \   'python': ['black', 'autopep8'],
      \ }

let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \   'rust': ['analyzer']
      \}
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc

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
