" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-git'
Plugin 'dominikduda/vim_current_word'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'stephpy/vim-yaml'
Plugin 'kana/vim-arpeggio'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'slim-template/vim-slim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-syntastic/syntastic'
Plugin 'preservim/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'git@github.com:Valloric/YouCompleteMe'
Plugin 'towolf/vim-helm'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'frazrepo/vim-rainbow'
"Plugin 'git@github.com:ajh17/VimCompletesMe'
"Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-rake'
"Plugin 'tpope/vim-markdown'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'edkolev/tmuxline.vim' "leave this commented out unless changing theme
"Plugin 'pgr0ss/vimux-ruby-test'
"Plugin 'rking/ag.vim'
"Plugin 'vim-scripts/ruby-matchit'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'groenewege/vim-less'
"Plugin 'mtscout6/vim-cjsx'
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'kylef/apiblueprint.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'kchmck/vim-coffee-script'
call vundle#end()            " required

" set 256 colors
set t_Co=256

color muon
let g:rainbow_active = 1
" Make the mouse (*gasp*) usable on large screens
"if has("mouse_sgr")
"    set ttymouse=sgr
"else
"    set ttymouse=xterm2
"end
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set colorcolumn=81

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

set encoding=utf-8
set expandtab

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" This stops Vim from redrawing the screen during complex operations and results
" in much smoother looking plugins.
set lazyredraw

" Always display the status line, even if only one window is displayed
set laststatus=2

" display unprintable characters
set list

" Use textmate-style whitespace characters
set listchars=tab:▸\ ,eol:¬

" Enable use of the mouse for all modes - helpful for resizing buffers
set mouse=a

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" show line numbers by default
set relativenumber
set number

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Add git branch to statusline
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" INDENTATION OPTIONS
" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set shiftwidth=2 " normal mode indentation commands use 2 spaces

set showtabline=2 " always show tab bar

" enables bash aliases from vim shell
set shell=zsh
" this allows you to use bash aliases from the vim shell
" sadly, it breaks fugitive's git patch which is really nice
" set shellcmdflag=-ic

" Show partial commands in the last line of the screen
set showcmd
" case-sensitive search if any caps
set smartcase
" spell check comments
set spell
" if opening a file from :ls, :buffers, :files, etc. jump to open version
" of the file, if one exists
set switchbuf=useopen
" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=
" Allow an unusually high tab limit - helpful for ':tab ball' with a huge
" buffer list
set tabpagemax=200
" Use visual bell instead of beeping when doing something wrong
set visualbell

" Better command-line completion
set wildmenu
set wildmode=longest,list,full
"set ttyfast " faster redrawing
" FROM github
" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" shortcut to save
nmap <leader>, :w<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"if exists('$TMUX')  " Support resizing in tmux
"  set ttymouse=xterm2
"endif
if !has('nvim')
  set ttymouse=xterm2
