" vim_uefi.vim - A UEFI programming utilities
" Maintainer:   Alexander Fedorov fedorov7@gmail.com
" Version:      0.1

if exists('g:loaded_vim_uefi') || &cp
  finish
endif

let g:loaded_vim_uefi = 1

" helper functions {{{
function! s:has_vimproc()
    if !exists('s:exists_vimproc')
        try
            silent call vimproc#version()
            let s:exists_vimproc = 1
        catch
            let s:exists_vimproc = 0
        endtry
    endif
    return s:exists_vimproc
endfunction

function! s:system(str, ...)
    let command = a:str
    let input = a:0 >= 1 ? a:1 : ''

    if a:0 == 0
        let output = s:has_vimproc() ?
                    \ vimproc#system(command) : system(command)
    elseif a:0 == 1
        let output = s:has_vimproc() ?
                    \ vimproc#system(command, input) : system(command, input)
    else
        " ignores 3rd argument unless you have vimproc.
        let output = s:has_vimproc() ?
                    \ vimproc#system(command, input, a:2) : system(command, input)
    endif

    return output
endfunction

function! s:UpdateCscope()
  :echohl Directory
  :echon "\rfind *.h files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.h"    > cscope.files')
  :echohl Directory
  :echon "\rfind *.hpp files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.hpp"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.c"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.conf"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.bbappend"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.bb"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.txt"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.c files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.cpp"    >> cscope.files')
  :echohl Directory
  :echon "\rfind *.inf files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.inf"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.dec files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.dec"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.dsc files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.dsc"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.uni files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.uni"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.Vfr files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.Vfr"  >> cscope.files')
  :echohl Directory
  :echon "\rfind *.vfr files"
  call s:system ('find `pwd` ! -wholename "*tmp/*" -name "*.vfr"  >> cscope.files')
  :echohl Special
  :echon "\rSorting cscope files..."
  call s:system ('sort -o cscope.filessort cscope.files')
  :echohl Special
  :echon "\rGenerating cscope files..."
  call s:system ('cscope -b -q -k')
  :echohl Question
  cs kill -1
  cs add cscope.out
  :echon "\rCscope database updated!  "
  :echohl None
endfunction

command! -nargs=0 UpdateCscope call s:UpdateCscope()

if has("cscope")
  nnoremap <F6> :UpdateCscope<CR>
endif
