if v:version < 700
	echoerr 'This _vimrc requires Vim 7 or later.'
	quit
endif

" =====================================================
	" 自动载入VIM配置文件
" =====================================================
if has("win32")
  	autocmd! bufwritepost _vimrc source %
	set guifont=Consolas:h14:cANSI
	set rtp+=$HOME/.vim/*
else
	autocmd! bufwritepost .vimrc source %
  	set guifont=Source\ Code\ Pro\ :14
endif
" =====================================================
" Vim帮助文档
" =====================================================
:source $VIMRUNTIME/ftplugin/man.vim

  set tags+=$HOME/.vim/systags "将系统已经生成的tags导入
  set tags+=$HOME/.vim/stl/stl.tags "将系统已经生成的tags导入
" =====================================================
" 环境配置
" =====================================================
set go=tm
set helplang=cn     " 中文帮助
set history=500     " 保留历史记录
set nocompatible    " 设置不兼容VI
"set textwidth=100  " 设置每行100个字符自动换行，加上换行符
set wrap            " 显示文本时自动折行，不影响保存
set linebreak       " 显示文本时英文单词在wrap换行时不被截断 按照breakat的字符折行 lbr
set tabpagemax=15   " 最多15个标签
set showtabline=1   " 0 永不显示标签栏 1 至少两个时显示 2 总是显示标签栏
set noerrorbells    " 关闭遇到错误时的声音提示
set novisualbell    " 不要闪烁
set t_vb=           " close visual bell
au GuiEnter * set t_vb= "关闭beep
filetype plugin indent on " 打开文件类型检测
set ruler           " 显示标尺
set number          " 行号
set numberwidth=4
set rulerformat=%15(%c%V\ %p%%%)
set t_Co=256        " 设置256色
set cmdheight=1     " 设置命令行的高度
set laststatus=2    " 始终显示状态行
set scrolloff=2     " 光标移到buffer的顶部与底部保持行距离
"au FileType c,cpp,python set cc=81 "高亮第81列
set showcmd         " 状态栏显示目前所执行的指令
set cursorline      " 高亮光标所在行
"set cursorcolumn   " 高亮光标所在列
set nohlsearch      " 高亮显示搜索的内容
set incsearch       " 显示查找匹配过程
set magic           " Set magic on, for regular expressions
set showmatch       " Show matching bracets when text indicator is over them
set mat=2           " How many tenths of a second to blink
set tabstop=4       " 制表符(设置所有的tab和缩进为4个空格)
set shiftwidth=4
set softtabstop=4
set expandtab       " 使用空格来替换tab
set smarttab


set hlsearch
set incsearch
set ignorecase
set smartcase

"set list           " 显示tab和空格
set listchars=tab:\|\ ,nbsp:%,trail:-   " 设置tab和空格样式
set autoindent      " 复制上一行的缩进
set smartindent     " 设置智能缩进
au FileType c,cpp set cin             " 设置C语言形式的缩进
set autoread        " 当文件在外部被修改，自动更新该文件
set mouse=a         " 设定在任何模式下光标都可用
set backspace=indent,eol,start " 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set nobackup        " 无备份和缓存
set nowb
set noswapfile
set complete=.,w,b,k,t,i
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本
set wildmenu        " 增强模式下的命令行自动完成功能
set foldnestmax=2   " 折叠深度
"set foldcolumn=2    " 设置折叠窗口的宽度
set foldopen=all    " 光标遇到折叠时。折叠自动打开
set foldclose=all   " 移动光标离开折叠时自动折叠
set foldlevel=100   " 启动时不要自动折叠代码
set foldmethod=marker  " 按语法折叠
set foldmethod=syntax
"set bsdir=buffer    " 设定文件浏器目录为当前目录
autocmd BufEnter * silent! lcd %:p:h
"set autochdir       " 自动切换当前目录为当前文件所在的目录
"set binary					"维持文件末尾原样 不自动添加空行
"autocmd VimLeave * mksession! Session.vim
"set noendofline binary "避免在文件末尾添加空行
func! ShortTabLabel() "去除当前所编辑文件的路径信息，只保留文件名
	let bufnrlist = tabpagebuflist(v:lnum)
	let label = bufname(bufnrlist[tabpagewinnr(v:lnum) -1])
	let filename = fnamemodify(label, ':t')
	return filename
endfunc
""set guitablabel=%{ShortTabLabel()}
""set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ [PATH]\ %{getcwd()}%h\ %=\ [line]%l/%L\ [col]%c/%V


inoremap jj <Esc>

" =====================================================
" 多语言环境 默认为 UTF-8 编码
" =====================================================
if has("multi_byte")
	set encoding=utf-8
	let &termencoding=&encoding
  set fileencodings=utf-8,cp936,gb2312,gbk,gb18030,ucs-2le,chinese
  set fileformats=unix,dos
  au BufRead * set fileencodings=utf-8,cp936,gb2312,gbk,gb18030,ucs-2le,chinese
  au BufRead * set fileformats=unix,dos
	"vim编码猜测列表
	if has('win32')
		source $VIMRUNTIME/delmenu.vim		" 处理consle输出乱码
		source $VIMRUNTIME/menu.vim
	endif
  "存储编码
	set fileencoding=utf-8
	language messages zh_CN.utf-8
	set formatoptions+=mM           " 正确处理中文字符的折行和拼接
	set nobomb                      " 不使用 Unicode 签名
	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
" =====================================================
" 快捷键
" =====================================================
"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","
"设置快速保存和退出
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
"打开与关闭标签
nmap <leader>tt :tabnew .<cr>
nmap <leader>tc :tabclose<cr>

" =====================================================
" 插件配置
" =====================================================

" =====================================================
" 设置c.vim
" =====================================================
let g:C_LineEndCommColDefault    = 80
let g:Templates_MapInUseWarn = 0		"cvim的配置
"let g:C_MapLeader = '\'
"let g:C_Ctrl_j_Mode = 'j' "跳转至下一补全处，例如+argumentlist+
let g:C_GlobalTemplateFile='/home/turing/.vim/bundle/c.vim/c-support/templates/Templates'

" =====================================================
" 设置OmniCpp 主要用于补全类 结构体 函数 成员
" =====================================================
"let OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteDot = 1 " autocomplete with .
let g:OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let g:OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let g:OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let g:OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let g:OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let g:OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let g:OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
let g:OmniCpp_ShowScopeInAbbr=0 " show scope in abbreviation and remove the last column
let g:OmniCpp_ShowAccess=1

" =====================================================
" 设置XPT 主要用于生成代码段
" =====================================================
let g:xptemplate_vars = 'author=dou&email=douxiaozhao@gmail.com'

" =====================================================
" 设置code_complete 主要用于补全函数参数
" =====================================================
let g:completekey ="<TAB>"

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" =====================================================
" ctags cscope setting
" 自动生成cscope与tags
" =====================================================
"递归查找tag cscope.out"
if has('win32')
  set csprg=cscope
else
  set csprg=/usr/bin/cscope
endif
function! Do_CsTag()
	let dir = getcwd()
	"ctags"
	if(executable('ctags'))
		if filereadable("../tags")
      if has('win32')
				silent! execute "let NOWDIR=getcwd()|cd ../"
				silent! execute "!gentags.bat"
				silent! execute "cd NOWDIR"
			else
        if ( &filetype == "c" )
          silent! execute "!NOWDIR=$(pwd);cd ../;ctags -aR --c-kinds=+p --fields=+iaS --extra=+q -f tags $(pwd)/;cd $NOWDIR"
        elseif ( &filetype == "cpp" )
          silent! execute "!NOWDIR=$(pwd);cd ../;ctags -aR --c++-kinds=+p --fields=+iaS --extra=+q -f tags $(pwd)/;cd $NOWDIR"
        else
          silent! execute "!NOWDIR=$(pwd);cd ../;ctags -aR --fields=+iaS --extra=+q -f tags $(pwd)/;cd $NOWDIR"
        endif
			endif
			"set tags+=../tags
		else
			if has('win32')
				silent! execute "!gentags.bat"
			else
        if ( &filetype == "c" )
          silent! execute "!ctags -aR --c-kinds=+p --fields=+iaS --extra=+q -f tags $(pwd)/"
        elseif ( &filetype == "cpp" )
          silent! execute "!ctags -aR --c++-kinds=+p --fields=+iaS --extra=+q -f tags $(pwd)/"
        else
          silent! execute "!ctags -aR --fields=+iaS --extra=+q -f tags $(pwd)/"
			endif
			endif
			set tags+=./tags,tags
		endif
	endif
	"cscope"
	if (executable('cscope') && has("cscope") )
		silent! execute "cs kill -1"
		if ( filereadable("../cscope.out") )
			if has('win32')
				silent! execute "let NOWDIR=getcwd()|cd ../"
				silent! execute "!gencscope.bat"
				silent! execute "cd NOWDIR"
			else
        silent! execute "!NOWDIR=$(pwd);cd ../;find $(pwd)/  -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.js' -o -name '*.html' >$(pwd)/cscope.files;cscope  -Rbqk 2>/dev/null >&1 ;cd $NOWDIR"
			endif
			execute "normal :"
			set nocsverb
			exec "cs add ../cscope.out"
			set csverb
		else
			if has('win32')
				silent! execute "!gencscope.bat"
			else
				silent! execute "!find $(pwd)/  -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.js' -o -name '*.html' >$(pwd)/cscope.files"
				silent! execute "!cscope -Rbqk 2>/dev/null >&1 "
			endif
			execute "normal :"
			set nocsverb
			exec "cs add cscope.out"
			set csverb
		endif
	endif
endf

if filereadable("../tags")
  set tags+=../tags
elseif filereadable("./tags")
    set tags+=./tags,tags
endif
"cscope"
if (executable('cscope') && has("cscope") )
  silent! execute "cs kill -1"
  if filereadable("../cscope.out")
    set nocsverb
    exec "cs add ../cscope.out"
    set csverb
  else
    if filereadable("./cscope.out")
    set nocsverb
    exec "cs add cscope.out"
    set csverb
  endif
endif
endif
set cst    "同时查找tags cscope
set csto=1 "优先查找tags



"cscope配置"
"s  查找C语言符号，函数 宏 枚举     g  查找选中量定义的位置，类似ctags的功能
"c  查找调用本函数的函数            t  查找指定的字符串
"e  查找egrep模式 相当于egrep功能   f  查找并打开文件，类似vim的find功能
"i  查找包含本文的文件              d  查找本函数调用的函数
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sc :cs find c <c-r>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
au BufWritePost *.c,*.cpp,*.h,*.java,*.html,*.js,*.php call Do_CsTag()  " 修改后自动更新tags cscope.out 苗
"au BufWritePost *.c,*.cpp,*.h,*.html,*.js,*.php call Do_CsTag()  " 修改后自动更新tags cscope.out  豆

map <F2> :call Do_CsTag()<cr>:redraw!<cr>



map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" =====================================================
"<F3>   调出winmanager的文件浏览器
" =====================================================
let g:winManagerWidth=25    "buffer宽度
function! BufExplorer()
    call BufExplorer(...)
endfunction
let  g:winManagerWindowLayout = 'FileExplorer|BufExplorer'
map <F3> :WMToggle<cr>

" =====================================================
"<F4> 打开tag浏览器 默认为Taglist  面向对象语言是Tagbar  面向过程语言是Taglist
" =====================================================
"tag浏览设置"
func! TagConf()
	if ( &filetype == "c" )
		let g:Tlist_Inc_Winwidth=0            " 禁止自动改变当前Vim窗口的大小
		let g:Tlist_Use_Right_Window=1        " 把方法列表放在屏幕的右侧
		let g:Tlist_File_Fold_Auto_Close=1    " 让当前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间
		let g:Tlist_Auto_Highlight_Tag = 1    " 是否高亮显示当前标签
		let g:Tlist_Auto_Open = 0             " 自动打开Tlist
		let g:Tlist_Auto_Update = 1           " 自动更新Tlist
		let g:Tlist_Close_On_Select = 0       " 选择标签或文件后是否自动关闭标签列表窗口
		let g:Tlist_Compact_Format = 1        " 压缩方式
		let g:Tlist_Display_Prototype = 0     " 是否在标签列表窗口用标签原型替代标签名
		let g:Tlist_Display_Tag_Scope = 1     " 在标签名后是否显示标签有效范围
		let g:Tlist_Enable_Fold_Column = 0    " 不显示折叠树
		let g:Tlist_Exit_OnlyWindow = 1       " 关闭VIM同时关闭Tlist
		let g:Tlist_Show_One_File = 1
    let g:Tlist_GainFocus_On_ToggleOpen = 1 " 为1则使用TlistToggle打开标签列表窗口后会获焦点至于标签列表窗口；为0则taglist打开后焦点仍保持在代码窗口
		let g:tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
		exec "TlistToggle"
  else
		exec "TagbarToggle"
		"let g:tagbar_foldlevel = 2          " 设置tagbar的折叠级别
	endif
endfunc
map <F4> :call TagConf()<cr>

" =====================================================
"<F5>   Lookupfile
" =====================================================
let g:LookupFile_TagExpr = '"tags"' " lookup file tag file

" =====================================================
"自动检测编码用F6控制(fencview.vim)
" =====================================================
let g:fencview_autodetect=1					"关闭自动检测编码用F6控制(fencview.vim)
map <F6> :FencView<cr>

" =====================================================

"<F7>   源代码格式化
" =====================================================
"定义FormartSrc()
"C程序,Perl程序,Python程序Java程序
func! FormartSrc()
	exec "w"
	if &filetype == 'c'
		silent exec "!astyle --style=ansi -U  --break-elseifs  --suffix=none %"
		silent exec "e! %"
	elseif &filetype == 'cpp'
		silent exec "!astyle -q --style=kr -U   --break-elseifs  --suffix=none %"
		silent exec "e! %"
	elseif &filetype == 'java'
		exec "!astyle --style=java --suffix=none %"
		exec "e! %"
  else
    exec "!astyle --style=ansi --suffix=none %"
		exec "e! %"
	endif
	return
endfunc
if has('unix')
	map <F7> :call FormartSrc()<cr><cr>
endif

" =====================================================
"<F8> ConqueTerm配置
" =====================================================
"let g:ConqueTerm_ToggleKey = '<F8>'


" =====================================================
"<F10> project配置
" =====================================================
let g:groj_flags='scL'	"当选择文件时 显示其路径
nmap <silent><F10> <PLUG>ToggleProject


" =====================================================
"<F12>   checksyntax
" 设置Synax info  打开<leader>l
" =====================================================
let g:syntastic_check_on_open = 1
"When set to 1 the cursor will always jump to the first issue detected.
let g:syntastic_auto_jump = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'


" ==================================================
" VimWiki 配置
" ==================================================
"let tlist_vimwiki_settings = 'wiki;h:Headers'       " ~/.ctags使taglist支持wikitag
"let g:vimwiki_camel_case = 0                        " 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
"let g:vimwiki_hl_cb_checked = 1                     " 标记为完成的 checklist 项目会有特别的颜色
""let g:vimwiki_menu = ''                            " 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
"let g:vimwiki_folding = 1                           " 是否开启按语法折叠 会让文件比较慢
"let g:vimwiki_CJK_length = 1                        " 是否在计算字串长度时用特别考虑中文字符,对vim73用户该选项已经过时
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,pre' " 设置在wiki内使用的html标识...
"let g:vimwiki_use_mouse = 1                         " 启用鼠标
"let g:vimwiki_hl_cb_checked = 1
"let g:vimwiki_calendar = 1                          " 使用日历,默认开启
"let g:vimwiki_auto_checkbox = 0
"let g:vimwiki_html_header_numbering = 2 "开启标题的编号 从二级标题开始
"let privatewiki = {}								"新建privatewiki配置
"let sharewiki = {}									"新建sharewiki配置
"let sharewiki.index = 'index'
"nmap <leader>va :VimwikiAll2HTML<cr>
"let g:vimwiki_list=[privatewiki,sharewiki]					" 注册vimwiki
"",vh 快速转化为html .vb快速转化后浏览器浏览 ,va 所有转化为html
"nmap <leader>vh :Vimwiki2HTML<cr>
"nmap <leader>vb :Vimwiki2HTMLBrowse<cr>
""map <Leader>wd <Plug>VimwikiDeleteLink             " 删除当前页
""map <Leader>rr <Plug>VimwikiRenameLink             " 更改当前页的名称
""map <leader>wq <Plug>VimwikiToggleListItem					" 对[]中的选中切换
"au FileType vimwiki set ff=unix fenc=utf-8 noswapfile nobackup
"au FIleType vimwiki set cursorcolumn                " wiki页面使用列高亮 便于列对齐

" =====================================================
" 主题配色
" =====================================================
if has('syntax')
	au BufNewFile,BufRead *.doxygen setfiletype doxygen
	" 各不同类型的文件配色不同 保证语法高亮
  if has("win32")
    au BufNewFile,BufRead,BufEnter,WinEnter * colo molokai "motus herald lucius wombat256
    au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo molokai "motus herald lucius
  else
    au BufNewFile,BufRead,BufEnter,WinEnter * colo molokai "motus herald lucius wombat256
    au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo molokai "motus herald lucius
  endif
  syntax on
endif

" =====================================================
" WEB DEV
" =====================================================
"配置tab宽度
au FileType html,vim,javascript,tpl setl shiftwidth=2 "cindent缩进的空格数"
au FileType html,vim,javascript,tpl setl tabstop=2    "打印时tab占用的空格数"
au FileType java,php,python setl shiftwidth=4
au FileType java,php,python setl tabstop=4

" =====================================================
" ZenCodeing
" =====================================================
let g:user_zen_settings = {
      \ 'php' : {
      \ 'extends' : 'html',
      \ 'filters' : 'c',
      \ },
      \ 'xml' : {
      \ 'extends' : 'html',
      \ },
      \ 'haml' : {
      \ 'extends' : 'html',
      \ },
      \}
let g:user_zen_expandabbr_key = '<Tab>'
let g:user_emmet_leader_key ="<C-e>"

" ==================================================
" powerline配置
" ==================================================
""let g:Powerline_symbols ='fancy'
"au BufEnter * PowerlineReloadColorscheme

" ==================================================
" 插件管理
" ==================================================
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
call vundle#begin()
Bundle 'gmarik/vundle'


Bundle 'scrooloose/nerdtree'

Bundle 'blak3mill3r/c.vim'


Bundle 'plasticboy/vim-markdown'

Bundle 'mattn/emmet-vim'
Bundle 'xptemplate'
Bundle 'cecutil'

Bundle 'genutils'

Bundle 'code_complete'
Bundle 'Tagbar'

"Bundle 'vimwiki'

Bundle 'winmanager'

Bundle 'OmniCppComplete'

Bundle 'bufexplorer.zip'

Bundle 'adah1972/fencview'

Bundle 'surround.vim'

Bundle 'taglist.vim'

Bundle 'vimcn/vimwiki.vim.cnx'



Bundle 'jkeylu/vimdoc_cn'

Bundle 'Valloric/ListToggle'

Bundle 'scrooloose/syntastic'

Bundle 'turing1988/Conque-Shell'

"Bundle 'Lokaltog/vim-powerline'
Bundle 'Auto-Pairs'
call vundle#end()
filetype plugin indent on
"mark.vim
" vim: set et sw=4 ts=4 sts=4 fdm=marker ft=vim ff=unix fenc=utf8:
