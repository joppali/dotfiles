if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/kosuda/.vimrc', '/Users/kosuda/.vim/bundle/rc/dein.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/kosuda/.vim/bundle'
let g:dein#_runtime_path = '/Users/kosuda/.vim/bundle/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/kosuda/.vim/bundle/.cache/.vimrc'
let &runtimepath = '/Users/kosuda/.vim/bundle/repos/github.com/Shougo/dein.vim/,/Users/kosuda/.vim,/Users/kosuda/.vim/bundle/repos/github.com/Shougo/dein.vim,/Users/kosuda/.vim/bundle/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/Users/kosuda/.vim/bundle/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/kosuda/.vim/after'
filetype off
