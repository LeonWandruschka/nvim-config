"  Made by LEON WANDRUSCHKA
syntax on
filetype plugin indent on

set exrc
set secure
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set mouse=a


" Plugins
call plug#begin()

Plug 'kaicataldo/material.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'LeonWandruschka/DoxygenToolkit.vim'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

call plug#end()


" Colorscheme
colorscheme material
let g:material_theme_style = 'default'

if (has('termguicolors'))
	set termguicolors
endif


" ESC remap
imap ## <Esc>
inoremap ## <ESC>
nnoremap ## <ESC>
vnoremap ## <ESC>
onoremap ## <ESC>

" Remap Arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Remap insertmode move
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>



" COC Tab-completion
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


" Moving around in insert and command line mode
inoremap <silent> <C-j>      <Down>
inoremap <silent> <C-k>      <Up>
inoremap <silent> <C-h>      <Left>
inoremap <silent> <C-l>      <Right>
inoremap <silent> <C-f>      <Right>
inoremap <silent> <C-d>      <Del>

" NERDTree
inoremap <c-b> <ESC>:NERDTreeToggle<cr>
nnoremap <c-b> <ESC>:NERDTreeToggle<cr>
inoremap <c-f> <ESC>:NERDTreeFocus<cr>
nnoremap <c-f> <ESC>:NERDTreeFocus<cr>


nnoremap <c-t> :TagbarToggle<cr>
inoremap <c-t> :TagbarToggle<cr>

let g:tagbar_autofocus = 1


" Set autopairs <c-h> to delete brackets to off
let g:AutoPairsMapCh = 0

" doxygen config
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_blockHeader_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_GroupID = "Group: <id>"
let g:DoxygenToolkit_authorName = "Author: Leon Wandruschka (12206109)"

