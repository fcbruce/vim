" Vim color file
" Maintainer: fcbruce <fcbruce8964@gmail.com>	
" Last Change:	2014 Sep 23

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "fcbruce"
hi Normal		guifg=white	guibg=darkBlue	ctermfg=white	ctermbg=black
hi NonText		guifg=magenta	ctermfg=lightMagenta
hi comment		guifg=darkBlue		ctermfg=darkBlue	ctermbg=black	gui=bold 
hi constant		guifg=cyan		ctermfg=cyan
hi identifier	guifg=gray		ctermfg=red
hi statement	guifg=yellow	ctermfg=yellow	ctermbg=black	gui=none
hi preproc		guifg=green		ctermfg=green
hi type			guifg=orange	ctermfg=lightGreen	ctermbg=black
hi special		guifg=magenta	ctermfg=lightMagenta	ctermbg=black
hi Underlined	guifg=cyan		ctermfg=cyan	gui=underline	cterm=underline
hi label		guifg=white 	ctermfg=white
hi operator		guifg=orange	gui=bold	ctermfg=lightRed	ctermbg=black

hi ErrorMsg		guifg=orange	guibg=darkBlue	ctermfg=white
hi WarningMsg	guifg=cyan		guibg=darkBlue	ctermfg=cyan	gui=bold
hi ModeMsg		guifg=white 	gui=NONE	ctermfg=white
hi MoreMsg		guifg=white 	gui=NONE	ctermfg=white
hi Error		guifg=red		guibg=darkBlue	gui=underline	ctermfg=white ctermbg=black

hi Todo			guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi Cursor		guifg=black		guibg=white		ctermfg=black	ctermbg=white
hi Search		guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi IncSearch	guifg=black		guibg=yellow	ctermfg=black	ctermbg=darkYellow
hi LineNr		guifg=cyan		ctermfg=cyan
hi title		guifg=white	gui=bold	cterm=bold

hi StatusLineNC	gui=NONE	guifg=black guibg=blue	ctermfg=black  ctermbg=blue
hi StatusLine	gui=bold	guifg=cyan	guibg=blue	ctermfg=cyan   ctermbg=blue
hi VertSplit	gui=none	guifg=blue	guibg=blue	ctermfg=blue	ctermbg=blue

hi Visual		term=reverse		ctermfg=black	ctermbg=darkCyan	guifg=black		guibg=darkCyan

hi DiffChange	guibg=darkGreen		guifg=black	ctermbg=darkGreen	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		guibg=slateblue		guifg=black		ctermbg=blue		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black	ctermbg=cyan		ctermfg=black

hi Folded		guibg=orange		guifg=black		ctermbg=white	ctermfg=black
hi FoldColumn	guibg=gray30		guifg=black	ctermbg=gray		ctermfg=black
hi cIf0			guifg=gray			ctermfg=gray

