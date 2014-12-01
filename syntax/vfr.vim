" This is the Vim syntax file for UEFI files (VFR).
"
" Maintainer: Alexander Fedorov "fedorov7@gmail.com"
" Date: Thu Jan 19 13:59:54 MSK 2012
"
" Usage:
" 1. cp proto.vim ~/.vim/syntax/
" 2. Add the following to ~/.vimrc:
"
" augroup filetype
"   au BufRead,BufNewFile *.xxx,  setfiletype uefi
" augroup end
"

if version < 600
  syntax clear
elseif exists("b:current_syntax") && b:current_syntax =~ 'vfr'
  finish
endif

" set syntax is case sensetive {{{1
" "==========
syn case match

" Useful keywords for headers: {{{1
" "==========
syn keyword     vfrSections formset endformset form endform subtitle label varstore defaultvarstore efivarstore namevaluevarstore string endstring checkbox endcheckbox formmap image locked rule endrule resetbutton endresetbutton option read write action endaction oneof endoneof numeric endnumeric date enddate time endtime string endstring password endpassword orderedlist endlist banner guidop endguidop modal dup questionref ruleref stringref pushthis security get length
syn keyword     vfrStatement disableif endif suppressif inconsistentif nosubmitif grayoutif ideqval ideqid ideqvallist

" Any useful keywords: {{{1
" "==========
syn keyword    vfrWords    guid title help class subclass classguid formid varid name attribute prompt flags key text questionid question minsize maxsize maptitle mapguid devicepath formsetguid default refresh interval defaultstore minimum maximum step refreshguid config hour minute second value year month day line align timeout datatype
 syn keyword    vfrFlags    READ_ONLY INTERACTIVE RESET_REQUIRED OPTIONS_ONLY HORIZONTAL CHECKBOX_DEFAULT CHECKBOX_DEFAULT_MFG MULTI_LINE UNIQUE NOEMPTY YEAR_SUPPRESS MONTH_SUPPRESS DAY_SUPPRESS STORAGE_NORMAL STORAGE_TIME STORAGE_WAKEUP HOUR_SUPPRESS MINUTE_SUPPRESS SECOND_SUPPRESS
 syn keyword    vfrOptions  OPTION_DEFAULT OPTION_DEFAULT_MFG DEFAULT left center right
 syn keyword    vfrSimple   AND OR TRUE FALSE NOT
 syn match      vfrToken    "\M\<\I\i\*\>"
 syn match      vfrStringToken "\M\<\I\i\*\ze\s\*)"
 syn keyword    vfrConst    STRING_TOKEN
 syn match      vfrVariable "\M\<\I\i\*\(.\I\i\*\)\+\>"
 syn match      vfrParenthesis "\M\((\|)\||\)"

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink vfrSections        Statement    "yellow
  HiLink vfrWords           Type         "green
  HiLink vfrToken           Include      "purple
  HiLink vfrConst           Identifier   "light blue
  HiLink vfrParenthesis     Identifier   "light blue
  HiLink vfrFlags           Constant     "red
  HiLink vfrOptions         Constant     "red
  HiLink vfrSimple          Constant     "red
  hi     vfrStatement       ctermfg=LightMagenta
  hi     vfrStringToken     ctermfg=Yellow
  hi     vfrVariable        ctermfg=LightBlue

  delcommand HiLink
endif

if !exists('b:current_syntax')
  let b:current_syntax = "vfr"
else
  let b:current_syntax = b:current_syntax.'.vfr'
endif
