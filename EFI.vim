augroup filetype
  au BufRead,BufNewFile *.uni set syntax=c.doxygen
  au BufRead,BufNewFile *.vfr set syntax=c.doxygen
  au BufRead,BufNewFile *.inf set syntax=uefi 
  au BufRead,BufNewFile *.dec setf uefi
  au BufRead,BufNewFile *.dsc setf uefi
augroup end
