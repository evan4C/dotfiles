" Comments in Vimscript start with a `"`.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

"---------------------------------------------------------
" Syntax and Indent
"---------------------------------------------------------

" Turn on syntax highlighting.
syntax on

" Show matching braces when text indicator is over them
set showmatch

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Set colorscheme for vim
" if has('gui_running')
"     colorscheme solarized
"     let g:lightline = {'colorscheme': 'solarized'}
" elseif &t_Co < 256
"     colorscheme default
"     set nocursorline " looks bad in this mode
" else
"     set background=dark " set light or dark mode
"     let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
"     colorscheme solarized
"     " customized colors
"     highlight SignColumn ctermbg=234
"     highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
"     highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
"     let g:lightline = {'colorscheme': 'dark'}
"     highlight SpellBad cterm=underline
"     " patches
"     highlight CursorLineNr cterm=NONE
" endif

" Enable file type detection
filetype plugin indent on 

" Enable autoindent: new line will habe the same indent as the previous line
set autoindent

"---------------------------------------------------------
" Basic Editing Config
"---------------------------------------------------------
" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Enable highlight search, highlight all search results
set hls

" Define how special characters are displayed when list mode is enabled.
" to enable list mode, use :set list; to disable list mode, use :set nolist
" tab:>> means display tab as >>
" nbsp:~ means display non-breaking spaces as ~
set listchars=tab:>>,nbsp:~

" Enable line breaking at word boundaries, making text more readable by avoiding breaking words in the middle.
set lbr

" Keep at least 5 lines visible above and below the cursor while scrolling.
set scrolloff=5

" Fix slow 0 inserts
set timeout timeoutlen=1000 ttimeoutlen=100 

" Skip redrawing screen in some cases
set lazyredraw 

" Automatically set current directory to directory of last opened file
set autochdir

" Enable more history
set history=8192

" Suppress inserting two spaces between sentences
set nojoinspaces

" Use 4 spaces isntead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Make tab completetion more user-friendly
set wildmode=longest,list
set wildmenu

" Enable mouse support. You should avoid relying on this too much, but it can sometimes be convenient.
set mouse+=a

" Disable floding when a file is opoened
set nofoldenable

" 将默认寄存器与系统剪贴板同步（需要 Vim 支持 +clipboard）
" set clipboard=unnamedplus  " Linux 或部分配置
set clipboard=unnamed    " macOS 默认行为（使用 * 寄存器）

" 映射 Vim 剪贴板命令到 macOS 系统剪贴板
let mapleader = "," " 将<leader>键设置为逗号
vnoremap <leader>y :w !pbcopy<CR>   " 复制选中内容到系统剪贴板
nnoremap <leader>p :r !pbpaste<CR>  " 从系统剪贴板粘贴

"---------------------------------------------------------
" Misc Config
"---------------------------------------------------------
" Unbind some useless/annoying default key bindings.
nmap <C-a> <Nop>
nmap <C-x> <Nop>
nmap Q <Nop> 

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"---------------------------------------------------------
" Plugin Config
"---------------------------------------------------------

" markdown
let g:markdown_fenced_languages = [
    \ 'asm',
    \ 'bash=sh',
    \ 'c',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
    \ 'rust',
\]
let g:markdown_syntax_conceal = 0
let g:markdown_folding = 1
