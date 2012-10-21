if $COLORTERM == 'rxvt-xpm'
set term=rxvt-unicode
colorscheme neverland2  "or delek, vibrantink
"colorscheme jellybeans "with gray colorscheme
else
colorscheme pablo
endif
set backupcopy=yes	
set backupdir=$HOME/.vim/backup
set backupskip=/tmp/*
set clipboard=unnamedplus
set directory=~/.vim/swap,~/tmp,.
set guifont=terminus\ 11
set hlsearch
set incsearch 
set ignorecase
set linebreak
set nohlsearch
set number
set smartcase
set shell=/bin/bash
set title
set t_Co=256
syntax on
imap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>i
nmap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>i
"-------------turn spellcheck on---------------"
" Use "]s, [s" to move between misspelled words
" Use "z=" for suggestions
" Use "zg" to add the word to vim's dictionary
" Use "zw" to mark word as incorrect
"-----------------------------------------------"
"set spell spelllang=en_us



"--------------turn spellcheck off--------------"
":set nospell
"-----------------------------------------------"

