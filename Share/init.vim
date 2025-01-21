"     CONFIGURATION UMBRELLA
"     AUTOR; LAWRENCE

colorscheme sorbet
set autoindent
set tabstop=2
set mouse=in
set expandtab
set shiftwidth=2
set relativenumber number
set bg=dark
set list lcs=leadmultispace:>☣,multispace:---+---+--,trail:-
"set list listchars=tab:>☣,trail:-,multispace:---+---+--,space:…,leadmultispace:---+
set showmatch
set laststatus=2
set signcolumn=yes
set syntax=tmux
syntax on

" ############### PLUGINSTALL #################
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

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

"
let g:indentLine_fileTypeExclude = ['text', 'help', 'txt']
"let g:indentLine_bufNameExclude = ['NERD_tree.*']

" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"
"
let NERDTreeQuitOnOpen=1
let mapleader=" "


inoremap \\ *
inoremap <C-l> public static void main(String[] args)

:hi Comment  guifg=#595959 "gui=strikethrough

"================ PopUp ======================
vmenu PopUp.Cut                     "x
vmenu PopUp.Copy                    "c
xmenu PopUp.Paste                   "p
xmenu PopUp.Delete                  "d

" ================ Cursor Position ======================
nnoremap <Leader><TAB> :<C-U>TmuxNavigatePrevious<CR>
nnoremap <Leader>c :<C-U>call multiple_cursors#new('v', 1)<CR>

" ================ SIZE VIM ======================
noremap <Leader><RIGHT> 10<C-w>>
noremap <Leader><LEFT> 10<C-w><
" =============== SAVE / EXIT ====================
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <C-d> :q!<CR>
map <Leader>u :vnew<CR>
map <Leader>z :u<CR>
"9
nmap <Leader>m :call fzf#vim#maps('n', 0)<CR>
nmap <Leader>s :call EasyMotion#T(-1,0,0)<CR>
map <Leader>b :Buffers<CR>
" ================ RUN FILE =====================
nmap <Leader>x :!node %<cr>
" ============= OPEN NERDTREE ===================
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>n :NERDTreeToggle<CR>
" ============= OPEN TERMINAL ===================
nnoremap <Leader>t :below terminal<CR>
:tnoremap <Esc> <C-\><C-n>

" ================= INDENTATE ===================

let g:indentLine_color_gui = '#556b2f'
"let g:indentLine_color_term = 99
let g:indentLine_char_list = ['⁞','⁑','╏','┃','┋']

" ============ SETTINGS PLUG VIM-COC ============
inoremap <silent><expr> <enter> coc#pum#visible() ? coc#pum#confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
else
      inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_global_extensions = ['coc-json', 'coc-java', 'coc-sh']
