
set nocompatible              " be iMproved, required
filetype off                  " required

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,latin1

" 键盘快捷键设置
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

map <C-p> :NERDTreeToggle<CR>

"nmap <C-p> :Files<CR>
"nmap <C-e> :Buffers<CR>
"let g:fzf_action = { 'ctrl-e': 'edit' }

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

map ; :Files<CR>

" This is the default extra key bindings
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'morhetz/gruvbox'

Plugin 'jceb/vim-orgmode'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 主题配置
set termguicolors
syntax enable
set background=dark
colorscheme monokai
" 显示行数
set number

" 关闭和vi的兼容模式
set nocompatible

" 语法高亮
syntax on

" backspace键不能后退回到上一行的问题
set backspace=indent,eol,start

" 显示插入,视图模式在下方
set showmode
set showcmd

" vim的编码是unicode
set encoding=utf-8

" 终端颜色256
set t_Co=256

" 匹配文件类型的缩进
filetype indent on

" 自动缩进
set autoindent

" 缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 显示当前行数
set relativenumber

set cursorline
set nowrap

" 行的滚动
set scrolloff=8
set sidescrolloff=15

set laststatus=2

" 行的下划线
set ruler

" 高亮括号
set showmatch

" 高亮搜索 并且搜索到第一个字符串就匹配
set hlsearch
set incsearch

" 大小写智能模糊
set ignorecase
set smartcase

" 关闭备份
set nobackup
set noswapfile

" 关闭错误警告铃声
set noerrorbells



" python文件新建的snippet
func SetTitle()
	call setline(1, "\#!/usr/bin/python3")
	call setline(2, "\# -*- coding=utf8 -*-")
	call setline(3, "\# Author: longji")
	call setline(4, "\# CreatedTime: ".strftime("<%Y-%m-%d %H:%M:%S>"))
	call setline(5, "\# Description: function")
	normal G
	normal o
	normal o
endfunc 
autocmd bufnewfile *.py call SetTitle()
