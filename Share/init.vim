" ==================== GENERAL SETTINGS ====================
" Autor LAWRENCE

" Basic settings
filetype plugin indent on
syntax on
"Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
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
" Coc.nvim (you need extensions)
let g:coc_global_extensions = [ 'coc-snippets', 'coc-json', 'coc-java', 'coc-sh', 'coc-python', 'coc-clangd', 'coc-tsserver' ]

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <enter> coc#pum#visible() ? coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <C-right> :call ShowDocumentation()<CR>
inoremap <expr> <C-right> ShowAction("\<Esc>:call ShowDocumentation()\<CR>")

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! ShowAction(argv)
  if mode() =~# '^[iR]'
    return a:argv
  else
    return
  endif
endfunction

"Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <C><tab> coc#refresh()
else
  inoremap <silent><expr> <C><tab> coc#refresh()
endif

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

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

" Mapps

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :call fzf#vim#maps('n', 0)<CR>
nmap <Leader>s :call EasyMotion#T(-1,0,0)<CR>
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <C-d> :q!<CR>
map <Leader>u :vnew<CR>
map <Leader>z :u<CR>
map <c-delete> :d<insert>
nnoremap <Leader>t :below terminal<CR>
:tnoremap <Esc> <C-\><C-n>
inoremap \\ *
inoremap <C-l> public static void main(String[] args)

imap <expr> <c-w> ShowAction("\<Esc>:w\<CR>")
imap <expr> <c-s> ShowAction("\<Esc>:call EasyMotion#T(-1,0,0)<CR>")
imap <expr> <c-m> ShowAction("\<Esc>:call fzf#vim#maps('n', 0)<CR>")
imap <expr> <c-n> ShowAction("\<Esc>:NERDTreeToggle<CR>")
imap <expr> <c-q> ShowAction("\<Esc>:q<CR>")
imap <expr> <c-d> ShowAction("\<Esc>:q!<CR>")
imap <expr> <c-u> ShowAction("\<Esc>:vnew<CR>")
imap <expr> <c-z> ShowAction("\<Esc>:u<CR>")
imap <expr> <c-t> ShowAction("\<Esc>:below terminal<CR>")
imap <expr> <c-delete> ShowAction("\<Esc>:d<insert>")

" Welcome message
echo "U M B R E L L A:  Configuration Sucessfully!"
