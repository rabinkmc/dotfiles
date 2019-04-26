set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required

filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ

let mapleader="\<Space>"

"rapid editing 
nmap <leader>vr :sp $MYVIMRC<cr>	
nmap <leader>so :source $MYVIMRC<cr>

"saving like in other editors
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>

"jk or kj used to go to normal mode from insert mode
imap jk <esc>
imap kj <esc>


set number
set scrolloff=4
set ruler
set showcmd
set updatetime=500				
set backspace=indent,eol,start
let g:tex_flavor='latex'

"tex mappings 
"latex-live-preview displaying latex document live preview
autocmd FileType tex  nnoremap Gl :!<Space>:LLPStartPreview

"c++ mappings
autocmd FileType cpp nnoremap <Space>go :!<Space>g++<Space>-o<Space>"%:r"<Space>"%:t"<Enter><Enter> 
autocmd FileType cpp nnoremap <Space>run :!<Space>./"%:r"<Enter>

"python mappings
nmap <Space>py :!<Space>python<Space>"%:t"<Enter>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map Q :q!<Enter>

"fast saving of buffer
nmap <leader>w :w!<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"insert the current date 
iab xdate <c-r>=strftime("%d/%m/%y")<cr>

map <leader>jk :!<Space>xmodmap<Space>~/.speedswapper<Enter><Enter>
map <leader>tr :r ~/Templates/startpage.tex<Enter>i
map <leader>di :!<Space>dict<Space>-d<Space>gcide<Space>
map <leader>pd :!<Space>pandoc<Space>-s<Space>-o<Space>"%:r".pdf<Space>"%:t"<Enter><Enter>
map <leader>pde :!<Space>evince<Space>"%:r".pdf<Enter>
