set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start ""backspace効かないから
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead .* setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

set noswapfile 
filetype on

"""""""""""
" 検索系
"""""""""""
"検索文字列をハイライトする
set hlsearch
"インクリメンタルサーチを行う
set incsearch
 "大文字と小文字を区別しない
set ignorecase

" number
set number
nmap <F5> :!python %

" OSとクリップボードを共有する
set clipboard=unnamed,autoselect
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
" """"""""""""""""""""""""""""""
if has("autocmd")
     autocmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

"""""""""""
" 検索系
"""""""""""
"括弧の補完
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

"""""""""""""""""""""""""""""""""""""
""""""""""""statas bar"""""""""""""""
"""""""""""""""""""""""""""""""""""""
set laststatus=2

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode'
        \ }
        \ }

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
    else
        return ''
    endif
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
""""""""""""""""""""""""""""""""""""""""
"# dein setup
""""""""""""""""""""""""""""""""""""""""
let s:dein_dir = $HOME . '/.vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " Load and cached toml
    " all plugins listed in toml
    call dein#load_toml(s:dein_dir . '/rc/dein.toml', {'lazy': 0})
    "call dein#load_toml(s:dein_dir . '/rc/dein_lazy.toml', {'lazy': 1})
    " if has('nvim')
    "     call dein#load_toml(s:dein_dir . '/rc/dein_neo.toml', {'lazy': 0})
    " endif
    call dein#end()
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>

" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""
" coler theme
""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme Apprentice
set t_Co=256
