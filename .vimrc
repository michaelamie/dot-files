"""""""""""
" Setings "
"""""""""""

" Disable Useless Start Message
set shortmess+=I

" Settings for GUI-based Vims 
if has("gui_running")
    set guioptions=mr
    set lines=99 columns=80
"    colorscheme desert
"    colorscheme coffee
    colorscheme birds
    set foldcolumn=2
    set smartindent softtabstop=4 shiftwidth=4 expandtab
    hi Folded guibg=White
    hi FoldColumn guibg=White    
endif

"""""""""""""""
" Key Mapping "
"""""""""""""""
map <C-w>. :bn<Enter>
map <C-w>, :bp<Enter>
