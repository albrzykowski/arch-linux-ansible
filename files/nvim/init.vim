set number
set cursorline
set showcmd
set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase
set linebreak
set scrolloff=5
set mouse=a
set encoding=utf-8
set updatetime=100
set signcolumn=yes
set termguicolors

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on
syntax on

autocmd FileType python setlocal nowrap

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colorscheme gruvbox
set background=dark

let g:lightline = { 'colorscheme': 'gruvbox' }

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "xml", "yaml" },
  highlight = {
    enable = true,
  },
}
EOF

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set laststatus=2
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <leader>/ :nohlsearch<CR>

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \            [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'LightlineFiletype'
      \ }
      \ }

function! LightlineFiletype()
  return winwidth(0) > 70 ? expand('%:e') : ''
endfunction
