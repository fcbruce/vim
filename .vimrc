map <F8> : call Debug()<CR>
func! Debug()
  exec "w"
  exec "!gdb %<"
endfunc

map <c-F5> : call Compile()<CR>
func! Compile()
  if expand("%:e") == "cpp" || expand("%:e") == "cxx" || expand("%:e") == "cc" || expand("%:e") == "c++"
    exec "w"
    exec "!g++ % -o %< -O2 -Wall -std=gnu++0x -static -lm -g -DFCBRUCE"
  endif
  
  if expand("%:e") == "c"
    exec "w"
    exec "!gcc % -o %< -O2 -Wall -std=gnu99 -static -lm -g"
  endif
  
  if expand("%:e") == "java"
    exec "w"
    exec "!javac % -encoding UTF-8 -sourcepath . -d ."
  endif
endfunc

map <F5> : call Run()<CR>
func! Run()
  if expand("%:e") == "cpp" || expand("%:e") == "cxx" || expand("%:e") == "cc" || expand("%:e") == "c++"
    exec "w"
    exec "!time ./%<"
  endif
 
  if expand("%:e") == "c"
    exec "w"
    exec "!time ./%<"
  endif
  
  if expand("%:e") == "java"
    exec "w"
    exec "!time java %<"
  endif
  
  if expand("%:e") == "py"
    exec "w"
    exec "!time python %"
  endif
endfunc


autocmd BufNewFile *.cpp,*.[ch],*.py,*.java,*.sh,*.cc,*cxx,*c++ exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 

  if &filetype == 'python' || &filetype == 'sh'
    if &filetype == 'sh'
      call setline(1,"#!/bin/bash")
    else
      call setline(1,"#")
    endif 
    call append(line("."), "#") 
    call append(line(".")+1, "# Author : fcbruce <fcbruce8964@gmail.com>") 
    call append(line(".")+2, "#") 
    call append(line(".")+3, "# Time : ".strftime("%c")) 
    call append(line(".")+4, "#") 
    call append(line(".")+5, "#")
    call append(line(".")+6, "")
  else
    call setline(1, "/*") 
    call append(line("."), " *") 
    call append(line(".")+1, " * Author : fcbruce <fcbruce8964@gmail.com>") 
    call append(line(".")+2, " *") 
    call append(line(".")+3, " * Time : ".strftime("%c")) 
    call append(line(".")+4, " *") 
    call append(line(".")+5, " */")
  endif
    
    if &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'cxx' || &filetype == 'c++'
        call append(line(".")+6, "#include <cstdio>")
        call append(line(".")+7, "#include <iostream>")
        call append(line(".")+8, "#include <sstream>")
        call append(line(".")+9, "#include <cstdlib>")
        call append(line(".")+10, "#include <algorithm>")
        call append(line(".")+11, "#include <ctime>")
        call append(line(".")+12, "#include <cctype>")
        call append(line(".")+13, "#include <cmath>")
        call append(line(".")+14, "#include <string>")
        call append(line(".")+15, "#include <cstring>")
        call append(line(".")+16, "#include <stack>")
        call append(line(".")+17, "#include <queue>")
        call append(line(".")+18, "#include <list>")
        call append(line(".")+19, "#include <vector>")
        call append(line(".")+20, "#include <map>")
        call append(line(".")+21, "#include <set>")
        call append(line(".")+22, "#define sqr(x) ((x)*(x))")
        call append(line(".")+23, "#define LL long long")
        call append(line(".")+24, "#define itn int")       
        call append(line(".")+25, "#define INF 0x3f3f3f3f")
        call append(line(".")+26, "#define PI 3.1415926535897932384626")
        call append(line(".")+27, "#define eps 1e-10")
        call append(line(".")+28, "")
        call append(line(".")+29, "#ifdef _WIN32")
        call append(line(".")+30, "  #define lld \"%I64d\"")
        call append(line(".")+31, "#else")
        call append(line(".")+32, "  #define lld \"%lld\"")
        call append(line(".")+33, "#endif")
        call append(line(".")+34, "")
        call append(line(".")+35, "#define maxm ")
        call append(line(".")+36, "#define maxn ") 
        call append(line(".")+37, "")
        call append(line(".")+38, "using namespace std;")
        call append(line(".")+39, "")
        call append(line(".")+40, "int main()")
        call append(line(".")+41, "{")
        call append(line(".")+42, "#ifdef FCBRUCE")
        call append(line(".")+43, "  freopen(\"/home/fcbruce/code/t\",\"r\",stdin);")
        call append(line(".")+44, "#endif // FCBRUCE")
        call append(line(".")+45, "")
        call append(line(".")+46, "")
        call append(line(".")+47, "")
        call append(line(".")+48, "")
        call append(line(".")+49, "  return 0;")
        call append(line(".")+50, "}")
    endif
    if &filetype == 'java'
        call append(line(".")+6, "import java.util.*;")
        call append(line(".")+7, "import java.math.*;")
        call append(line(".")+8, "import java.io.*;")
        call append(line(".")+9, "public class ".expand("%<"))
        call append(line(".")+10, "{")
        call append(line(".")+11, "  public static void main(String[] args)")
        call append(line(".")+12, "  {")
        call append(line(".")+13, "  ")
        call append(line(".")+14, "  ")
        call append(line(".")+15, "  ")
        call append(line(".")+16, "  }")
        call append(line(".")+17, "}")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


