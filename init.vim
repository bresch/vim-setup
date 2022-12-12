execute pathogen#infect()
Helptags

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
set ignorecase
set smartcase

" colorscheme ron

" set grepprg=grep\ -nH\ $*
let g:tex_flavor='tex'

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
map <C-p> :FZF<CR>
nnoremap <silent><Leader>* :Rg <C-R><C-W><CR>

" Customize fzf colors to match your color scheme
    " - fzf#wrap translates this to a set of `--color` options
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
" \ 'bg':      ['bg', 'Normal'],
" \ 'hl':      ['fg', 'Comment'],
" \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
" \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
" \ 'hl+':     ['fg', 'Statement'],
" \ 'info':    ['fg', 'PreProc'],
" \ 'border':  ['fg', 'Ignore'],
" \ 'prompt':  ['fg', 'Conditional'],
" \ 'pointer': ['fg', 'Exception'],
" \ 'marker':  ['fg', 'Keyword'],
" \ 'spinner': ['fg', 'Label'],
" \ 'header':  ['fg', 'Comment'] }

"" Global and local search
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nmap <leader>go :Rg 

" Switch to header or c file
map gH :call CurtineIncSw()<CR>

" Open tagbar
nmap gt :TagbarOpenAutoClose<CR>

" Open this init file
nnoremap gi :e ~/.config/nvim/init.vim<CR>

" Buffer switching
nnoremap gj :bp<CR>
nnoremap gk :bn<CR>

" Buffer scrolling (keep cursor at same height)
nnoremap <C-j> j<C-e>
nnoremap <C-k> k<C-y>

" Join and split lines
nnoremap K <Esc>k$Jx
nnoremap J <Esc>i<CR><Esc>

" Close current buffer
nnoremap <C-c> :bp\|bd #<CR>

let g:ycm_global_ycm_extra_conf = '~/src/Firmware/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "python":1,
			\ }
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

" Abbreviations
iabbrev breakpoint import pdb; pdb.set_trace()
command! Breakpoint call AddBreakpoint()
function! AddBreakpoint()
   normal! iimport pdb; pdb.set_trace()
endfunction

" EasyMotion plugin
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)
nmap * /<C-r><C-w><CR>n
nmap # ?<C-r><C-w><CR>N

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
