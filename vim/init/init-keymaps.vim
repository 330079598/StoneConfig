"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k> 

"-----------------------------------------------------------------------
" 分屏窗口移动
"-----------------------------------------------------------------------
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译 C/C++ 文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F5 运行文件
nnoremap <silent> <F5> :call ExecuteFile()<cr>

" F7 编译项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 运行项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 测试项目
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" 更新 cmake
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>


"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
	" Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
	" -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	if has('win32') || has('win64')
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
	else
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
	endif
endfunc