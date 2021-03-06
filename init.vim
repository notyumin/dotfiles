call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'yamatsum/nvim-cursorline' 
Plug 'ap/vim-css-color' 
Plug 'psliwka/vim-smoothie'

call plug#end()

let g:coc_global_extensions = ['coc-go', 'coc-tsserver']

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

" Set Enter Key to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use CoC GoTo
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Makes CursorHold faster (for Coc-Highlight)
set updatetime=150

" F2 to rename symbol
nmap <F2> <Plug>(coc-rename)

" Alt+G to open Flog (Git Graph)
nmap <A-g> :Flog<CR>

" Shift + K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Use `[g` and `]g` to navigate coc-diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


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
