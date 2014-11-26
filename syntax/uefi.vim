" This is the Vim syntax file for UEFI files (DEC, INF, DSC).
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
elseif exists("b:current_syntax")
  finish
endif

" set syntax is case sensetive {{{1
" "==========
syn case match

" Comments: {{{1
" "==========
 syn cluster    efiCommentGroup contains=efiTodo
 syn keyword    efiTodo         contained FIXME TODO XXX
 syn match      efiComment       "^\s*\zs#.*$"   contains=@efiCommentGroup
 syn match      efiComment       "\s\zs#.*$"     contains=@efiCommentGroup
 syn match      efiQuickComment  contained  "#.*$"

" Guid: {{{1
" "==========
 syn match      efiGuid "\M\<\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}\>" contains=efiInt
 syn match      efiGuidGlobalVar "\M\<g\w\+Guid\>"

" Types: {{{1
" "==========
 syn keyword    efiType UINT8 UINT16 UINT32 UINT64 UINT8z UINT16z UINT32z UINT64z BOOLEAN VOID

" Numbers and Constants: {{{1
" "==========
 syn match      efiHex      "\M\<0\(x\|X\)\x\{1,32}\>"
 syn match      efiFloat    "\M\<\d\+.\d\+\>"
 syn match      efiInt      "\M\<\d\+\>\ze\(-\)\@!"
 syn region     efiString   start=+L\="+ skip=+\\"+ end=+"+
 syn keyword    efiBoolean TRUE FALSE

" Idioms: {{{1
" "==========
 syn match      efiToken    "\M\<g\i\+TokenSpaceGuid.Pcd\i\+\>"
 syn match      efiPath     "\M/\=\(\w\+/\)\+\(\w\|.\|-\)\+\>"
 syn match      efiSource   "\M\s\+\zs\u\w\*.\w\+\ze\s\=$"
 syn match      efiLib      "\M\<\u\w\*Lib\>\ze\(/\|.\)\@!"
 syn match      efiPoint    "\M\<\u\w\*Point\>\ze\(/\)\@!"
 syn match      efiPreprocessor "\v^!((endif|else|include)|(if|ifndef|ifdef)\s+\$\(\i+\)).*$"
 syn match      efiArchSection  "\v\.(I(a|A)32|(x|X)64|IPF|E(bc|BC)|ARM|(c|C)ommon|USER_DEFINED)"
 syn match      efiArchConst    "\v\|=\zs(IA32|X64|IPF|EBC|ARM|common|Ebc|USER_DEFINED)\ze\|=/@!"
 syn match      efiEnv          "\M$(\w\+)"

" Special symbols: {{{1
" "==========
 syn match      efiParenthesis "\M\({\|}\|[\|]\||\|<\|>\)"

" Useful keywords for headers: {{{1
" "==========
 syn keyword    efiSection Defines Sources BuildOptions Binaries Includes Protocols Ppis Guids LibraryClasses Packages Dupex UserExtensions FeaturePcd Pcd FixedPcd PatchPcd PcdEx Depex UserExtensions PcdFeatureFlag PcdsFixedAtBuild PcdsPatchableInModule PcdsDynamic PcdsDinamicEx PcdsFeatureFlag PcdsDynamicEx SkuIds Libraries Components

" Any useful keywords: {{{1
" "==========
 syn keyword    infDefineSection INF_VERSION BASE_NAME EDK_RELEASE_VERSION PI_SPECIFICATION_VERSION UEFI_SPECIFICATION_VERSION FILE_GUID MODULE_TYPE VERSION_STRING LIBRARY_CLASS PCD_IS_DRIVER ENTRY_POINT UNLOAD_IMAGE CONSTRUCTOR DESTRUCTOR SHADOW PCI_DEVICE_ID PCI_VENDOR_ID PCI_CLASS_CODE PCI_COMPRESS UEFI_HII_RESOURCE_SECTION DEFINE SPEC CUSTOM_MAKEFILE DPX_SOUCE
 syn keyword    decDefineSection DEC_VERSION DEC_SPECIFICATION PACKAGE_NAME PACKAGE_GUID PACKAGE_VERSION
 syn keyword    dscDefineSection DSC_VERSION DSC_SPECIFICATION PLATFORM_NAME PLATFORM_GUID PLATFORM_VERSION SKUID_IDENTIFIER OUTPUT_DIRECTORY SUPPORTED_ARCHITECTURES BUILD_TARGETS FLASH_DEFINITION BUILD_NUMBER RFC_LANGUAGES ISO_LANGUAGES TIME_STAMP_FILE VPD_TOOL_GUID

" Constants: {{{1
" "==========
 syn keyword    efiModuleType BASE SEC PEI_CORE PEIM DXE_CORE DXE_DRIVER DXE_SAL_DRIVER DXE_RUNTIME_DRIVER SMM_CORE DXE_SMM_DRIVER UEFI_DRIVER UEFI_APPLICATION
 syn keyword    efiTool     MSFT GCC INTEL RVCT XCODE
 syn keyword    efiConst    DEFAULT BUILD RELEASE NULL DEBUG OR AND

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink efiTodo            Todo         "full yellow
  HiLink efiType            Type         "green
  HiLink efiGuid            Identifier   "lignt blue
  HiLink efiEnv             Identifier   "lignt blue
  HiLink efiParenthesis     Identifier   "lignt blue
  HiLink efiSection         Statement    "yellow
  HiLink efiArchSection     Statement
  HiLink efiHex             Constant     "red
  HiLink efiFloat           Constant     "red
  HiLink efiModuleType      Constant     "red
  HiLink efiInt             Constant     "red
  HiLink efiBoolean         Constant     "red
  HiLink efiString          Constant     "red
  HiLink efiTool            Constant     "red
  HiLink efiConst           Constant     "red
  HiLink efiArchConst       Constant
  HiLink efiComment         Comment      "blue
  HiLink efiPreprocessor    Include      "purple
  hi     efiLib             ctermfg=LightRed
  hi     efiToken           ctermfg=LightMagenta
  hi     efiGuidGlobalVar   ctermfg=LightCyan
  hi     efiPoint           ctermfg=LightBlue
  hi     efiPath            ctermfg=Gray
  hi     infDefineSection   ctermfg=DarkGrey
  hi     decDefineSection   ctermfg=DarkGray
  hi     dscDefineSection   ctermfg=DarkGray
  hi     efiSource          ctermfg=LightGreen

  delcommand HiLink
endif

let b:current_syntax = "uefi"
