call plug#begin('~/.vim/plugged')
" 下面的我安装的插件

" complete
Plug 'Valloric/YouCompleteMe', {'on': [], 'do': './install.py --clang-complete --go-complete --system-libclang --java-complete'}

" unit
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'sgur/vim-lazygutter'
Plug 'SirVer/ultisnips'
Plug 'fisadev/vim-isort', {'on': 'Isort'}
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter', {'on': '<plug>NERDCommenterToggle'}
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'tpope/vim-sensible'
Plug 'rhysd/clever-f.vim'
Plug 'honza/vim-snippets'

" find & search & move
Plug 'Yggdroot/LeaderF', {'on': ['LeaderfFile', 'LeaderfFunction']}
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-bd-w)', '<Plug>(easymotion-bd-jk)']}

" syntax highlight
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'html'}
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'dockerfile'}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'luochen1990/rainbow'
" html插件
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'Raimondi/delimitMate'
" Plug 'godlygeek/tabular', {'for': 'markdown', 'on': []}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" python-syntax
let g:python_highlight_all = 1


call plug#end()
"插件末尾

" lazy load plugins
autocmd! InsertEnter * call Init()
let g:lazy_load = 0
function! Init()
  if g:lazy_load == 0
    let g:lazy_load = 1
    call plug#load('YouCompleteMe')
  endif
endfunction


" vim setting
set ttyfast
set scrolloff=7            " 滚动的时候有7行多余
set updatetime=100         " update time
set termguicolors          " true color
set lazyredraw             " lazy draw
set nofoldenable           " 禁用折叠"
set nocompatible           " 去除vi 和vim 的一致性
set nu                     " 设置行号
filetype plugin indent on  " 开启类型检查
syntax on                  " 开启语法高粱
set autoindent             " 自动缩进
set cindent                " C语言的缩进格式
set smartindent            " 当遇到右花括号（}），则取消缩进形式
set shiftround
set tabstop=4              " 定义tab所等同的空格长度
set expandtab              " expandtab，输入一个tab，将被展开成softtabstop值个空格，如果softtabstop=4，那么一个tab就会被替换成4个空格
set shiftwidth=4           " 程序中自动缩进所使用的空白长度指示的
set ruler                  " 底部的行号等显示
set novisualbell           " 去掉输入错误的提示声音
set softtabstop=4          " 逢4空格进1制表符
set t_md=                  " 禁用粗体
set t_Co=256               " 开启256色
set fileformat=unix        " filetype
set encoding=utf-8         " 编码utf-8
set cmdheight=1
set noswapfile             " 禁止生产交换文件
set norelativenumber       " 行号为不是相对模式
set ignorecase             " 忽略大小写
set shortmess=I            " 不显示vim版本信息
set noshowmode             " 不显示--INSERT--
set nrformats=             " 使vim将所有数字当成十进制
set timeoutlen=400        " 设置leader键延迟为400ms
set splitbelow
set splitright
set showcmd
set hidden
set laststatus=2
set hlsearch
" set clipboard+=unnamedplus
" sudo pacman -S xclip 支持全局剪切板
" set tags=./tags;/


" vim color setting
colorscheme space-vim-dark
hi CursorLineNR cterm=bold gui=bold
hi lineNr guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59 gui=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE guifg=#af87d7 guibg=NONE
hi TabLineFill ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi TabLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi TabLineSel ctermfg=red ctermbg=NONE guifg=#d75faf guibg=NONE
hi Search cterm=underline ctermfg=red ctermbg=NONE guifg=red guibg=NONE gui=underline
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929



" vim key mapping
let mapleader=","
map <leader>n :NERDTreeToggle<cr>
map <leader><leader>t :LeaderfFunction!<cr>
map  <leader><leader>w <Plug>(easymotion-bd-w)
map  <leader><leader>s <Plug>(easymotion-bd-jk)
map <F1> <nop>
map j gj
map k gk
vnoremap <leader>y "+y
vnoremap <leader>p "+p
" nnoremap <F5> :vsplit $MYVIMRC<cr>
nnoremap <F6> :source $MYVIMRC<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <down> <C-w>-
nnoremap <up> <C-w>+
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

noremap <c-a> I
noremap <c-e> A
noremap ; :
noremap <leader>w :w<cr>
noremap <leader>q :q!<cr>
noremap <leader>e :wq<cr>
autocmd FileType python noremap <leader>c A:<cr>
noremap <leader><space> :nohlsearch<cr>
noremap <leader>f :LeaderfFile<cr>
autocmd FileType python noremap <leader><leader>d :Pydocstring<cr>
noremap H ^
noremap L $
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap D d$
noremap Y y$
noremap <tab> %

