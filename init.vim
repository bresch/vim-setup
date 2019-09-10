execute pathogen#infect()

syntax on
filetype plugin indent on
filetype on
filetype plugin on

set relativenumber
set autoindent
set smarttab
set tabstop=8
set shiftwidth=8
set nohlsearch
set mouse=a
set guicursor=
set scrolloff=20

" set grepprg=grep\ -nH\ $*
let g:tex_flavor='tex'

map <C-p> :Denite file_rec<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep: -mode=normal<CR>
nnoremap <buffer> <Leader>ll :!python %<cr>

"" Global and local search
nmap <leader>go :Denite grep: -mode=normal<CR>
nmap <leader>gl :DeniteBufferDir grep<CR>

"" File search with Ripgrep
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])

"" Use Ripgrep for grepping
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Move in grep and file search results while being in insert mode
call denite#custom#map(
	      \ 'insert',
	      \ '<C-j>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
          \)
call denite#custom#map(
	      \ 'insert',
	      \ '<C-k>',
	      \ '<denite:move_to_previous_line>',
	      \ 'noremap'
\)

" Switch to header or c file
nnoremap gH :e %<.h<CR>
nnoremap gC :e %<.cpp<CR>
"command SO so $MYVIMRC

" Open this init file
nnoremap gi :e ~/.config/nvim/init.vim<CR>

" Buffer switching
nnoremap gj :bp<CR>
nnoremap gk :bn<CR>
nnoremap gl :<C-u>Denite buffer -mode=normal<CR>

" Buffer scrolling (keep cursor at same height)
nnoremap <C-j> j<C-e>
nnoremap <C-k> k<C-y>

" Join and split lines
nnoremap K <Esc>k$Jx
nnoremap J <Esc>i<CR><Esc>

" Close current buffer
nnoremap <C-c> :bp\|bd #<CR>

let g:ycm_global_ycm_extra_conf = '~/src/Firmware/.ycm_extra_conf.py'
imap <C-space> <esc>A<Plug>snipMateNextOrTrigger
smap <C-space> <Plug>snipMateNextOrTrigger
let g:snips_author='Mathieu Bresciani'
let g:snips_email='brescianimathieu@gmail.com'
let g:snips_github='https://github.com/bresch'

let g:Tex_DefaultTargetFormat='pdf'

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Search for visually selected text using //
vnoremap // y/<C-R>"<CR>

"" Trim trailing spaces and tabs
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo

set undolevels=1000
set undoreload=10000