endif
" Fix Cursor in TMUX
set guicursor=
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=1\x7"
endif
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
"else
"    let &t_SI = "\e[1 q"
"    let &t_EI = "\e[1 q"
"endif
let mapleader = ","

" Use ctrl-[hjkl] to move focus between splits!
" NOTE: https://github.com/christoomey/vim-tmux-navigator now takes care of this
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v<C-w>w

" save left pinky - map minus sign to colon!
nore - :

" Gitv settings:
" do not allow gitv to generate control key mappings
" as these collide with the above
let g:Gitv_DoNotMapCtrlKey = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" manage working dir:  the nearest ancestor that contains a .git
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_height = 90
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:90,results:90'

" tells snipmate to only use custom snippets
let g:snippets_dir = "~/.vim/snippets"

" used patched fonts for airline arrows/triangles
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_theme='molokai'

" quickly clear highlights
map <leader>n :noh<CR>

" quickly close quickfix
map <leader>C :ccl<CR><CR>

" quickly open a new tab
map <leader>t :tabnew<CR>

" no more pesky escape (for insert and visual mode)
imap kj <Esc>
imap kJ <Esc>
imap Kj <Esc>
imap KJ <Esc>

nmap <leader><space> :call whitespace#strip_trailing()<CR>

set clipboard=unnamed

" reload files when they change on disk (e.g., git checkout)
set autoread

" highlight whitespace symbols
hi NonText ctermfg=240 guifg=#666666

" trailing whitespace intentional
map <leader>a :Ack! 

nmap <leader>p :CtrlPClearAllCaches<CR>

nmap <leader>ga :Gadd<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gco :!git checkout

" Golang stuff
nmap <leader>go :GoRun<CR>
nmap <leader>do :GoInstallBinaries<CR>
nmap <leader>db :GoBuild<CR>
" show only the current window and expand folds (handy after :Gdiff)
nmap <leader>o zR <bar> :only<CR><CR>

map <silent> <leader>so :source ~/.config/nvim/init.vim<CR>
map <leader>ev :tabedit ~/.vimrc<CR>
map <leader>et :tabedit ~/.tmux.conf<CR>
map <leader>ec :edit .<CR>
map <leader>df :tabedit ~/dotfiles/<CR>
map <leader>bs :! ~/dotfiles/bootstrap.sh<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" green/red diffs
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

" Current line customization
" high light current line in insert mode
" Enable CursorLine
set cursorline
autocmd InsertEnter * highlight  CursorLine ctermbg=236 ctermfg=None
autocmd InsertLeave * highlight  CursorLine ctermbg=235 ctermfg=None

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Open vimux pane
map <Leader>vo :VimuxTogglePane<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
"
" Function to make tmux zoom its runner pane.
function! VimuxZoomRunner()
  call VimuxInspectRunner()
  call system("tmux resize-pane -Z")
endfunction

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>z :call VimuxZoomRunner()<CR>

" Chords
call arpeggio#map('n', '', 0, 'ga', ':Gwrite<CR>')
call arpeggio#map('n', '', 0, 'gs', ':Gstatus<CR>')
call arpeggio#map('n', '', 0, 'gd', ':Gdiff<CR>')
call arpeggio#map('n', '', 0, 'gc', ':Gcommit<CR>')
call arpeggio#map('n', '', 0, 'gb', ':Gblame<CR>')


call arpeggio#map('n', '', 0, 'go', ':GoRun<CR>')

call arpeggio#map('n', '', 0, 'T', ':tabnew<CR>')
call arpeggio#map('n', '', 0, 'N', ':tabn<CR>')

call arpeggio#map('n', '', 0, 'ack', ':Ack<CR>')

call arpeggio#map('n', '', 0, 'vp', ':VimuxPromptCommand<CR>')
call arpeggio#map('n', '', 0, 'vi', ':call VimuxRunCommand("clear;")<CR>')
call arpeggio#map('n', '', 0, 'vl', ':VimuxRunLastCommand<CR>')
call arpeggio#map('n', '', 0, 'vx', ':VVimuxInterruptRunner<CR>')
call arpeggio#map('n', '', 0, 'vq', ':VimuxCloseRunner<CR>')

" Ugh, vim 7.4 doesn't indent the following by default - breaks shit
let g:html_indent_inctags = "html,body,head,tbody"

" use html highlighting for ejs
au BufNewFile,BufRead *.ejs set filetype=html

" golang stuff
autocmd FileType go setlocal nolist tabstop=4 shiftwidth=4 expandtab softtabstop=4

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
" terraform stuff
autocmd FileType go setlocal nolist tabstop=4 shiftwidth=4 expandtab softtabstop=4
" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"

call plug#begin('~/.vim/plugged')
Plug 'psliwka/vim-smoothie'
Plug 'juliosueiras/vim-terraform-completion'
"Plug 'yuttie/comfortable-motion.vim'
" Initialize plugin system
call plug#end()


"Terraform stuff
let g:terraform_fmt_on_save=1
let g:terraform_align=1
"let g:terraform_fold_sections=1


"Yaml stuff
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
let g:github_enterprise_urls = ['https://github.com']

"Jenkinsfile support
autocmd BufNewFile,BufRead *Jenkinsfile setf groovy
autocmd BufNewFile,BufRead  *Jenkinsfile setlocal nolist tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd FileType groovy setlocal nolist tabstop=4 shiftwidth=4 expandtab softtabstop=4

" golang
let g:go_highlight_types = 1

let g:vim_current_word#enabled = 1
