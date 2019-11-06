set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ma liste perso de plugins
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/a.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ervandew/supertab'
Plugin 'emezeske/manpageview'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-perl/vim-perl'
Plugin 'c9s/perlomni.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'wincent/cammand-t'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'chrisbra/Replay'

" For markdown preview
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

filetype plugin indent on 

syntax enable           	" Coloration syntaxique

set ai 			        " Activer l'indentation automatique
set si			        " Activer l'indentation intelligente
set showcmd		        " Affiche (partiellement) la commande dans la barre de statut
set showmatch		        " Afficher les brackets qui correspondent
set ignorecase		        " Recherche insensible à la casse
set incsearch		        " Recherche insensible à la casse
set mouse=a		        " Activer la souris pour tous les modes
set number		        " Afficher les numéros de ligne
set shiftwidth=4	        " Une tabulation = 4 espaces
set tabstop=4
set expandtab		        " Transformer les tabulations en espaces
set ruler		        " Afficher la position courante
set smarttab		        " Être intelligent dans l'utilisation des tabulations
set fileencoding=utf-8          " Encoder en UTF-8
set shell=zsh		        " Votre shell 
set wildmenu                    " Completion dans l'interface
set wildmode=list:longest       " Comportement de la complétion semblable à celui d'un shell
set wildignore=*.o,*~ 	        " Ignorer les fichiers temporaires et objets
set foldmethod=indent           " Méthode pour cacher du code (donc selon l'indentation)
set nofoldenable                " Ne rien cacher par défaut

set background=dark 

" Autocomplétion intelligente
set omnifunc=syntaxcomplete#Complete

" Désactiver les commentaires auto
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Touche bonus que l'on peut utiliser pour mapper certaines commandes
let mapleader = ","

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
nnoremap <C-c> :tabclose<CR>
" Ouvrir un nouvel onglet
nnoremap <C-t> :tabnew<CR>
