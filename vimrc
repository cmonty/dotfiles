" Setup
set nocompatible
filetype off

if &shell == "/usr/bin/sudosh"
  set shell=/bin/bash
endif

" Use pathogen to load bundles
call pathogen#incubate()
call pathogen#helptags()

filetype plugin indent on

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Pretty colors for fuzzyfinder menus
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=white

" Options
compiler ruby

syntax on
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set nopaste
set hidden
set wildmode=longest,list
set wildmenu
set wildignore+=.git,*.pyc,.DS_Store
set visualbell
set ttyfast
set ruler
set number
set backspace=indent,eol,start
set laststatus=1
set showbreak=↪
set t_Co=256

" Security
set modelines=0

" Tabs/spaces
set nosmartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set dir=/tmp//

" Searching
set hlsearch
set ignorecase
set smartcase
set showmatch
set incsearch
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Soft/hard wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" backup to ~/.tmp
set nobackup
set nowritebackup
set noswapfile

" Color
set background=dark
colorscheme Tomorrow-Night

" File Types
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead rebar.config set filetype=erlang
au BufNewFile,BufRead *.mustache setf mustache
au BufNewFile,BufRead *.txt set filetype=markdown
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78
au FileType diff colorscheme desert
au FileType git colorscheme desert
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal textwidth=78
autocmd FileType ruby runtime ruby_mappings.vim

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Folding
set foldmethod=indent
set foldlevel=2
set nofoldenable

" Plugin options
"
" " Vimux
let VimuxUseNearestPane = 1
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" " Ack
let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

" " VimClojure
let vimclojure#WantNailgun = 0
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let coffee_no_trailing_space_error = 1

let NERDTreeIgnore=['\.pyc']

" Navigation Shortcuts
" Easier split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" " Alternate Files
map <leader>aa :A<CR>
map <leader>as :AS<CR>
map <leader>av :AV<CR>

" " CommandP
map <leader>ff :CtrlP<Enter>
map <leader>fb :CtrlPBuffer<Enter>
map <leader>fr :CtrlPClearAllCaches<Enter>

" " Create window splits easier. The default
" " way is Ctrl-w,v and Ctrl-w,s. I remap
" " this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Coding shortcuts
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>

" TComment
map <leader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>

" " Prompt for a command to run
map <Leader>vp :PromptVimTmuxCommand<CR>

" " Run last command executed by RunVimTmuxCommand
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rf :RunRubyFocusedTest<CR>
map <Leader>rb :RunAllRubyTests<CR>
map <Leader>rc :RunRubyFocusedContext<CR>

" " Inspect runner pane
map <Leader>vi :InspectVimTmuxRunner<CR>

" " Close all other tmux panes in current window
map <Leader>vx :CloseVimTmuxPanes<CR>

" " Interrupt any command running in the runner pane
map <Leader>ve :InterruptVimTmuxRunner<CR>

vmap <LocalLeader>vs "vy :call RunVimTmuxCommand(@v . "\n", 0)<CR>

" NerdTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>

" Clear highlight
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>bd :bufdo :bd<CR>

" Git Grep Word
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

" Clear whitespace
nnoremap <silent> <Leader>cw :Trim<CR>

nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>

command SudoW w !sudo tee %
cnoremap <Tab> <C-L><C-D>

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Functions
function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()

function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
