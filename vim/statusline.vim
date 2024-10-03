set noshowmode

let s:currentmode={
      \ 'v'      : 'VISUAL',
      \ 'V'      : 'V·Line',
      \ "\<C-V>" : 'V·Block',
      \ 'i'      : 'INSERT',
      \ 'R'      : 'REPLACE',
      \ 't'      : 'TERMINAL',
      \ 'c'      : 'COMMAND',
      \}

function! JSJ_changestatuslinecolor()
  if (mode() =~# '\v(v|V|)')
    exe 'hi Statusline_mode guibg=#c678dd'
    return s:currentmode[mode()]
  elseif (mode() =~# 'i')
    exe 'hi Statusline_mode guibg=#61afef'
    return s:currentmode[mode()]
  elseif (mode() =~# 'R')
    exe 'hi Statusline_mode guibg=#e06c75'
    return s:currentmode[mode()]
  elseif (mode() =~# '\v(c|t)')
    exe 'hi Statusline_mode guibg=#98c379'
    return s:currentmode[mode()]
  else
    exe 'hi Statusline_mode guibg=#98c379'
  endif
  return "NORMAL"
endfunction

hi StatusLine cterm=NONE gui=NONE guifg=#ffffff guibg=#2c323c
hi StatusLineNC cterm=NONE gui=NONE guifg=#000000 guibg=#5c6370
hi! link StatusLineTerm Statusline
hi! link StatusLineTermNC StatusLineNC
hi Statusline_mode cterm=bold gui=bold guifg=#282c34 guibg=#98c379
hi Statusline_file cterm=NONE gui=NONE guifg=#e5c07b guibg=#2c323c
hi Statusline_wran cterm=NONE gui=NONE guifg=#e5c07b guibg=#e06c75
hi Statusline_sep  cterm=NONE gui=NONE guibg=#2c323c
hi Statusline_type cterm=NONE gui=NONE guifg=#e5c07b guibg=#2c323c
hi Statusline_enc  cterm=NONE gui=NONE guifg=#d19a66 guibg=#3e4452

function! s:active()
  setlocal statusline=
  setlocal statusline+=%#Statusline_mode#\ %{JSJ_changestatuslinecolor()}\ %*  " mode(NORMAL,INSERT,etc)
  setlocal statusline+=%#Statusline_file#\ %<%t\ %*  " only file name
  setlocal statusline+=%#Statusline_wran#%m%h%r%*  " modify,help tag,readonly
  setlocal statusline+=%#Statusline_sep#\ %=\ %*  " Separation
  setlocal statusline+=%#Statusline_type#%{&ft}\ %*  " filetype
  setlocal statusline+=%#Statusline_enc#\ %{&fenc?&fenc:&enc}\[%{&ff}\]\ %*  " encode, fileformat
  setlocal statusline+=%#Statusline_mode#\ %p%%\ %v:%l/%L\ %*  " file position information
endfunction

function! s:inactive()
  setlocal statusline=
  setlocal statusline+=\ %<%f\ %*  " full file path
  setlocal statusline+=%#Statusline_wran#%m%h%r%*  " modify,help tag,readonly
  setlocal statusline+=\ %=\ %*  " Separation
  setlocal statusline+=%(%v:%l/%L%)\ %*  " file position information
endfunction

augroup jsj_Statusline
  autocmd!
  autocmd VimEnter,BufEnter,WinEnter * :call s:active()
  autocmd WinLeave * :call s:inactive()
augroup end
