" vim settings
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


" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


" NERDTree
inoremap <c-b> <ESC>:NERDTreeToggle<cr>
nnoremap <c-b> <ESC>:NERDTreeToggle<cr>
inoremap <c-f> <ESC>:NERDTreeFocus<cr>
nnoremap <c-f> <ESC>:NERDTreeFocus<cr>

" doxygen config
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_blockHeader_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_GroupID = "Group: Markus Meierhofer"
let g:DoxygenToolkit_authorName = "Author: Leon Wandruschka (12206109)"
