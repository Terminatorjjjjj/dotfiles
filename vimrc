set nocompatible " must be first

set runtimepath^=~/.vim/bundle/tabular
set runtimepath^=~/.vim/bundle/vim-easy-align

set ai
set backspace=2
set smartindent
set tabstop=3
set shiftwidth=3
set expandtab
set mouse=a
set autochdir
set cursorline
set formatoptions-=t " disable linebreak word wrap in insert mode
set history=50
set ruler
set showcmd
set incsearch

set number relativenumber
augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

syntax enable
colorscheme monokai
set guifont=Consolos:h16

autocmd BufNewFile,BufRead *.v,*.sv,*.vs,*.svh setf=verilog
autocmd BufNewFile,BufRead *.v,*.sv,*.vs,*.svh set syntax=verilog

augroup comment
   autocmd!
   autocmd FileType c,cpp,java,scala,verilog let b:comment_leader = '// '
   autocmd FileType sh,ruby,python,make      let b:comment_leader = '# '
   autocmd FileType tex,matlab               let b:comment_leader = '% '
   autocmd FileType vim                      let b:comment_leader = '" '
augroup END
noremap <silent> cc :<C-B>silent <C-E>s/^/<C-R>escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> cc :<C-B>silent <C-E>s/^\V/<C-R>escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

set laststatus=2
set statusline=
set statusline+=%1*\ %y     " file type
set statusline+=%2*\ %.50F  " full file path
set statusline+=%2*\ %r\ %m " read only, modified
set statusline+=%=
set statusline+=%3*\ %p%%
set statusline+=%3*\ [%c:%l/%L]

inoremap jj <Esc>

