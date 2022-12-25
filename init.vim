" neovim config file by Leon Wandruschka
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

call plug#begin()

Plug 'EdenEast/nightfox.nvim' " Color Scheme
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'LeonWandruschka/DoxygenToolkit.vim'

call plug#end()

"Set Colorscheme 
:colorscheme nightfox

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

inoremap <c-f> <Esc>:NERDTreeFocus<cr>
nnoremap <c-f> <Esc>:NERDTreeFocus<cr>

let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_blockHeader_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter_AuthorBlock = "-----------------------------------------------------------------------------"
let g:DoxygenToolkit_GroupID = "Group: Markus Meierhofer"
let g:DoxygenToolkit_authorName = "Author: Leon Wandruschka (12206109)"

