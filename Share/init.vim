"  ==================== GENERAL SETTINGS ====================
" Autor LAWRENCE

" Basic settings
filetype plugin indent on
syntax on

" Settings interface
colorscheme sorbet
set background=dark
set number relativenumber number
set laststatus=2
set signcolumn=yes
set showmatch
set termguicolors
if &termguicolors
  let s:termguicolors = 1
else
  let s:termguicolors = 0
endif
" Settings indent & tabs
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=leadmultispace:>☣,multispace:---+---+--,nbsp:+,trail:-
" Setting mouse
set mouse=a
" Setting search
set ignorecase
set smartcase
" Settings buffera & windows
set hidden
set splitright
set splitbelow

":au! CursorHold
":au! CursorHoldI
":au! CursorMoved
":au! CursorMovedI
" ==================== PLUGINS ====================
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'yggdroot/indentline'
"Plug 'valloric/youcompleteme'
Plug 'glepnir/oceanic-material'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

Plug 'w0rp/ale'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" ==================== PLUGIN CONFIGURATION ====================
" Coc.nvim (autocompleteme)
let g:coc_global_extensions = [ 'coc-snippets', 'coc-json', 'coc-java', 'coc-sh', 'coc-python', 'coc-clangd', 'coc-tsserver' ]

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <right> coc#pum#visible() ? coc#pum#info() .coc#pum#scroll(0) : "\<right>"
nnoremap <silent> <C-j> :call coc#float#scroll(1)<CR>
nnoremap <silent> <C-k> :call coc#float#scroll(0)<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <enter> coc#pum#visible() ? coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

:hi Comment  guifg=#595959
let NERDTreeQuitOnOpen=1
let mapleader=" "
let g:indentLine_color_gui = '#556b2f'
let g:indentLine_char_list = ['⁞','⁑','╏','┃','┋']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :call fzf#vim#maps('n', 0)<CR>
nmap <Leader>s :call EasyMotion#T(-1,0,0)<CR>
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <C-d> :q!<CR>
map <Leader>u :vnew<CR>
map <Leader>z :u<CR>
nnoremap <Leader>t :below terminal<CR>
:tnoremap <Esc> <C-\><C-n>
inoremap \\ *
inoremap <C-l> public static void main(String[] args)
echo "U M B R E L L A:  Configuration Sucessfully!"
