" 设置自己的leader
let mapleader=","
" 打开文件类型侦测
filetype on
" 根据不同的文件类型加载不同的插件
filetype plugin on
" 定义快捷键到行尾部和首部
nmap H ^
nmap L $
" 快速跳转
nmap J 3j
nmap K 3k
" 关于保存退出文件相关
nmap <Leader>w :w

nmap <Leader>q :q!

" 处理复制粘贴
vnoremap <Leader>y "+y
nmap <Leader>p "+p
" 跳转Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 让vim配置保存后立马生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索并且对大小写不敏感
set incsearch
set ignorecase
" 关闭兼容模式
set nocompatible
" 开启vim自身命令行模式智能补全
set wildmenu
" 消除颜色
noremap <Leader><space> :nohlsearch<CR>
" 设置颜色配色
" colorscheme one
set background=dark
" 自动识别文件格式
set fileformats=unix,dos
set fileformat=unix
" 统一缩紧
set tabstop=2
set softtabstop=2
set shiftwidth=2
" 不能自动换行
set nowrap
" 格式化
set formatoptions=tcrqn " 根据要求格式化
set autoindent     " 继承缩紧
set smartindent    " 为C语言提供自动缩紧
set cindent        " 使用C样式缩紧
set smarttab       " 在行和段开始处使用制表符
" 设置文件编码
set fileencoding=utf-8
" 搜索设置
set showmatch      " 匹配成队符号
set matchtime=5    " 匹配括号高亮的时间
" 行数控制
set scrolloff=20  " 光标始终保持在距离上下顶点20行的位置
" 自定义状态行
set laststatus=2
set statusline=%F\ \ \ Ascii:%b\ 0x:%B\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%p%%]\ 行:%l\ 列:%v\ 最大行:%L\ %y
" 自定义函数
function! ShowPos()
	let &statusline = ""
	let now_line = line(".")
	let max_line =  line("$")
	let pos = now_line * 1.0 / max_line * 1.0 * 100
	let pos = float2nr(pos) / 10
	let statusline="%F\ \ \ Ascii:%-5b\ 0x:%-4B\ "
	let statusline2="%=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%p%%]\ 行:%l\ 列:%v\ 最大行:%L\ %y"
	let statusline3 = "["
	let g:count = 0
	while g:count < 10
		if pos > 0
			let statusline3 = statusline3 . "➡"
			let pos = pos - 1
		else
			let statusline3 = statusline3 . "\ "
		endif
		let g:count = g:count + 1
	endwhile
	let statusline3 = statusline3 . "]"
	let statusline = statusline . statusline3 . statusline2
	let &statusline = statusline
endfunction
autocmd CursorMoved * call ShowPos()
autocmd CursorMovedI * call ShowPos()
