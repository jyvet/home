set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"-------[ VIM INTERFACE ]-----------------------------------------------------"

set background=dark
let g:airline#extensions#tabline#enabled = 1 " Enabling tabline with
set laststatus=2                             " display statusline all
set timeoutlen=1000                          " timeout for shortcuts
set noshowmode                               " remove " -- MODE -- "
set t_Co=256                                 " Enable 256 colors in t
let g:airline_powerline_fonts = 1            " To disable if fonts no
let g:airline_theme='powerlineish'

" For fonts 'Plugin'
" " 1. Download plugin with vundle
" " 2. go to ~/.vim/bundle/fonts and run ./install.sh
" " 3. change font terminal with one recently uploaded (eg: Inconsolata
" " 4. Enjoy !
Plugin 'powerline/fonts'            " Powerline fonts for smooth char
Plugin 'bling/vim-airline'          " Displaying smooth statusline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'     " Download huge bunchs of themes
Plugin 'ervandew/supertab'          " Used for YCM and ultisnips compatibility


"-------[ AUTOCOMPLETE ]------------------------------------------------------"

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
let g:clang_library_path='/usr/lib/llvm-3.5/lib'  " Set path to clang lib
let g:ycm_confirm_extra_conf = 0
set backspace=indent,eol,start      " Make backspace work again

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

"autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|silent! pclose|endif
"autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]" |silent! pclose|endif


"-------[ SYNTAX CHECKER ]----------------------------------------------------"

Plugin 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"-------[ FILE SEARCH ]-------------------------------------------------------"
"
" Unite
"   depend on vimproc
"   ------------- VERY IMPORTANT ------------
"   you have to go to .vim/bundle/vimproc.vim and do a ./make
"   -----------------------------------------
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)


"-------[ WORD SEARCH ]-------------------------------------------------------"

Plugin 'rking/ag.vim'

" --- type ° to search the word in all files in the current dir
nmap ù :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag


"-------[ NERDTREE ]----------------------------------------------------------"

let g:nerdtree_tabs_open_on_console_startup = 0 " Disable on startup
let g:nerdtree_tabs_open_on_gui_startup = 0     " Disable on gui startup
let g:nerdtree_tabs_autoclose = 1               " Close when last window
let g:nerdtree_tabs_synchronize_view = 0        " sync Tree between tab
let g:nerdtree_tabs_smart_startup_focus = 1     " Keep focus on desired window
let NERDTreeShowBookmarks = 1                   " Enable bookmarks displaying by default
Plugin 'scrooloose/nerdtree'                    " Standard NERDTree
Plugin 'jistr/vim-nerdtree-tabs'                " Extended NERDTree w/ tabs handling


"-------[ COMMENTER ]---------------------------------------------------------"
"
" Comment code
"    [count],c<space>  Toggles the comment state of the selected line(s).
Plugin 'scrooloose/nerdcommenter'            " Commenter
let mapleader=","
set timeout timeoutlen=1500


"-------[ SNIPPETS ]----------------------------------------------------------"

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plugin 'honza/vim-snippets'                  " snippets files (support both ultisnips and snipMate)



Plugin 'L9'
Plugin 'Markdown'
Plugin 'FuzzyFinder'

" The following are examples of different formats supported.
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required


"-------[ GIT ]---------------------------------------------------------------"

Plugin 'airblade/vim-gitgutter'              " Show code change since last commit


"-------[ LINE NUMBERS ]---------------------------------------------------------"

set number                                   " Display line numbers
nmap <silent> <C-W> :set relativenumber!<CR> " Toggle absolute/relative count


"-------[ INTERFACE ]---------------------------------------------------------"

set mouse=a                               " Activate mouse support
set cursorline                            " Highlight current line

set modelines=0
set clipboard=unnamed
set synmaxcol=128
set colorcolumn=80                        " Set max column number
set ttyscroll=10
set fileencodings=utf-8                   " Use UTF8 for new files
set wrap                                  " Automatic line wrapping
set tabstop=4 shiftwidth=4 expandtab      " Expand tab to spaces
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

colo hybrid
syntax on

map <F2> :retab <CR> :wq! <CR>
set pastetoggle=<F10>                     " Activate/desactivate paste mode


"-------[ HIGHLIGHT TAB ]-----------------------------------------------------"

syntax match Tab "\t"
hi Tab ctermbg=DarkMagenta guibg=DarkMagenta


"-------[ HIGHLIGHT TRAILING WHITESPACE ]-------------------------------------"

syntax match ExtraWhitespace /\s\+$/
hi ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * 2match Tab "\t"
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * 2match Tab /\t\+\%#\@<!/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * 2match Tab "\t"
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
     %s/\s\+$//e
endfunction

autocmd BufWritePre * :%s/\s\+$//e       " Remove trailing spaces when saving

"Misc overwrites of default color highlighting.
"hi Comment ctermfg=DarkGreen
"hi String ctermfg=DarkMagenta


"-------[ NAVIGATION ]--------------------------------------------------------"

"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
