set tabstop=2
set mouse=r
"Indentate
set autoindent " autoindent always on
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set encoding=utf-8          " always use unicode
set ignorecase              " to ignore case in searchs
set number relativenumber   " Relative numbers for jumping
set showmatch      " higlight matching parentheses and brackets
syntax enable
set laststatus=2 "Name file in barr status
set bg=dark
set list listchars=tab:>☣,trail:-,multispace:---+---+--,space:…,leadmultispace:---+
"     listchars = ['•‣','☣','☢','☠','…','⁂','❃','✮','❀','✿','✲','❈','❉','❁']
colorscheme zaibatsu


" ============== PLUGINS FOR VIM ==============
" ### MORE PLUGS FOR INSTALL ###
" Plug 'alvan/vim-closetag'       "completa etiquetas de html
" Plug 'tpope/vim-surround'       "envuelve una variable con algun signo
" Plug 'junegunn/fzf'             "buacar archivos de textos dentro de archivos
" Plug 'mhinz/vim-signify'        "agrega un signo de + o - cuando agregems una linea
" Plug 'scrooloose/nerdcommenter' "para convertir una li    nea en comentario
" =============================================
" ############### PLUGINSTALL #################
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'          " SINTAXS RESALT FOR LENGUAGES PYTHON
Plug 'maximbaz/lightline-ale'        " STATUS BAR
Plug 'itchyny/lightline.vim'         " COMPLETHEME OF STATUS BAR
Plug 'jiangmiao/auto-pairs'          " COMPLETE AN [] () '' {}
Plug 'benmills/vimux'                " SEND INSTRUCTIONS AN OTHERS PANELS
"autocomplete
Plug 'sirver/ultisnips'              " CURSOR INSIDE OF THE SIGNES ()
" ####### TEST ########
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'
Plug 'editorconfig/editorconfig-vim' " DO TWO TAB SPACE
Plug 'junegunn/fzf'                  " FIND SEARCH FILES OF TEXT INSIDE OF DIRECTORY
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'  " MULTIPLE CURSOR
Plug 'yggdroot/indentline'           " INDENT LINE OF CODIGO
Plug 'glepnir/oceanic-material'
" ######## THEME #######
Plug 'morhetz/gruvbox'               " THEME
Plug 'shinchu/lightline-gruvbox.vim' " COMPLETHEME
" ======== IDE ========
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'           " LEADER SPACE nt = ONE WINDOW
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'
Plug 'vim-python/python-syntax'
Plug 'valloric/youcompleteme'

call plug#end()


let NERDTreeQuitOnOpen=1
let mapleader=" "

"================ PopUp ======================
vnoremenu PopUp.Cut                     "x
vnoremenu PopUp.Copy                    "c
vnoremenu PopUp.Paste                   "p
vnoremenu PopUp.Delete                  "d

" ================ Cursor Position ======================
nnoremap <Leader><TAB> :<C-U>TmuxNavigatePrevious<CR>
map <Leader>c :<C-U>call multiple_cursors#new('v', 1)<CR>

" ================ SIZE VIM ======================
nnoremap <Leader><RIGHT> 10<C-w>>
nnoremap <Leader><LEFT> 10<C-w><
" =============== SAVE / EXIT ====================
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-d> :q!<CR>
"9
nmap <Leader>m :call fzf#vim#maps('n', 0)<CR>
nmap <Leader>s :call EasyMotion#T(-1,0,0)<CR>
map <Leader>b :Buffers<CR>
" ================ RUN FILE =====================
nnoremap <Leader>x :!node %<cr>
" ============= OPEN NERDTREE ===================
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>n :NERDTreeToggle<CR>
" ============= OPEN TERMINAL ===================
nnoremap <Leader>t :belowright terminal<CR>
" ================= INDENTATE ===================

let g:indentLine_color_term = 126
let g:indentLine_char_list = ['⁞','⁑','╏','┃','┋']

"
" ============ SETTINGS PLUG VIM-COC ============
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction
