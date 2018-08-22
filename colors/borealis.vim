" borealis.vim
" Fork of nord.vim colorscheme
" The main colors still utilize the nord palette, but some of the UI elements
" are different from the normal nord color scheme (status line, etc).
"

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "borealis"

set background=dark

function! s:Highlight(group, fg, bg, opt)
    let l:str_fg = a:fg
    if type(a:fg) == v:t_number
        let l:str_fg = "#" . printf("%06x", a:fg)
    endif
    let l:str_bg = a:bg
    if type(a:bg) == v:t_number
        let l:str_bg = "#" . printf("%06x", a:bg)
    endif
    let l:cmd = "hi " . a:group . " guifg=" . l:str_fg . " guibg=" . l:str_bg
    if a:opt != ""
        let l:cmd = l:cmd . " gui=" . a:opt . " cterm=" . a:opt
    endif
    exec l:cmd
endfunction

function! s:Adjust(hex_code, factor)
    let l:red = min([0xff, float2nr(round(a:hex_code % 0x1000000 / 0x10000 * (1 + a:factor)))])
    let l:green = min([0xff, float2nr(round(a:hex_code % 0x10000 / 0x100 * (1 + a:factor)))])
    let l:blue = min([0xff, float2nr(round(a:hex_code % 0x100 * (1 + a:factor)))])
    return 0x10000 * l:red + 0x100 * l:green + l:blue
endfunction

let s:nord0  = 0x2e3440
let s:nord1  = 0x3b4252
let s:nord2  = 0x434c5e
let s:nord3  = 0x4c566a
let s:nord4  = 0xd8dee9
let s:nord5  = 0xe5e9f0
let s:nord6  = 0xeceff4
let s:nord7  = 0x8fbcbb
let s:nord8  = 0x88c0d0
let s:nord9  = 0x81a1c1
let s:nord10 = 0x5e81ac
let s:nord11 = 0xbf616a
let s:nord12 = 0xd08770
let s:nord13 = 0xebcb8b
let s:nord14 = 0xa3be8c
let s:nord15 = 0xb48ead

let s:red               = s:nord11
let s:orange            = s:nord12
let s:yellow            = s:nord13
let s:green             = s:nord14
let s:purple            = s:nord15

let s:normal_fg         = s:nord4
let s:normal_bg         = s:nord0

let s:cursor_bg         = s:nord4
let s:selection_bg      = s:Adjust(s:nord2, 0.0)

let s:identifier_fg     = s:nord8
let s:statement_fg      = s:nord9
let s:comment_fg        = s:nord3
let s:status_line_bg    = s:nord3

let s:base_ui           = s:nord3
let s:border_bg         = s:Adjust(s:normal_bg, 1.5)
let s:border_fg         = s:normal_bg
let s:focused_bg        = s:nord10


call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Comment Highlighting
call s:Highlight("Comment", s:Adjust(s:normal_bg, 1.10), "NONE", "NONE")

" Constant Highlighting
call s:Highlight("Constant", s:nord14, "NONE", "NONE")
call s:Highlight("String", s:nord14, "NONE", "NONE")
call s:Highlight("Character", s:nord14, "NONE", "NONE")
call s:Highlight("Number", s:nord15, "NONE", "NONE")
call s:Highlight("Boolean", s:nord9, "NONE", "NONE")
call s:Highlight("Float", s:nord15, "NONE", "NONE")

" Identifier Highlighting
call s:Highlight("Identifier", s:nord8, "NONE", "NONE")
call s:Highlight("Function", s:nord8, "NONE", "NONE")

" Statement Highlighting
call s:Highlight("Statement", s:nord9, "NONE", "NONE")
call s:Highlight("Conditional", s:nord9, "NONE", "NONE")
call s:Highlight("Repeat", s:nord9, "NONE", "NONE")
call s:Highlight("Label", s:nord9, "NONE", "NONE")
call s:Highlight("Operator", s:nord9, "NONE", "NONE")
call s:Highlight("Keyword", s:nord9, "NONE", "NONE")
call s:Highlight("Exception", s:nord9, "NONE", "NONE")

" PreProc Highlighting
call s:Highlight("PreProc", s:nord9, "NONE", "NONE")
call s:Highlight("Include", s:nord9, "NONE", "NONE")
call s:Highlight("Define", s:nord9, "NONE", "NONE")
call s:Highlight("Macro", s:nord9, "NONE", "NONE")
call s:Highlight("PreCondit", s:nord9, "NONE", "NONE")

" Type Highlighting
call s:Highlight("Type", s:nord9, "NONE", "NONE")
call s:Highlight("StorageClass", s:nord9, "NONE", "NONE")
call s:Highlight("Structure", s:nord9, "NONE", "NONE")
call s:Highlight("Typedef", s:nord9, "NONE", "NONE")

