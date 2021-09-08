" Modified from Stephen Hobbs <stephenh@cadence.com>
"               (https://www.vim.org/scripts/script.php?script_id=1573)
"             & Nachum Kanovsky <nkanovsky@yahoo.com> (refernce)

if exists("b:current_syntax")
   finish
endif

let b:current_syntax = "systemverilog"

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" Taken from the SystemVerilog 3.1a Annex B:
syntax keyword systemverilogStatement    alias always always_comb always_ff always_latch
syntax keyword systemverilogStatement    and assert assign assume before begin
syntax keyword systemverilogStatement    bind bins binsof break buf bufif0 bufif1
syntax keyword systemverilogStatement    cell chandle class clocking
syntax keyword systemverilogStatement    cmos config constraint context continue cover
syntax keyword systemverilogStatement    covergroup coverpoint cross deassign default
syntax keyword systemverilogStatement    defparam design disable dist edge end
syntax keyword systemverilogStatement    endclass endclocking endconfig endfunction
syntax keyword systemverilogStatement    endgenerate endgroup endinterface endmodule
syntax keyword systemverilogStatement    endpackage endprimitive endprogram endproperty
syntax keyword systemverilogStatement    endspecify endsequence endtable endtask
syntax keyword systemverilogStatement    expect extends final first_match 
syntax keyword systemverilogStatement    force fork function generate
syntax keyword systemverilogStatement    highz0 highz1 ifnone ignore_bins
syntax keyword systemverilogStatement    illegal_bins incdir include initial
syntax keyword systemverilogStatement    inside instance interface intersect
syntax keyword systemverilogStatement    join join_any join_none large liblist library local
syntax keyword systemverilogStatement    macromodule matches medium
syntax keyword systemverilogStatement    modport module nand negedge new nmos nor
syntax keyword systemverilogStatement    noshowcancelled not notif0 notif1 null or
syntax keyword systemverilogStatement    package packed pmos posedge primitive
syntax keyword systemverilogStatement    priority program property pull0 pull1
syntax keyword systemverilogStatement    pulldown pullup pulsestyle_onevent pulsestyle_ondetect
syntax keyword systemverilogStatement    pure randc randcase randsequence rcmos
syntax keyword systemverilogStatement    release return
syntax keyword systemverilogStatement    rnmos rpmos rtran rtranif0 rtranif1 scalared sequence
syntax keyword systemverilogStatement    showcancelled small solve
syntax keyword systemverilogStatement    specify strong0 strong1
syntax keyword systemverilogStatement    super supply0 supply1 table tagged task this
syntax keyword systemverilogStatement    throughout timeprecision timeunit tran
syntax keyword systemverilogStatement    tranif0 tranif1 tri tri0 tri1 triand trior trireg type
syntax keyword systemverilogStatement    unique unsigned use vectored
syntax keyword systemverilogStatement    wait wait_order wand weak0 weak1
syntax keyword systemverilogStatement    wildcard with within wor xnor xor

syntax keyword systemverilogType         real realtime event reg wire integer logic bit time byte
syntax keyword systemverilogType         chandle genvar signed unsigned shortint shortreal string
syntax keyword systemverilogType         void int longint specparam
syntax keyword systemverilogBoolean      true false TRUE FALSE
syntax keyword systemverilogStructure    struct union enum
syntax keyword systemverilogTypedef      typedef
syntax keyword systemverilogDirection    input output inout ref
syntax keyword systemverilogStorageClass parameter localparam virtual var protected rand
syntax keyword systemverilogStorageClass const static automatic extern forkjoin export import
syntax keyword systemverilogConditional  if else iff
syntax keyword systemverilogConditional  case casex casez endcase
syntax keyword systemverilogRepeat       for foreach do while forever repeat

" LRM 3.7 String methods:
syntax keyword systemverilogStatement    len getc putc toupper tolower compare
syntax keyword systemverilogStatement    icompare substr
syntax keyword systemverilogStatement    itoa hextoa octtoa bintoa realtoa
syntax keyword systemverilogStatement    atoi atohex atooct atobin atoreal
" LRM 3.8 events:
syntax keyword systemverilogStatement    triggered
" LRM 3.10 methods for enumerated types:
syntax keyword systemverilogStatement    first last next prev num name
" LRM 4.6 Dynamic Arrays:
syntax keyword systemverilogStatement    delete
" LRM 4.10 Associative Array methods:
syntax keyword systemverilogStatement    num exists
" LRM 4.15.1 Array locator methods:
syntax keyword systemverilogStatement    find find_index find_first find_first_index
syntax keyword systemverilogStatement    find_last find_last_index min max unique unique_index
" LRM 4.15.2 Array ordering methods:
syntax keyword systemverilogStatement    reverse sort rsort shuffle
" LRM 4.15.3 Array reduction methods:
syntax keyword systemverilogStatement    sum product
" LRM 4.15.4 Array iterator query:
syntax keyword systemverilogStatement    index
"" LRM 7.10.1 Builtin package:
syntax keyword systemverilogStatement    std
" LRM Annex C standard library
syntax keyword systemverilogStatement    get put try_get try_put peek try_peek
syntax keyword systemverilogStatement    status kill self await suspend resume
" LRM Annex D List methods
syntax keyword systemverilogStatement    next prev eq neq data
syntax keyword systemverilogStatement    size empty push_front push_back
syntax keyword systemverilogStatement    front back pop_front pop_back
syntax keyword systemverilogStatement    start finish insert insert_range
syntax keyword systemverilogStatement    erase erase_range set swap clear purge

