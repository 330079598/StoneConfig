let mapleader = "|"      " 定义<leader>键
syntax on                " 自动语法高亮
"colo skeletor"
color dracula
set ttimeoutlen=0        " 设置<ESC>键响应时间
set smartindent          " 智能的选择对其方式
set softtabstop=4        " 设置4个空格为制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set mouse=a              " 鼠标可以点击指定位置
set number               " 开启行号显示
set ttimeoutlen=0        " 设置<ESC>键响应时间
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set relativenumber       " 开启相对行号 
"总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示搜索结果
set hlsearch
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set autowrite           " 设置自动保存
set viminfo='1000,<500  "最主要的是输入<500,它是设置寄存器保存的行数的。即最大值为 500"




call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'  " 自动补全
Plug 'w0rp/ale'  " 检查语法错误
Plug 'vim-airline/vim-airline'  " 状态栏美化插件
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'   " 自动补全引号、圆括号、花括号
Plug 'skywind3000/asyncrun.vim'  " 好像是一键运行的插件
Plug 'tpope/vim-endwise'  " if/end/endif/endfunction补全
Plug 'rhysd/github-complete.vim'  " enoji补全
Plug 'mhinz/vim-startify'  " vim起始页面
Plug 'scrooloose/nerdtree'  " NerdTree显示git状态
Plug 'ryanoasis/vim-devicons'  " 显示文件类型图标
Plug 'Yggdroot/indentLine'    " 代码缩进线
Plug 'scrooloose/nerdtree'      " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'  " NerdTree显示git状态
Plug 'vim-airline/vim-airline'   " 状态栏美化插件
Plug 'junegunn/gv.vim'    " 显示git提交记录
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree文件类型高亮
Plug 'skywind3000/asyncrun.vim'  " 一键运行
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()




"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>



" nerdtree
"nnoremap <silent> <leader>n :NERDTreeToggle<cr>
"inoremap <silent> <leader>n <esc> :NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'



" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


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



" gv这个再看看，不懂
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>


" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <F6> :call CompileRunGcc()<CR>

"func! CompileRunGcc()
   " exec "w" 
  "  if &filetype == 'c' 
       " exec '!g++ % -o %<'
       " exec '!time ./%<'
   " elseif &filetype == 'cpp'
        "exec '!g++ % -o %<'
       " exec '!time ./%<'
    "elseif &filetype == 'python'
       " exec '!time python %'
   " elseif &filetype == 'sh'
       " :!time bash %
   " endif                                                                              
 "endfunc
"

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"F5编译
nnoremap <silent> <F5> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"F6运行
"nnoremap <silent> <F6> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

