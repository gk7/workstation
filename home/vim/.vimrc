set guifont=terminus\ 11
colorscheme pablo
set incsearch 
set ignorecase
set smartcase
set clipboard=unnamedplus
syntax on
set number
imap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>i
nmap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>i
"-------------turn spellcheck on---------------"
" Use "]s, [s" to move between misspelled words
" Use "z=" for suggestions
" Use "zg" to add the word to vim's dictionary
" Use "zw" to mark word as incorrect
"-----------------------------------------------"
":set spell spelllang=en_us



"--------------turn spellcheck off--------------"
":set nospell
"-----------------------------------------------"