inoremap <leader>w <Esc>:w<cr>
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
inoremap <leader>q <Esc>:wq<cr>
inoremap <leader>e =
inoremap <leader>r -
inoremap <leader>a +
inoremap <leader>u _
inoremap <leader>i ____<Esc>hi
inoremap <leader>n <Esc>o
autocmd FileType python inoremap <leader>c <Esc>A:<cr>
inoremap <leader>b ()<Esc>i
inoremap <leader>s []<Esc>i
inoremap <leader>t {}<Esc>i
inoremap <leader>m *
inoremap <leader>d <SPACE>-><SPACE>
inoremap <leader>f <Esc>bi"<Esc>ea"
inoremap <c-l> <right>


" 输入快捷方式
iabbrev hw Hello World
iabbrev im import
cabbrev tn tabnew
cabbrev install PlugInstall

" vim tables
noremap gn :tabn<CR>
noremap gp :tabp<CR>

" terminal mapping
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>w <C-\><C-n>
tnoremap <leader>q <C-\><C-n>:q!<cr>

if has("nvim")
    nnoremap <leader>o :below 10sp term://$SHELL<cr>i
endif

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap gn <C-\><C-n>:tabn<CR>
tnoremap gp <C-\><C-n>:tabp<CR>


" vim autocmd
" 配置vim打开时vim自动定位到上次的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

autocmd FileType python set colorcolumn=80
" set cursorline
" autocmd InsertEnter * set nocursorline
" autocmd InsertLeave * set cursorline
autocmd FileType json,html,jsx,javascript.jsx,vue,markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" autocmd TermOpen * set nonu
autocmd FileType python set colorcolumn=80
autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet



" 插件相关配置
" vim-gitgutter
let g:gitgutter_map_keys = 0 "关闭所有键位映射


" vim-autoformater
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatter_yapf_style = 'google'
noremap <leader>a :Autoformat<CR>


" vim-markdown
" let g:instant_markdown_autostart = 0 "关闭chrome自动打开
" "使用 :InstantMarkdionPreview 打开chrome预览
" let g:vim_markdown_folding_disabled = 1 "禁用折叠
" let g:vim_markdown_conceal = 0 "禁用语法隐藏
" let g:vim_markdown_no_default_key_mappings = 1


" indentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['json']
" indentLine 不在json文件中加载, 目的是显示双引号


" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCreateDefaultMappings = 0
map <leader>z <plug>NERDCommenterToggle


" vim-isort
let g:vim_isort_map = ''
let g:vim_isort_python_version = 'python3'


" tagbar
let g:tagbar_width = 30
nmap <F8> :TagbarToggle<CR>


" ale
" npm install -g eslint bable-eslint
" pip install flake8 autopep8 mypy
" {
"    "extends": "standard",
"    "parser": "babel-eslint"
" }

let g:ale_linters = {
            \ 'python': ['flake8', 'mypy'],
            \ 'reStructuredText': ['rstcheck'],
            \ 'go': ['go build', 'golint', 'gofmt', 'go vet', 'goimports'],
            \ }

" let g:syntastic_python_flask8_post_args="--max-line-length=120"
let g:ale_python_mypy_options = '--ignore-missing-imports --follow-imports=skip --no-strict-optional'
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8'], 'go': ['goimports', 'gofmt']}
nmap <silent> <C-p> <Plug>(ceale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '✘'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_cache_executable_check_failures = 1
let g:ale_set_highlights = 0 " disable ale's error and warning highlights
highlight ALEErrorSign ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=#e0211d
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
highlight ALEWarningLine ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight ALEErrorLine ctermbg=NONE ctermfg=red guibg=NONE guifg=#e0211d
highlight ALEInfoLine ctermbg=NONE ctermfg=black guibg=NONE guifg=#e18254


" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_max_num_candidates = 14
let g:ycm_max_num_identifier_candidates = 7
" set completefunc=youcompleteme#Complete
set completeopt=longest,menu   " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
nnoremap <leader>j :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>k :YcmCompleter GoToDefinition<CR>
nnoremap <leader>l :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>    "open locationlist
" nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_show_diagnostics_ui = 0 "close syntax checked
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'css' : ['re!^\s{4}', 're!:\s+'],
  \   'html' : ['</'],
  \ }



" NERDTree setting
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1 " 是否显示隐藏文件
let NERDTreeWinSize=30 " 设置宽度
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 按下 F1 调出/隐藏 NERDTree
map <F2> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '\.git$', '^migrations$', 'node_modules', '^.pytest_cache$', '^.mypy_cache$']
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" vim-go
" let g:go_template_autocreate = 0
" let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1
" let g:go_fmt_command = "gofmt"
" let g:go_fmt_autosave = 0
" let g:go_version_warning = 0
" let g:go_list_type = "quickfix"
" let g:go_fmt_fail_silently = 0
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_term_height = 10


" autocmd FileType go nnoremap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run-split)
" autocmd FileType go nnoremap <leader>r  :exec '!go run' shellescape(@%, 1)<cr>
" autocmd FileType go nnoremap <Leader>v <Plug>(go-def-split)
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" LeaderF
let g:Lf_ReverseOrder = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_CursorBlink = 0
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg', 'anaconda3', 'Download', 'node_modules', '.*', 'venv', 'migrations', '__pycache__'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[cod]']
            \}