" Special Highlighting
call s:Highlight("Special", s:nord13, "NONE", "NONE")
call s:Highlight("SpecialChar", s:nord13, "NONE", "NONE")
call s:Highlight("Tag", s:nord4, "NONE", "NONE")
call s:Highlight("Delimiter", s:nord4, "NONE", "NONE")
call s:Highlight("SpecialComment", s:nord8, "NONE", "NONE")
call s:Highlight("Debug", s:nord4, "NONE", "NONE")


" Border Highlighting
call s:Highlight("StatusLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineNC", s:Adjust(s:border_fg, 0.4), s:border_bg, "NONE")
call s:Highlight("VertSplit", s:Adjust(s:border_fg, 0.4), s:border_bg, "NONE")
call s:Highlight("StatusLineTerm", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineTermNC", s:Adjust(s:border_fg, 0.4), s:border_bg, "NONE")

call s:Highlight("TabLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("TabLineSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("TabLineFill", s:Adjust(s:border_fg, 0.4), s:border_bg, "NONE")

call s:Highlight("Folded", s:Adjust(s:normal_bg, 3.0), s:Adjust(s:normal_bg, 1.0), "NONE")
call s:Highlight("FoldColumn", s:Adjust(s:normal_bg, 3.0), s:Adjust(s:normal_bg, 1.0), "NONE")

call s:Highlight("LineNr", s:Adjust(s:normal_bg, 1.0), s:Adjust(s:normal_bg, 0.5), "NONE")
call s:Highlight("CursorLineNr", s:Adjust(s:normal_bg, 3.0), s:Adjust(s:normal_bg, 0.5), "NONE")

call s:Highlight("ColorColumn", "NONE", s:Adjust(s:normal_bg, 0.2), "NONE")
call s:Highlight("SignColumn", s:Adjust(s:normal_bg, 1.0), s:Adjust(s:normal_bg, 0.5), "NONE")


" Cursor Highlighting

call s:Highlight("Cursor", "bg", s:normal_fg, "NONE") 
call s:Highlight("CursorLine", "NONE", s:Adjust(s:normal_bg, 0.5), "NONE")
call s:Highlight("CursorColumn", "NONE", s:Adjust(s:normal_bg, 0.5), "NONE")

call s:Highlight("Visual", "NONE", s:selection_bg, "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")


" Completion Highlighting

call s:Highlight("Pmenu", s:normal_bg, s:border_bg, "NONE")
call s:Highlight("PmenuSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("PmenuSbar", s:border_bg, s:Adjust(s:border_bg, 0.2), "NONE")
call s:Highlight("PmenuThumb", s:normal_fg, s:Adjust(s:border_bg, -0.2), "NONE")
call s:Highlight("WildMenu", s:normal_fg, s:focused_bg, "NONE")


" Syntax Highlighting

call s:Highlight("Error", s:Adjust(s:red, 0.2), s:Adjust(s:red, -0.5), "NONE")
call s:Highlight("Todo", s:Adjust(s:yellow, 0.1), s:Adjust(s:yellow, -0.6), "NONE")
call s:Highlight("ErrorMsg", s:red, "NONE", "NONE")
call s:Highlight("WarningMsg", s:yellow, "NONE", "NONE")


" Diff Highlighting

call s:Highlight("DiffAdd", "fg", s:Adjust(s:green, -0.4), "NONE")
call s:Highlight("DiffChange", "fg", s:Adjust(s:yellow, -0.5), "NONE")
call s:Highlight("DiffDelete", "fg", s:Adjust(s:red, -0.5), "NONE")
call s:Highlight("DiffText", s:Adjust(s:yellow, 0.4), s:Adjust(s:yellow, -0.5), "NONE")


" Search Highlighting

call s:Highlight("IncSearch", "bg", s:nord8, "NONE")
call s:Highlight("MatchParen", s:normal_bg, s:nord7, "NONE")
call s:Highlight("Search", "bg", s:orange, "NONE")


" Misc Highlighting

call s:Highlight("Conceal", s:comment_fg, "NONE", "NONE")
call s:Highlight("Ignore", "bg", "NONE", "NONE")
call s:Highlight("NonText", s:nord2, "NONE", "NONE")
call s:Highlight("SpecialKey", s:nord3, "NONE", "NONE")

call s:Highlight("Directory", s:nord14, "NONE", "NONE")
call s:Highlight("ModeMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("MoreMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("Question", s:normal_fg, "NONE", "NONE")
call s:Highlight("Title", s:nord8, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")


" Spelling Highlighting

let s:spell_hi = "guibg"
let s:spell_factor = -0.3
if has("gui_running")
    s:spell_hi = "guisp"
    s:spell_factor = 0.0
endif
exec "hi SpellBad gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:red, s:spell_factor))
exec "hi SpellCap gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:yellow, s:spell_factor))
exec "hi SpellRare gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:purple, s:spell_factor))
exec "hi SpellLocal gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:green, s:spell_factor))

