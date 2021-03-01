" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" navigation/file-tree
Plug 'preservim/nerdtree'

" multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" visual
" Plug 'sainnhe/sonokai'
Plug 'smallwat3r/vim-efficient'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" editor settings

" leader key
let mapleader = " "

" open vimrc and source it quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quit quickly
nnoremap <leader>q :qa<cr>
nnoremap <leader>wq :wqa<cr>

" indent by 2 spaces
set softtabstop=2
set shiftwidth=2

""" visual settings

set number               " line numbers
set relativenumber       " relative line numbers
colorscheme efficient    " color theme
set laststatus=2         " enable status bar
set splitright           " split new buffers to the right

""" commands / navigation

" Start NERDTree file explorer and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

" use tags where available
set tags=./tags;,tags;

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

