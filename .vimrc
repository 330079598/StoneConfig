let mapleader = '|' " 定义<leader>键
syntax on                " 自动语法高亮
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white 
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white "colo skeletor"
syntax enable
set cursorline   " 高亮当前行
set scrolloff=7
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
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
"set autowrite           " 设置自动保存
"set confirm             " 在处理未保存或只读文件的时候，弹出确认
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set ttimeoutlen=0        " 设置<ESC>键响应时间
"au FileType c,cpp setlocal comments-=:// comments+=f://
"set paste
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
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
"Plug 'scrooloose/nerdtree'      " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'  " NerdTree显示git状态
Plug 'vim-airline/vim-airline'   " 状态栏美化插件
Plug 'junegunn/gv.vim'    " 显示git提交记录
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree文件类型高亮
Plug 'jistr/vim-nerdtree-tabs'
Plug 'skywind3000/asyncrun.vim'  " 一键运行
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
call plug#end()
" markdown
let g:mkdp_path_to_chrome = "/usr/bin/google-chrome-stable"
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>
map <silent> <F7> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>StopMarkdownPreview
 let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览



let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

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
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeIgnore = ['\~$','\.pyc$','\*NTUSER*','\*ntuser*','\NTUSER.DAT','\ntuser.ini']


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

map <F6> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
 endfunc
"

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 10

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"F5编译
map <silent> <F5> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"F6运行
"nnoremap <silent> <F6> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

"ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
"let g:syntastic_error_symbol = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

set completeopt-=preview   " 让补全行为与一般的IDE一致
let g:ycm_cache_omnifunc=0 " 在注释中也可以补全



" Rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" 重新打开vim后,光标定位到上一次的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" vim主题配置      1            抱歉,我的只可以手动选择,哈哈哈!
colorscheme gruvbox
set background=dark    " Setting dark mode


"                 2
"color dracula

" vim-table-mode Markdown表格自动对齐
function! s:isAtStartOfLine(mapping)
      let text_before_cursor = getline('.')[0 : col('.')-1]
      let mapping_pattern = '\V' . escape(a:mapping, '\')
      let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
      return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
        
inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Use this option to define the table corner character
 let g:table_mode_corner = '|'
" " Use this option to define the delimiter which used by
 let g:table_mode_delimiter = ' '


let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}


" NERDTree 高亮括号解决
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let g:rainbow_conf = {
	\	'separately': {
	\		'nerdtree': 0,
	\	}
	\}
