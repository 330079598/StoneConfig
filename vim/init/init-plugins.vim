"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在~/.vim/plugged 下安装插件
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" coc
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" 检查语法错误
Plug 'w0rp/ale'

" 状态栏美化插件
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" 自动补全引号、圆括号、花括号
Plug 'jiangmiao/auto-pairs' 

" 一键运行的插件
Plug 'skywind3000/asyncrun.vim'

" if/end/endif/endfunction补全
Plug 'tpope/vim-endwise'  

" enoji补全
Plug 'rhysd/github-complete.vim'  

" vim起始页面
Plug 'mhinz/vim-startify'

" 显示文件类型图标
Plug 'ryanoasis/vim-devicons' 

" 代码缩进线
Plug 'Yggdroot/indentLine'

" NerdTree
Plug 'scrooloose/nerdtree'  

" NerdTree显示git状态
Plug 'Xuyuanp/nerdtree-git-plugin' 

" 显示git提交记录
Plug 'junegunn/gv.vim'

" NerdTree文件类型高亮
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 

Plug 'jistr/vim-nerdtree-tabs'

Plug 'iamcco/mathjax-support-for-mkdp'

Plug 'iamcco/markdown-preview.vim'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'luochen1990/rainbow'

Plug 'dhruvasagar/vim-table-mode' 

Plug 'dracula/vim', { 'as': 'dracula' }

" 主题插件
Plug 'morhetz/gruvbox'

Plug 'Shougo/echodoc.vim'

"注释插件
Plug 'preservim/nerdcommenter'  

Plug 'hzchirs/vim-material'

"代码格式化
Plug 'Chiel92/vim-autoformat'  

"主题插件
Plug 'whatyouhide/vim-gotham' 

Plug 'bling/vim-bufferline'

Plug 'NLKNguyen/papercolor-theme'

if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif


call plug#end()


"----------------------------------------------------------------------
" markdown 插件設置
"----------------------------------------------------------------------
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

"----------------------------------------------------------------------
" ale 插件設置
"----------------------------------------------------------------------
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

"----------------------------------------------------------------------
" nerdtree 插件設置
"----------------------------------------------------------------------
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
let g:NERDTreeGitStatusShowIgnored = 1


"----------------------------------------------------------------------
" nerdtree-git-plugin 插件設置
"----------------------------------------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
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


"----------------------------------------------------------------------
" airline 插件設置
"----------------------------------------------------------------------
"let g:airline_theme="moloai"
let g:airline_theme='simple'
"let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
set laststatus=2  "永远显示状态栏


"----------------------------------------------------------------------
" rainbos 插件設置
"----------------------------------------------------------------------
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


"----------------------------------------------------------------------
" coc 插件設置
"----------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"----------------------------------------------------------------------
" echodoc 插件設置
"----------------------------------------------------------------------
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

"----------------------------------------------------------------------
" 
"----------------------------------------------------------------------
let g:indentLine_char_list = ['┊']
