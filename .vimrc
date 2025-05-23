" key mappings
let mapleader = ","
nmap <leader>= :t.\|s/./=/g\|noh<CR>
nmap <leader>- :t.\|s/./-/g\|noh<CR>
nmap <leader>` :%s/<pre .*">/```\r/g\|%s&</pre>&\r```&g<CR>
nmap <leader>d :%s/<div>//g\|%s&</div>&&g<CR>

set number
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set ignorecase
set vb t_vb=
set autoindent

autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

filetype plugin indent on

syntax enable

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! Ds call s:DiffWithSaved()
