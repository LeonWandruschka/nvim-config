" neovim config file by Leon Wandruschka
syntax on
filetype plugin indent on

set exrc
set secure

set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set mouse=a

call plug#begin()

"Plug 'EdenEast/nightfox.nvim' " Nightfox Color Scheme
Plug 'flazz/vim-colorschemes' " Molokai Color Scheme

Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
"Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'LeonWandruschka/DoxygenToolkit.vim'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()

"Set Colorscheme Nightfox
":colorscheme nightfox

"Set Colorscheme Molokai
:colorscheme molokai


"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = "%3p%% %l:%c"
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


"use <tab> to trigger completion and navigate to the next complete item
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

inoremap <c-b> <Esc>:NvimTreeToggle<cr>
nnoremap <c-b> <Esc>:NvimTreeToggle<cr>

inoremap <c-f> <Esc>:NvimTreeFocus<cr>
nnoremap <c-f> <Esc>:NvimTreeFocus<cr>


nnoremap <c-t> <Esc>:TagbarToggle<cr>
inoremap <c-t> <Esc>:TagbarToggle<cr>

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()
EOF


let g:tagbar_autofocus = 1

nnoremap <C-p> :Files <Cr>

" Set autopairs <c-h> to delete brackets to off
let g:AutoPairsMapCh = 0

let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_blockHeader_AuthorBlock = "----------------------------------------"
let g:DoxygenToolkit_blockFooter_AuthorBlock = "----------------------------------------"
let g:DoxygenToolkit_GroupID = "Group: <id>"
let g:DoxygenToolkit_authorName = "Author: <author>"





"Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(5)<CR>
inoremap <A-t> <Esc>:call TermToggle(5)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(5)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
