" aurora.vim
" Fork of nord.vim colorscheme (light version)
" The main colors still utilize the nord palette, but some of the UI elements
" are different from the normal nord color scheme (status line, etc).
"

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "aurora"

set background=light

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

function! s:AdjustRGB(hex_code, rfactor, gfactor, bfactor)
    let l:red = min([0xff, float2nr(round(a:hex_code % 0x1000000 / 0x10000 * (1 + a:rfactor)))])
    let l:green = min([0xff, float2nr(round(a:hex_code % 0x10000 / 0x100 * (1 + a:gfactor)))])
    let l:blue = min([0xff, float2nr(round(a:hex_code % 0x100 * (1 + a:bfactor)))])
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

let s:normal_fg         = 0x404040
let s:normal_bg         = 0xececec

let s:cursor_bg         = s:nord0
let s:selection_bg      = s:Adjust(s:nord8, 0.0)

let s:base_blue         = s:AdjustRGB(s:nord9, -0.7, -0.7, 0.0)
let s:constant_fg       = s:AdjustRGB(s:nord14, -1.0, -0.3, -1.0)
let s:number_fg         = s:AdjustRGB(s:nord15, 0.0, -0.5, 0.0)
let s:bool_fg           = s:base_blue
let s:identifier_fg     = s:AdjustRGB(s:nord8, -1.0, -0.3, 0.0)
let s:statement_fg      = s:base_blue
let s:preproc_fg        = s:AdjustRGB(s:nord7, -1.0, -0.1, -0.1)
let s:type_fg           = s:base_blue
let s:special_fg        = s:AdjustRGB(s:nord13, -0.2, -0.4, -0.8)
let s:spec_comment_fg   = s:identifier_fg
let s:comment_fg        = s:Adjust(s:normal_bg, -0.4)

let s:border_bg         = s:nord10
let s:border_fg         = s:normal_bg
let s:faded_border_bg   = s:Adjust(s:normal_bg, -0.1)
let s:border_faded_fg   = s:Adjust(s:border_bg, 0.4)
let s:focused_bg        = s:nord10


call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Comment Highlighting
call s:Highlight("Comment", s:comment_fg, "NONE", "NONE")

" Constant Highlighting
call s:Highlight("Constant", s:constant_fg, "NONE", "NONE")
call s:Highlight("String", s:constant_fg, "NONE", "NONE")
call s:Highlight("Character", s:constant_fg, "NONE", "NONE")
call s:Highlight("Number", s:number_fg, "NONE", "NONE")
call s:Highlight("Boolean", s:bool_fg, "NONE", "NONE")
call s:Highlight("Float", s:number_fg, "NONE", "NONE")

" Identifier Highlighting
call s:Highlight("Identifier", s:identifier_fg, "NONE", "NONE")
call s:Highlight("Function", s:identifier_fg, "NONE", "NONE")

" Statement Highlighting
call s:Highlight("Statement", s:statement_fg, "NONE", "NONE")
call s:Highlight("Conditional", s:statement_fg, "NONE", "NONE")
call s:Highlight("Repeat", s:statement_fg, "NONE", "NONE")
call s:Highlight("Label", s:statement_fg, "NONE", "NONE")
call s:Highlight("Operator", s:statement_fg, "NONE", "NONE")
call s:Highlight("Keyword", s:statement_fg, "NONE", "NONE")
call s:Highlight("Exception", s:statement_fg, "NONE", "NONE")

