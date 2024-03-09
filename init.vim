" neovim config file by Leon Wandruschka

" Table of Contents
" 1. Basic Settings
" 2. Plugins
" 3. Color Schemes
" 4. Airline Configuration
" 5. Autocompletion Setup
" 6. Keybindings
" 7. Nvim Tree Configuration
" 8. Tagbar Configuration
" 9. FZF Configuration
" 10. Autopairs
" 11. Doxygen Toolkit Settings
" 12. Terminal Functionality

" 1. Basic Settings
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

" 2. Plugins
call plug#begin()

" Color Schemes
" Plug 'EdenEast/nightfox.nvim' " Nightfox Color Scheme
Plug 'flazz/vim-colorschemes' " Molokai Color Scheme

" Core Plugins
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
" Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'LeonWandruschka/DoxygenToolkit.vim'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()

" 3. Color Schemes
":colorscheme nightfox
:colorscheme molokai

" 4. Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = "%3p%% %l:%c"
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 5. Autocompletion Setup
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" 6. Keybindings
" Movement in Insert and Command Line Mode
inoremap <silent> <C-j>      <Down>
inoremap <silent> <C-k>      <Up>
inoremap <silent> <C-h>      <Left>
inoremap <silent> <C-l>      <Right>
inoremap <silent> <C-f>      <Right>
inoremap <silent> <C-d>      <Del>

" 7. Nvim Tree Configuration
inoremap <c-b> <Esc>:NvimTreeToggle<cr>
nnoremap <c-b> <Esc>:NvimTreeToggle<cr>
inoremap <c-f> <Esc>:NvimTreeFocus<cr>
nnoremap <c-f> <Esc>:NvimTreeFocus<cr>

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()
EOF

" 8. Tagbar Configuration
nnoremap <c-t> <Esc>:TagbarToggle<cr>
inoremap <c-t> <Esc>:TagbarToggle<cr>
let g:tagbar_autofocus = 1

" 9. FZF Configuration
nnoremap <C-p> :Files <Cr>

" 10. Autopairs
" Set autopairs <c-h> to delete brackets to off
let g:AutoPairsMapCh = 0

" 11. Doxygen Toolkit Settings
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_blockHeader = ""
let g:DoxygenToolkit_blockFooter = ""
let g:DoxygenToolkit_blockHeader_AuthorBlock = "----------------------------------------"
let g:DoxygenToolkit_blockFooter_AuthorBlock = "----------------------------------------"
let g:DoxygenToolkit_GroupID = "Group: <id>"
let g:DoxygenToolkit_authorName = "Author: <author>"

" 12. Terminal Functionality
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

" Toggle Terminal On/Off
nnoremap <A-t> :call TermToggle(5)<CR>
inoremap <A-t> <Esc>:call TermToggle(5)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(5)<CR>

" Terminal Go Back to Normal Mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