" New time specification:
" #1step or #1ps
syntax match   systemverilogNumber       "\<[0-9_]\+\([munpf]\|\)s\>"
syntax match   systemverilogNumber       "\<[0-9_]\+step\>"

" Original systemverilog syntax below here
syntax keyword systemverilogTodo         contained TODO FIXME

syntax match   systemverilogOperator     "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syntax region  systemverilogComment      start="/\*" end="\*/" contains=systemverilogTodo
syntax match   systemverilogComment      "//.*" contains=systemverilogTodo

syntax match   systemverilogPreProc      "`celldefine"
syntax match   systemverilogPreProc      "`default_nettype"
syntax match   systemverilogDefine       "`define"
syntax match   systemverilogGlobal       "`else"
syntax match   systemverilogPreCondit    "`elsif"
syntax match   systemverilogPreProc      "`endcelldefine"
syntax match   systemverilogPreCondit    "`endif"
syntax match   systemverilogPreCondit    "`ifdef"
syntax match   systemverilogPreCondit    "`ifndef"
syntax match   systemverilogInclude      "`include"
syntax match   systemverilogPreProc      "`line"
syntax match   systemverilogPreProc      "`nounconnected_drive"
syntax match   systemverilogPreProc      "`resetall"
syntax match   systemverilogPreProc      "`timescale"
syntax match   systemverilogPreProc      "`unconnected_drive"
syntax match   systemverilogPreProc      "`undef"
syntax match   systemverilogGlobal       "$[a-zA-Z0-9_]\+\>"

syntax match   systemverilogConstant     "\<[A-Z][A-Z0-9_]\+\>"

syntax match   systemverilogNumber       "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syntax match   systemverilogNumber       "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syntax match   systemverilogNumber       "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syntax match   systemverilogNumber       "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syntax match   systemverilogNumber       "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syntax region  systemverilogString       start=+"+ skip=+\\"+ end=+"+ contains=systemverilogEscape
syntax match   systemverilogEscape       +\\[nt"\\]+ contained
syntax match   systemverilogEscape       "\\\o\o\=\o\=" contained

" Directives
syntax match   systemverilogDirective    "//\s*synopsys\>.*$"
syntax region  systemverilogDirective    start="/\*\s*synopsys\>" end="\*/"
syntax region  systemverilogDirective    start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syntax match   systemverilogDirective    "//\s*\$s\>.*$"
syntax region  systemverilogDirective    start="/\*\s*\$s\>" end="\*/"
syntax region  systemverilogDirective    start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed. The trade-off is performance versus functionality.
syntax sync lines=80

" The default highlighting.
highlight! default link systemverilogCharacter    Character
highlight! default link systemverilogConditional  Conditional
highlight! default link systemverilogRepeat       Repeat
highlight! default link systemverilogString       String
highlight! default link systemverilogTodo         Todo
highlight! default link systemverilogType         Type
highlight! default link systemverilogComment      Comment
highlight! default link systemverilogConstant     Constant
highlight! default link systemverilogBoolean      Boolean
highlight! default link systemverilogLabel        Label
highlight! default link systemverilogNumber       Number
highlight! default link systemverilogOperator     Special
highlight! default link systemverilogStatement    Statement
highlight! default link systemverilogGlobal       Define
highlight! default link systemverilogDirective    SpecialComment
highlight! default link systemverilogEscape       Special
highlight! default link systemverilogDirection    StorageClass
highlight! default link systemverilogStorageClass StorageClass
highlight! default link systemverilogPreProc      PreProc
highlight! default link systemverilogPreCondit    PreCondit
highlight! default link systemverilogInclude      Include
highlight! default link systemverilogDefine       Define
highlight! default link systemverilogStructure    Structure
highlight! default link systemverilogTypedef      Typedef
highlight! default link systemverilogTitle        Title

" vim: ts=2