" PreProc Highlighting
call s:Highlight("PreProc", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Include", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Define", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Macro", s:preproc_fg, "NONE", "NONE")
call s:Highlight("PreCondit", s:preproc_fg, "NONE", "NONE")

" Type Highlighting
call s:Highlight("Type", s:type_fg, "NONE", "NONE")
call s:Highlight("StorageClass", s:type_fg, "NONE", "NONE")
call s:Highlight("Structure", s:type_fg, "NONE", "NONE")
call s:Highlight("Typedef", s:type_fg, "NONE", "NONE")

" Special Highlighting
call s:Highlight("Special", s:special_fg, "NONE", "NONE")
call s:Highlight("SpecialChar", s:special_fg, "NONE", "NONE")
call s:Highlight("Tag", s:special_fg, "NONE", "NONE")
call s:Highlight("Delimiter", s:special_fg, "NONE", "NONE")
call s:Highlight("SpecialComment", s:spec_comment_fg, "NONE", "NONE")
call s:Highlight("Debug", s:special_fg, "NONE", "NONE")


" Border Highlighting
call s:Highlight("StatusLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineNC", s:border_faded_fg, s:border_bg, "NONE")
call s:Highlight("VertSplit", s:border_faded_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineTerm", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineTermNC", s:border_faded_fg, s:border_bg, "NONE")

call s:Highlight("TabLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("TabLineSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("TabLineFill", s:border_faded_fg, s:border_bg, "NONE")

call s:Highlight("ToolbarLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("ToolbarButton", s:normal_fg, s:focused_bg, "NONE")

call s:Highlight("Folded", s:Adjust(s:normal_bg, -0.2), s:Adjust(s:normal_bg, -0.2), "NONE")
call s:Highlight("FoldColumn", s:Adjust(s:normal_bg, -0.2), s:Adjust(s:normal_bg, -0.2), "NONE")

call s:Highlight("LineNr", s:Adjust(s:normal_bg, -0.3), s:faded_border_bg, "NONE")
call s:Highlight("CursorLineNr", s:Adjust(s:normal_bg, -0.5), s:faded_border_bg, "NONE")

call s:Highlight("ColorColumn", "NONE", s:Adjust(s:normal_bg, -0.1), "NONE")
call s:Highlight("SignColumn", s:Adjust(s:normal_bg, -0.3), s:faded_border_bg, "NONE")


" Cursor Highlighting

call s:Highlight("Cursor", "bg", s:normal_fg, "NONE") 
call s:Highlight("CursorLine", "NONE", s:faded_border_bg, "NONE")
call s:Highlight("CursorColumn", "NONE", s:faded_border_bg, "NONE")

call s:Highlight("Visual", "NONE", s:selection_bg, "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")


" Completion Highlighting

call s:Highlight("Pmenu", s:normal_bg, s:border_bg, "NONE")
call s:Highlight("PmenuSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("PmenuSbar", s:border_bg, s:Adjust(s:border_bg, -0.2), "NONE")
call s:Highlight("PmenuThumb", s:normal_fg, s:Adjust(s:border_bg, 0.4), "NONE")
call s:Highlight("WildMenu", s:normal_fg, s:focused_bg, "NONE")


" Syntax Highlighting

call s:Highlight("Error", s:Adjust(s:red, -0.1), s:Adjust(s:red, 1.0), "NONE")
call s:Highlight("Todo", s:Adjust(s:yellow, -0.1), s:Adjust(s:yellow, 1.0), "NONE")
call s:Highlight("ErrorMsg", s:red, "NONE", "NONE")
call s:Highlight("WarningMsg", s:yellow, "NONE", "NONE")


" Diff Highlighting

call s:Highlight("DiffAdd", "fg", s:Adjust(s:green, 0.0), "NONE")
call s:Highlight("DiffDelete", "fg", s:Adjust(s:red, 0.0), "NONE")
call s:Highlight("DiffChange", "fg", s:Adjust(s:yellow, 0.0), "NONE")
call s:Highlight("DiffText", s:AdjustRGB(s:yellow, -0.0, -0.4, -1.0), s:Adjust(s:yellow, 0.0), "NONE")


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
call s:Highlight("Title", s:identifier_fg, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")


" Spelling Highlighting

let s:spell_hi = "guibg"
let s:spell_factor = -0.3
if has("gui_running")
    let s:spell_hi = "guisp"
    let s:spell_factor = 0.0
endif
exec "hi SpellBad gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:red, s:spell_factor))
exec "hi SpellCap gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:yellow, s:spell_factor))
exec "hi SpellRare gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:purple, s:spell_factor))
exec "hi SpellLocal gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:green, s:spell_factor))


" Plugin Support

" GitGutter

call s:Highlight("GitGutterAdd", s:green, s:faded_border_bg, "NONE")
call s:Highlight("GitGutterChange", s:yellow, s:faded_border_bg, "NONE")
call s:Highlight("GitGutterDelete", s:red, s:faded_border_bg, "NONE")

