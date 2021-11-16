call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'ap/vim-css-color'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cosmetics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
set number

" Theme
colorscheme dracula

" lualine
lua << END
require'lualine'.setup{
    options={
        theme='dracula'
    }
}
END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To navigate autocomplete with <Tab> and <S-Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set 7 lines to the cursor to keep cursor near center of screen
set so=7

" Open vsp on right side instead of left
set splitright

" Ctrl+B to toggle NERDTree
nmap <C-b> :NERDTreeToggle<CR>

" Blamer Stuff
let g:blamer_enabled = 1 "Enable blamer on start 
let g:blamer_show_in_visual_modes = 0 "Disable blamer in Visual Mode
let g:blamer_show_in_insert_modes = 0 "Disable blamer in Insert Mode

" Ignore case when searching
set ignorecase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
