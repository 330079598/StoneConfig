syntax on                " 自动语法高亮
set mouse=a              " 鼠标可以点击指定位置
set number               " 开启行号显示
set ttimeoutlen=0        " 设置<ESC>键响应时间
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示搜索结果
set hlsearch
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif




call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
call plug#end()




" ale 配置
" 对应语言需要安装相应的检查工具
" https://github.com/w0rp/ale
"    let g:ale_linters_explicit = 1 "除g:ale_linters指定，其他不可用
"    let g:ale_linters = {
\   'cpp': ['cppcheck','gcc'],
\   'c': ['cppcheck', 'gcc'],
"\   'python': ['pylint'],
"\   'bash': ['shellcheck'],
"\   'go': ['golint'],
"\}
"
    let g:ale_sign_column_always = 1
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:airline#extensions#ale#enabled = 1
    "let g:ale_set_quickfix = 1
    "let g:ale_open_list = 1"打开quitfix对话框

    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''

    let g:ale_sign_error = ">>"
    let g:ale_sign_warning = "--"
    map <F7> ::ALEToggle<CR>


" YouCompleteMe 配置
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✗'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" 已经使用cpp-mode插件提供的转到函数实现的功能
" nnoremap <leader>i :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>



" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


" AsyncRun配置
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" <F5> 编译单个文件夹
nnoremap <silent> <F5> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" <F8> 表示运行
nnoremap <silent> <F8> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"用双引号引起来避免文件名包含空格，“-cwd=$(VIM_FILEDIR)”
"的意思时在文件文件的所在目录运行可执行，后面可执行使用了全路径，避免 linux
"下面当前路径加 “./” 而 windows 不需要的跨平台问题。
"参数 `-raw` 表示输出不用匹配错误检测模板 (errorformat) ，直接原始内容输出到
"quickfix 窗口。这样你可"以一边编辑一边 F9 编译，出错了可以在 quickfix
"窗口中按回车直接跳转到错误的位置，编译正确就接着执行
"接下来是项目的编译，不管你直接使用 make 还是 cmake，都是对一群文件做点什么，都需要定位到文件所属项
"目的目录，AsyncRun 识别当前文件的项目目录方式和 gutentags相同，从文件所在目录向上递归，直到找到名为
".git”, “.svn”, “.hg”或者 “.root”文件或者目录，如果递归到根目录还没找到，那么文件所在目录就被当作项
"目目录，你重新定义项目标志：
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" 然后在 AsyncRun 命令行中，用 “<root>” 或者 “$(VIM_ROOT)”来表示项目所在路径，于是我们可以定义按 F7 
" 编译整个项目：
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" <F9> 运行当前项目
nnoremap <silent> <F9> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>

