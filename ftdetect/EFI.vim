augroup filetype
  au BufRead,BufNewFile *.uni setf uni
  au BufRead,BufNewFile *.uni set syntax=c.uni.doxygen
  au BufRead,BufNewFile *.vfr setf vfr
  au BufRead,BufNewFile *.vfr set syntax=c.doxygen.vfr
  au BufRead,BufNewFile *.Vfr setf vfr
  au BufRead,BufNewFile *.Vfr set syntax=c.vfr.doxygen
  au BufRead,BufNewFile *.inf setf uefi
  au BufRead,BufNewFile *.inf set syntax=uefi.doxygen
  au BufRead,BufNewFile *.inc set syntax=uefi.doxygen
  au BufRead,BufNewFile *.c   set syntax=c.doxygen.kss
  au BufRead,BufNewFile *.h   set syntax=c.doxygen.kss
  au BufRead,BufNewFile *.dec setf uefi
  au BufRead,BufNewFile *.dsc setf uefi
  au BufRead,BufNewFile *.dxs setf c.doxygen
augroup end
