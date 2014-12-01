" This is the Vim syntax file for UEFI files (UNI).
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
elseif exists("b:current_syntax") && b:current_syntax =~ 'uni'
  finish
endif

" set syntax is case sensetive {{{1
" "==========
syn case match

" Useful keywords for headers: {{{1
" "==========
syn match     uniDefines    "\M#langdef\>"
syn match     uniStart      "\M/=#"

" Any useful keywords: {{{1
" "==========
syn match     uniWords      "\M#string\>"
syn match     uniLanguage   "\M#language\>"
syn match     uniLocale     "\M\<\(\l\)\{2}-\(\u\)\{2}\>"
syn match     uniToken      "\M\<\(\u\|_\|\d\)\+\>"


if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink  uniDefines        Include       "purple
  HiLink  uniStart          Include       "purple
  HiLink  uniWords          Statement     "yellow
  HiLink  uniLanguage       Type          "green
 " HiLink  uniToken          Identifier    "cyan
  hi      uniLocale         ctermfg=LightGreen
  hi      uniToken          ctermfg=Yellow

  delcommand HiLink
endif

if !exists('b:current_syntax')
  let b:current_syntax = "uni"
else
  let b:current_syntax = b:current_syntax.'.uni'
endif
