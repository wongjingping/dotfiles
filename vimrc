" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" navigation/file-tree
Plug 'preservim/nerdtree'

" visual
" Plug 'sainnhe/sonokai'
Plug 'smallwat3r/vim-efficient'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" visual settings

set number               " line numbers
set relativenumber       " relative line numbers
colorscheme efficient    " color theme
set laststatus=2         " enable status bar

""" when editing

" indent by 2 spaces
set softtabstop=2
set shiftwidth=2

""" commands / navigation

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

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

