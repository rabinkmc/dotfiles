set nocompatible              " be iMproved, required
set encoding=utf-8

call plug#begin('~/.vim/bundle')
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
call plug#end()            " required


let mapleader="\<Space>"

colorscheme iceberg

"rapid editing 
nmap <leader>vr :sp $MYVIMRC<cr>	
nmap <leader>so :source $MYVIMRC<cr>

"jk or kj used to go to normal mode from insert mode
imap jk <esc>
imap kj <esc>

syntax on 
set relativenumber
set number
set scrolloff=4
set ruler
set showcmd
set updatetime=500				
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map q :q!<Enter>

"fast saving of buffer
nmap <leader>w :w!<cr>

set splitright
set splitbelow

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"insert the current date 
iab xdate <c-r>=strftime("%d/%m/%y")<cr>


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0

set clipboard+=unnamedplus

nnoremap ff :FZF<Cr>
nnoremap <C-N> :NERDTree<Cr>
nnoremap <F6> :NERDTreeToggle<Cr>
noremap <leader>fo :Goyo<Cr>

let g:limelight_conceal_ctermfg = 'gray'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

set conceallevel=1
set linebreak
set textwidth=72
let g:tex_conceal='abdmg'

hi Conceal ctermbg=NONE
hi Conceal ctermfg=NONE
"hi LineNr ctermfg=NONE
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
nnoremap <leader>us :UltiSnipsEdit<Enter>


