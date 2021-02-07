" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" visual
" Plug 'sainnhe/sonokai'
Plug 'seesleestak/duo-mini'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" visual settings

" line numbers
set number
colorscheme duo-mini

""" when editing

" indent by 2 spaces
set softtabstop=2
set shiftwidth=2

""" commands / navigation

" map jk to perform escape
:inoremap jk <Esc>`^

" force myself to not use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" use fzf to search and jump to file
nnoremap <C-p> :Files<Cr>

" use ripgrep to search for string in files
nnoremap <C-r> :Rg<Cr>

