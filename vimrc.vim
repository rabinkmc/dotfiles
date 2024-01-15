set path=.,**
set wildmenu
set wildignore=node_modules,__pycache__/
colorscheme tokyonight-night
let mapleader=" "
nnoremap <leader>so :source ~/.config/nvim/init.lua<CR>

nnoremap <leader>vr :FZF ~/.config/nvim/<CR>
"fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! ModifiedFiles()
  call fzf#run({'source': 'git diff --name-only', 'sink': 'e', 'down': '40%'})
endfunction

filetype plugin indent on

nnoremap <leader>gf :GitFiles<CR>
nnoremap <leader>df :call ModifiedFiles()<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>cp :!cp -f % ~/Documents/upload.cpp<cr><cr>
set splitright
set splitbelow

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
