" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#onedark#refresh()
  let s:colors = onedark#GetColors()

  if get(g:, 'onedark_termcolors', 256) == 16
    let s:term_red = s:colors.red.cterm16
    let s:term_green = s:colors.green.cterm16
    let s:term_yellow = s:colors.yellow.cterm16
    let s:term_blue = s:colors.blue.cterm16
    let s:term_purple = s:colors.purple.cterm16
    let s:term_white = s:colors.white.cterm16
    let s:term_black = s:colors.black.cterm16
    let s:term_grey = s:colors.cursor_grey.cterm16
  else
    let s:term_red = s:colors.red.cterm
    let s:term_green = s:colors.green.cterm
    let s:term_yellow = s:colors.yellow.cterm
    let s:term_blue = s:colors.blue.cterm
    let s:term_purple = s:colors.purple.cterm
    let s:term_white = s:colors.white.cterm
    let s:term_black = s:colors.black.cterm
    let s:term_grey = s:colors.cursor_grey.cterm
  endif

  let g:airline#themes#onedark#palette = {}

  let g:airline#themes#onedark#palette.accents = {
        \ 'red': [ s:colors.red.gui, '', s:term_red, 0 ]
        \ }


  let s:N1 = [ s:colors.black.gui, s:colors.green.gui, s:term_black, s:term_blue ]
  let s:N2 = [ s:colors.comment_grey.gui, s:colors.black.gui, s:term_white, s:term_grey ]
  let s:N3 = [ s:colors.green.gui, s:colors.black.gui, s:term_green, '' ]
  let s:N4 = [ s:colors.comment_grey.gui, s:colors.black.gui, s:term_black, s:term_blue ]
  let s:N5 = s:N2
  let s:N6 = s:N3
  let g:airline#themes#onedark#palette.normal = {
   \  'airline_a': s:N1,
   \  'airline_b': s:N2,
   \  'airline_c': s:N3,
   \  'airline_x': s:N4,
   \  'airline_y': s:N5,
   \  'airline_z': s:N6,
        \}


  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#onedark#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  let s:I1 = [ s:colors.black.gui, s:colors.blue.gui, s:term_black, s:term_blue ]
  let s:I2 = s:N2
  let s:I3 = [ s:colors.blue.gui, s:colors.black.gui, s:term_blue, '' ]
  let s:I4 = s:N4
  let s:I5 = s:I2
  let s:I6 = s:I3
  let g:airline#themes#onedark#palette.insert = {
   \  'airline_a': s:I1,
   \  'airline_b': s:I2,
   \  'airline_c': s:I3,
   \  'airline_x': s:I4,
   \  'airline_y': s:I5,
   \  'airline_z': s:I6,
        \}

  let g:airline#themes#onedark#palette.insert_modified = g:airline#themes#onedark#palette.normal_modified

  let s:R1 = [ s:colors.black.gui, s:colors.red.gui, s:term_black, s:term_red ]
  let s:R2 = s:N2
  let s:R3 = [ s:colors.red.gui, s:colors.black.gui, s:term_red, '' ]
  let s:R4 = s:N4
  let s:R5 = s:R2
  let s:R6 = s:R3
  let g:airline#themes#onedark#palette.replace = {
   \  'airline_a': s:R1,
   \  'airline_b': s:R2,
   \  'airline_c': s:R3,
   \  'airline_x': s:R4,
   \  'airline_y': s:R5,
   \  'airline_z': s:R6,
        \}

  let g:airline#themes#onedark#palette.replace_modified = g:airline#themes#onedark#palette.normal_modified

  let s:V1 = [ s:colors.black.gui, s:colors.purple.gui, s:term_black, s:term_purple ]
  let s:V2 = s:N2
  let s:V3 = [ s:colors.purple.gui, s:colors.black.gui, s:term_purple, '' ]
  let s:V4 = s:N4
  let s:V5 = s:V2
  let s:V6 = s:V3
  let g:airline#themes#onedark#palette.visual = {
   \  'airline_a': s:V1,
   \  'airline_b': s:V2,
   \  'airline_c': s:V3,
   \  'airline_x': s:V4,
   \  'airline_y': s:V5,
   \  'airline_z': s:V6,
        \}
  let g:airline#themes#onedark#palette.visual_modified = g:airline#themes#onedark#palette.normal_modified

  let s:IA1 = [ s:colors.black.gui, s:colors.white.gui, s:term_black, s:term_white ]
  let s:IA2 = [ s:colors.white.gui, s:colors.black.gui, s:term_white, s:term_grey ]
  let s:IA3 = s:N2
  let g:airline#themes#onedark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#onedark#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " Warning/Error styling code from vim-airline's ["base16" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/base16.vim)

  " Warnings
  let s:WI = [ s:colors.black.gui, s:colors.visual_black.gui, s:term_black, s:term_grey ]
  let g:airline#themes#onedark#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       \ ]

  let g:airline#themes#onedark#palette.normal_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.insert.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.insert_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.visual.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.visual_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.replace.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.replace_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  " Errors
  let s:ER = [ s:colors.black.gui, s:colors.red.gui, s:term_black, s:term_red ]
  let g:airline#themes#onedark#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       \ ]

  let g:airline#themes#onedark#palette.normal_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.insert.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.insert_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.visual.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.visual_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.replace.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.replace_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

endfunction

call airline#themes#onedark#refresh()
