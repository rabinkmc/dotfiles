set nocompatible              " be iMproved, required
set encoding=utf-8

" call plug#begin('home/rabind/.local/share/nvim/site/autoload/plug.vim')  
call plug#begin('~/.vim/plugged')  
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'
Plug 'folke/tokyonight.nvim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()         


colorscheme dracula    
let mapleader=" "

" colorscheme dracula
set noswapfile
set nohlsearch
set mouse=a

"rapid editing 
nnoremap <leader>vr :sp $MYVIMRC<cr>	
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>

"jk or kj used to go to normal mode from insert mode

imap jk <esc>
imap kj <esc>

set relativenumber
set number
set scrolloff=4
set ruler
set showcmd
set updatetime=500				
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab


set splitright
set splitbelow

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"insert the current date 
iab xdate <c-r>=strftime("%d/%m/%y")<cr>



" better key bindings for UltiSnipsExpandTrigger

set clipboard+=unnamedplus

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
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
"
let g:coc_global_extensions = ['coc-prettier', 'coc-pyright', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json']


map <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


nnoremap <leader>ag :Ag<cr>
nnoremap <leader>ff :Files<cr>
nnoremap ff :GFiles<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>hh :History<cr>

nnoremap <leader>gs :Git<Cr>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vue set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python nnoremap <leader>fs :!black %<cr>
autocmd FileType python nnoremap <F6> :TestFile -k<cr>
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

let g:vimtex_view_method = 'zathura'
