unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" --------------------------------
" PLUGGINS
" --------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ma liste perso de plugins

" Plugin 'c9s/perlomni.vim'
" Plugin 'scrooloose/syntastic'
" " Plugin 'wincent/cammand-t'
" " Plugin 'vim-scripts/taglist.vim'
" Plugin 'Raimondi/delimitMate'
" " Plugin 'WolfgangMehner/vim-plugins'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'chrisbra/Replay'

" " For markdown preview
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'



" SIDE TREE
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" COMPLETION
Plugin 'ervandew/supertab'

" EASY COMMENT
Plugin 'scrooloose/nerdcommenter'

" Multiple cursor selection
" Plugin "mg979/vim-visual-multi"
" Plugin 'terryma/vim-multiple-cursors' Deprecated

" GIT
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" THEME
Plugin 'cocopon/iceberg.vim'
Plugin 'itchyny/lightline.vim'

" LINTING
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" WEB
Plugin 'alvan/vim-closetag'
Plugin 'AndrewRadev/tagalong.vim'



" --------------------------------
" GENERAL SETTINGS
" --------------------------------


set nocompatible              " Disable Vi compatible mode
set mouse=a		                " Enable mouse in all modes

" Encoding
set encoding=UTF-8            " Set general encoding in VIM
set fileencoding=utf-8        " Set file encoding in VIM

" General look
syntax enable           	    " Enable syntax coloration
set number		                " Show line numbers
set showmatch		              " Highlight closing brackets when inserted
set ruler		                  " Show current position in buffer (lower right corner)

" Indentation
set ai 			                  " Enable auto indent
set si			                  " Enable intelligent indent

" Tabulation
set shiftwidth=4	            " Set a tab as four spaces
set tabstop=4
set expandtab		              " Transformer les tabulations en espaces
set smarttab		              " Être intelligent dans l'utilisation des tabulations

" Search
set ignorecase		            " Ingnore case while searching
set incsearch		              " Highlight results while typing search

" Undo
set undofile                  " Store undo in a file for later edition.

" Code folding
set foldmethod=indent           " Méthode pour cacher du code (donc selon l'indentation)
set nofoldenable                " Ne rien cacher par défaut

" Shell and command completion
set shell=/usr/bin/zsh		                " Votre shell
set showcmd		        " Affiche (partiellement) la commande dans la barre de statut
set wildmenu                    " Completion dans l'interface
set wildmode=list:longest       " Comportement de la complétion semblable à celui d'un shell
set wildignore=*.o,*~ 	        " Ignorer les fichiers temporaires et objets

" File type detection
filetype plugin indent on     " Enable file type auto detection, plugin and indentation


set confirm




" Autocomplétion intelligente
set omnifunc=syntaxcomplete#Complete

" Désactiver les commentaires auto
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" if has("autocmd")
"       au BufReadPost * if line("'\") > 1 && line("'\") <= line("$") | exe "normal! g'\" | endif
" endif

" Touche bonus que l'on peut utiliser pour mapper certaines commandes
let mapleader = ","


" --------------------------------
" KEY MAP
" --------------------------------


au FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
noremap <silent><buffer> <2-LeftMouse> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>



" Exécuter PerlTidy sur l'actuel buffer (nécessite son installation sur le système)
map <F7> <Esc>:%!perltidy -i 2<CR>

" Splitter horizontalement
map <C-w>- <Esc>:sp<CR>
" Splitter verticalement
map <C-w>\| <Esc>:vsp<CR>

" Aller à l'onglet suivant
nnoremap <C-Left>  :tabprevious<CR>
" Aller à l'onglet précédent
nnoremap <C-Right>  :tabnext<CR>
" Fermer l'onglet courant
nnoremap <C-w> :tabclose<CR>
" Ouvrir un nouvel onglet
nnoremap <C-t> :tabnew<CR>

" Toogle sidebar
nnoremap <C-b> :NERDTreeToggle<CR>



" --------------------------------
" PLUGGIN CONFIG
" --------------------------------


" THEME

" Plugin 'altercation/vim-colors-solarized', {'as': 'solarized'}
" let g:solarized_termcolors=256

" Status line theme
set background=dark
colorscheme iceberg
set laststatus=2
let g:lightline = {'colorscheme': 'iceberg',}
set ttimeoutlen=50
set noshowmode
set shortmess+=F


let g:closetag_filenames = '*.vue'

" ALE

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}
