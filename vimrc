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
set timeout timeoutlen=300

" open vimrc and source it quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" copy and paste from clipboard
vnoremap <leader>c "+y
nnoremap <leader>v "+p

" quit quickly
nnoremap <leader>q :q<cr>
nnoremap <leader>qq :qa<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>wqa :wqa<cr>

" indent by 2 spaces
set softtabstop=2
set shiftwidth=2

""" visual settings

set number               " line numbers
colorscheme efficient    " color theme
set laststatus=2         " enable status bar
set splitright           " split new buffers to the right
set incsearch            " highlight incrementally as we search

""" plugins settings

" Start NERDTree file explorer and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>s :NERDTreeFind<cr>


""" search keymaps across uiop

" use fzf to search within current buffer
nnoremap <leader>u :BLines<cr>

" use fzf to search and jump to file
nnoremap <leader>i :call 
  \ fzf#run(fzf#wrap({'source': 'cat /tmp/filedeps'}))<cr>

" use fzf to search for symbol in tags
nnoremap <leader>o :Tags<cr>

" use ripgrep to find usages in any of the files in /tmp/filedeps
command! -bang -nargs=* Rgg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.
  \   shellescape(<q-args>).
  \   ' '.
  \   system('tr "\n" " " < /tmp/filedeps'),
  \   0,
  \   fzf#vim#with_preview(),
  \   <bang>0)
nnoremap <leader>p :Rgg<cr>

" use tags where available
set tags=./tags;,tags;


""" keymaps

" map jk to perform escape
:inoremap jk <Esc>`^

" force myself to not use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

