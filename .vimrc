" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim'
Plug 'miyakogi/seiya.vim'

" Initialize plugin system
call plug#end()

" Utility method to check if a plugin is installed
function PlugLoaded(plugin)
  if isdirectory(g:plug_home . "/" . a:plugin)
    \ && index(keys(g:plugs), a:plugin) >=0
    return 1
  else
    return 0
  endif
endfunction

" NERDTree open shortcut
map <C-p> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" convert tabs to spaces and tabspaces to 2
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" intuitive window splitting
set splitbelow
set splitright

" set larger preview window
set previewheight=30

" show line numbers
set number

" put tmp files elsewhere
silent !mkdir ~/.vim/backup > /dev/null 2>&1
set backupdir=~/.vim/backup
set backupcopy=yes " make a copy of the file and overwrite the original one
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set directory=~/.vim/swap
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo

" background color warning for long lines
set colorcolumn=80

" make background transparent
let g:seiya_auto_enable=1

" allow mouse use
set mouse=a

" no wrappiing of lines
set nowrap

" font size
"set guifont=Menlo\ Regular:h12
set guifont=Hack\ Regular:h12

" lightline vim plugin
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme' : 'sonokai'}
let g:customLightlineConfig = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'relativepath', 'modified' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'relativepath' ] ]
    \}
    \}

syntax enable
if &term =~# "256color" && (&term =~# "^screen" || &term =~# "^tmux")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
if PlugLoaded('sonokai')
  let g:sonokai_style = 'andromeda'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1
  colorscheme sonokai
endif

" set text highlight on searched text
set hlsearch

" copy current file path
nmap cp :let @" = expand("%")<cr>:let @+ = expand("%")<cr>

" copy and paste in visual mode using standard ctrl-c ctrl-v keys
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" remove search highlight
nmap <leader>c :noh<CR>

" For better git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> <Leader>h :Entities 0<CR>
noremap <silent> <Leader>H :Entities 1<CR>