set t_Co=256
set background=light
colorscheme fcbruce
""colorscheme solarized


:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
  if getline('.')[col('.')-1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

""inoremap <tab> <c-r>=Smart_TabComplete()<CR>
""function! Smart_TabComplete()
""  let line = getline('.')                         " current line
""
""  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
""                                                  " line to one character right
""                                                  " of the cursor
""  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
""  if (strlen(substr)==0)                          " nothing to match on empty string
""    return "\<tab>"
""  endif
""  let has_period = match(substr, '\.') != -1      " position of period, if any
""  let has_slash = match(substr, '\/') != -1       " position of slash, if any
""  if (!has_period && !has_slash)
""    return "\<C-X>\<C-P>"                         " existing text matching
""  elseif ( has_slash )
""    return "\<C-X>\<C-F>"                         " file matching
""  else
""    return "\<C-X>\<C-O>"                         " plugin matching
""  endif
""endfunction

set fencs=utf-8,gbk,latin1 fenc=utf-8 enc=utf-8

"高亮当前行
set cul
"autocmd InsertEnter * se cul
"set cuc

"代码补全
set completeopt=preview,menu

" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible 

" history文件中需要记录的行数 
set history=100 

" 在处理未保存或只读文件的时候，弹出确认 
set confirm 

" 与windows共享剪贴板 
set clipboard+=unnamed 

" 侦测文件类型 
filetype on 

" 载入文件类型插件 
filetype plugin on 

" 为特定文件类型载入相关缩进文件 
filetype indent on 

" 保存全局变量 
set viminfo+=! 

" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,- 

" 语法高亮 
syntax enable
syntax on 

" 高亮字符，让其不受100列限制 
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white 
":match OverLength '\%101v.*' 

" 状态行颜色 
highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 文件设置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 不要备份文件（根据自己需要取舍） 
set nobackup 

" 不要生成swap文件，当buffer被丢弃的时候隐藏它 
setlocal noswapfile 
set bufhidden=hide 

" 字符间插入的像素行数目 
set linespace=0 

" 增强模式中的命令行自动完成操作 
set wildmenu 

" 在状态行上显示光标所在位置的行号和列号 
set ruler 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 

" 命令行（在状态行下）的高度，默认为1，这里是2 
set cmdheight=2 

" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=2 

" 允许backspace和光标键跨越行边界 
set whichwrap+=<,>,h,l 

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位） 
set mouse=a 
set selection=exclusive 
set selectmode=mouse,key 

" 启动的时候不显示那个援助索马里儿童的提示 
set shortmess=atI 

" 通过使用: commands命令，告诉我们文件的哪一行被改变过 
set report=0 

" 不让vim发出讨厌的滴滴声 
set noerrorbells 

" 在被分割的窗口间显示空白，便于阅读 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 搜索和匹配 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 高亮显示匹配的括号 
set showmatch 

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 

" 在搜索的时候忽略大小写 
set ignorecase 

" 不要高亮被搜索的句子（phrases） 
set nohlsearch 

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 

" 输入:set list命令是应该显示些啥？ 
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ 

" 光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3 

" 不要闪烁 
set novisualbell 

" 我的状态行显示的内容（包括文件类型和解码） 
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" 总是显示状态行 
set laststatus=2 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 文本格式和排版 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 自动格式化 
set formatoptions=tcrqn 

" 继承前一行的缩进方式，特别适用于多行注释 
set autoindent 

" 为C程序提供自动缩进 
set smartindent 

" 使用C样式的缩进 
set cindent 

""set indentexpr

" 制表符为2
set tabstop=2 

" 统一缩进为2
set softtabstop=2
set shiftwidth=2 

" 用空格代替制表符 
set expandtab 

" 不要换行 
set nowrap 

" 在行和段开始处使用制表符 
set smarttab 

set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" CTags的设定 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 按照名称排序 
let Tlist_Sort_Type = "name" 

" 在右侧显示窗口 
let Tlist_Use_Right_Window = 1 

" 压缩方式 
let Tlist_Compart_Format = 1 

" 如果只有一个buffer，kill窗口也kill掉buffer 
let Tlist_Exist_OnlyWindow = 1 

" 不要关闭其他文件的tags 
let Tlist_File_Fold_Auto_Close = 0 

" 不要显示折叠树 
let Tlist_Enable_Fold_Column = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Autocommands 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示 

if has("autocmd") 
autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,sh set number 
autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o--> 
autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o 
autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100 
autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim 
autocmd BufReadPost * 
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\ exe " normal g`\"" | 
\ endif 
endif "has("autocmd") 

