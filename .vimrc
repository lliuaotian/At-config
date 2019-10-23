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
nmap <Leader>w :w<CR>
nmap <Leader>e :wq<CR>

" 处理复制粘贴
vnoremap <Leader>y "+y
nmap <Leader>p "+p
" 跳转Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 让vim配置保存后立马生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
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
		if pos > -1
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
endfunction()
autocmd CursorMoved * call ShowPos()
autocmd CursorMovedI * call ShowPos()

inoremap jj <Esc>j
inoremap kk <Esc>k


" 安装插件
call plug#begin('~/.vim/plugged')

" 文件树
Plug 'scrooloose/nerdtree'
" 代码格式化美化
Plug 'Chiel92/vim-autoformat'
" vim配色方案
Plug 'flazz/vim-colorschemes'
" 通用代码注释
Plug 'tpope/vim-commentary'
" usage
" gcc 注释所在行
" gc 注释选中部分 visual模式下
" gcu 撤销上一次注释
" gcgc 撤销注释当前行和临近的N行注释
Plug 'junegunn/vim-easy-align'
" usage
" ea进入对齐模式
" 默认是左对齐
" 回车进入R模式是右对齐 right
" 再次回车进入C模式是居中对齐 Centered
" 紧接着输入对齐中间的字符，也就是分隔符
" 补全插件
Plug 'ycm-core/YouCompleteMe'
" bash插件 在vim中运行command
Plug 'lrvick/Conque-Shell'
" usage
" ConqueTerm bash 运行bash
" ConqueTermSplit <command> 分割窗口打开command
" ConqueTermVSplit <command> 分割窗口打开command
" ConqueTermTab <command> 分割窗口打开command
Plug 'tpope/vim-pathogen'
" 符号编辑插件
Plug 'tpope/vim-surround'
" git管理器
Plug 'tpope/vim-fugitive'
" c++ stl高亮
Plug 'octol/vim-cpp-enhanced-highlight'
" tab自动补全内容
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" 设置vim-easy-align
" 自动对齐 map visual映射
xnoremap ea :EasyAlign<CR>

" 设置vim-autoformat
" 自动格式化内容
noremap <Leader>ac :Autoformat<CR>
" 设置vim-colorschemes
" 配色方案设置
colorscheme molokai

" 设置youcompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" 设置octol/vim-cpp-enhanced-highlight
" 默认不高亮类作用域
let g:cpp_class_scope_highlight = 1
" 成员变量也是默认不显示
let g:cpp_member_variable_highlight = 1
" 声明中高亮类名
let g:cpp_class_decl_highlight = 1
" 模版突出显示
let g:cpp_experimental_template_highlight = 1
" 库突出显示
let g:cpp_concepts_highlight = 1

" 设置ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" 高亮显示当前行和列
set cursorline
set cursorcolumn

set backspace=2
