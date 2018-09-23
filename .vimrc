" 显示行数
set number

" 关闭和vi的兼容模式
set nocompatible

" 语法高亮
syntax on

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
	call setline(1, "\#!/usr/bin/python python3")
	call setline(2, "\# -*- coding=utf8 -*-")
	call setline(3, "\# Author: longji")
	call setline(4, "\# CreatedTime: ".strftime("<%Y-%m-%d %H:%M:%S>"))
	call setline(5, "\# Description: function")
	normal G
	normal o
	normal o
endfunc 
autocmd bufnewfile *.py call SetTitle()
