" 设置自己的leader
let mapleader=","
" 打开文件类型侦测
filetype on
" 根据不同的文件类型加载不同的插件
filetype plugin on
" 定义快捷键到行尾部和首部
" 启用这种方式
" nmap H ^
" nmap L $
nnoremap <C-a> ^
nnoremap <C-E> $
" 快速跳转
nmap J 3j
nmap K 3k
" 关于保存退出文件相关
nmap <Leader>w :w<CR>
" 不保存直接退出
nmap <Leader>q :q!<CR>
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
" 将tab自动转为空格
set expandtab
" 不能自动换行
set nowrap
" 格式化
set formatoptions=tcrqn " 根据要求格式化
set autoindent     " 继承缩紧
set smartindent    " 为C语言提供自动缩紧
set cindent        " 使用C样式缩紧
set smarttab       " 在行和段开始处使用制表符
" 设置文件编码
set fileencoding=UTF-8
" 搜索设置
set showmatch      " 匹配成队符号
set matchtime=5    " 匹配括号高亮的时间
" 行数控制
set scrolloff=20  " 光标始终保持在距离上下顶点20行的位置
" 自定义状态行
set laststatus=2
set statusline=%F\ Ascii:%b\ 0x:%B\ %=[%{&ff}]\ 行:%l\ 列:%v\ 最大行:%L\ %y
" 自定义函数
function! ShowPos()
  let &statusline = ""
  let now_line = line(".")
  let max_line =  line("$")
  let pos = now_line * 1.0 / max_line * 1.0 * 100
  let pos = float2nr(pos) / 10
  let statusline="%F\ Ascii:%-5b\ 0x:%-4B\ "
  let statusline2="%=[%{&ff}]\ 行:%l\ 列:%v\ 最大行:%L\ %y"
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

" vim欢迎界面
Plug 'mhinz/vim-startify'

" 模糊搜索
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" coc.nvim
" Plug 'neoclide/coc.nvim', {'branch' : 'release'}

" 中文帮助文档
Plug 'yianwillis/vimcdoc'

" 代码检查
Plug 'vim-syntastic/syntastic'

" 文件树
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" 文件数图标
" 图标美化
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all'}
" Plug '~/.vim/plugged/YouCompleteMe'
" bash插件 在vim中运行command
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
Plug 'honza/vim-snippets'
" 对称括号加颜色
" Plug 'frazrepo/vim-rainbow'

call plug#end()
" 对称括号加颜色 设置
let g:rainbow_active = 1

" 设置vim-easy-align
" 自动对齐 map visual映射
xnoremap ea :EasyAlign<CR>

" 设置vim-autoformat
" 自动格式化内容
noremap <Leader>ac :Autoformat<CR>
" 设置vim-colorschemes
" 配色方案设置
colorscheme gruvbox

" 设置youcompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
      \ 'cs,lua,javascript': ['re!\w{2}'],
      \ }
" 不在单独打开窗口显示函数原型
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_invoke_complerion = '<c-space>'
" ycm显示补全的白名单 1==True
let g:ycm_filetype_whitelist = {
      \ "c":1,
      \ "cpp":1,
      \ "objc":1,
      \ "sh":1,
      \ "zsh":1,
      \ "zimbu":1,
      \ "python":1,
      \ "text":1,
      \ "cmake":1,
      \ "javascript":1,
      \ "vim":1,
      \ "html":1,
      \ }

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
" set cursorline
" set cursorcolumn

set backspace=2

" 解决ycm和ultisnips的tab问题
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" 打开文件自动跳转到上一次的光标位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif

" nerdtree设置
map <leader>n :NERDTreeMirror<CR>
map <leader>n :NERDTreeToggle<CR>

" taglist
" 设置Tlist的宽度
let Tlist_WinWidth=30
" 如果Tlist是最后一个窗口就直接关闭
let Tlist_Exit_OnlyWindow=1

" syntastic
map <leader>s :Errors<CR>
let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" startify
" 设置欢迎词
let g:startify_custom_header = [
      \'+--------------------------------------------------+',
      \'|     使用vim吗？刘傲天。                          |',
      \'|                                                  |',
      \'|                           https://www.allsrc.cn  |',
      \'+--------------------------------------------------+',
      \]
" 设置END
" END

" 设置缓冲区
set hidden

" 如果超过这个时间没有输入，将内容写入到磁盘
set updatetime=3
" c	不给出 |ins-completion-menu| 信息。例如，
set shortmess+=c

" " COC设置 不太吸引我，不想用 在考虑
" let g:coc_global_extensions = [
"   \ 'coc-json',
"   \ 'coc-vimlsp']
" 
" " Ctrl + space 补全
" inoremap <silent><expr> <c-space> coc#refresh()
" " 回车补全所选中的代码
" if exists('*complete_info')
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" " 跳转代码
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " 重命名变量
" nmap <leader>rn <Plug>(coc-rename)
