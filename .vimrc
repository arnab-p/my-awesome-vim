syntax on

set guicursor=
set hidden
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set scrolloff=8
set cmdheight=2
set updatetime=50
set ic
set diffopt+=vertical
set foldmethod=indent
set foldlevel=2
set foldlevelstart=2
set termguicolors
set colorcolumn=100

let loaded_matchparen = 1
let mapleader = " "

" colors pyte
" colorscheme 256_noir
" let g:alduin_Shout_Become_Ethereal = 1
" colorscheme alduin
let ayucolor="mirage"   " for dark version of theme
colorscheme ayu

" Change highlighting of cursor line when entering/leaving Insert Mode
" set cursorline
" highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
" autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
" autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go'
call plug#end()


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

set clipboard=unnamed
imap kk <Esc>:w<CR>
imap jj <Esc>:w<CR>

nmap <leader>ld :Gdiffsplit!<CR>
nmap <leader>ww :Gwrite<CR>
nmap <leader>f :diffget //3<CR>
nmap <leader>a :diffget //2<CR>
nmap <leader>gs :G<CR>

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ ]

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
vmap <leader>gf  <Plug>(coc-format-selected)
nnoremap <leader>cr :CocRestart

autocmd BufWritePre * :call TrimWhitespace()
" autocmd BufReadPost,BufNewFile * normal zM
nnoremap <Tab> zr
nnoremap <S-Tab> zm

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" macros
let @p = 'gg/BASEyypki#��ajf:is��a4lCapi.dev.rudderlabs.com��a:w'
let @l = 'gg/BASEyypki#��ajf:is��a4lCapi.rudderlabs.com��a:w'
let @o = 'ggO��ap/CONFIG_BACKwlChttps://api.dev.rudderlabs.com��aj$T=C��aj$T=Dggyiwgi"��ajpggdd:w'
let @k = 'ggO��ap/CONFIG_BACKwlChttps://api.rudderlabs.com��aj$T=C��aj$T=Dggyiwgi"��ajpggdd:w'
let @n = 'ggO��ap/CONFIG_BACKwlChttp://localhost:5000��aj$T=C��aj$T=Dggyiwgi"��ajpggdd:w'
