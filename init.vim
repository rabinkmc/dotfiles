set nocompatible              " be iMproved, required

set encoding=utf-8

" call plug#begin('home/rabind/.local/share/nvim/site/autoload/plug.vim')  
call plug#begin('~/.vim/plugged')  
Plug 'ervandew/supertab'
Plug 'puremourning/vimspector'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'

"if you don't have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()         

colorscheme gruvbox
" colorscheme industry
let mapleader="\<Space>"


set hidden
set noswapfile
set nohlsearch

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

map <A-j> <C-W>J
map <A-k> <C-W>K
map <A-h> <C-W>H
map <A-l> <C-W>L

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

nnoremap ff :GFiles<Cr>
nnoremap <leader>ff :Files<Cr>

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

let wiki_1 = {'path':'~/vimwiki', 'ext':'.md', 'syntax':'markdown', 'links_space_char':'_'} 
let wiki_2 = {'path':'~/coding', 'ext':'.md', 'syntax':'markdown', 'links_space_char':'_'} 
let wiki_3 = {'path':'~/django', 'ext':'.md', 'syntax':'markdown', 'links_space_char':'_'} 
let wiki_4 = {'path':'~/python', 'ext':'.md', 'syntax':'markdown', 'links_space_char':'_'} 
let wiki_5 = {'path':'~/dsa', 'ext':'.md', 'syntax':'markdown', 'links_space_char':'_'} 

let g:vimwiki_list = [wiki_1,wiki_2,wiki_3, wiki_4, wiki_5 ] 

let g:python3_host_prog = '/usr/bin/python3'

tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

nnoremap <F6> :NERDTreeToggle<CR>
" fzf custom 
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"coc setup 
let g:jedi#completions_enabled = 0
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver']


map <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
     \ }
