" wal Airline
let g:airline#themes#wal#palette = {}

" Normal mode
let s:N1 = [ '', '', 4, 0 ]
let s:N2 = [ '', '', 0, 4 ]

" Insert mode
let s:I1 = [ '', '', 2, 0 ]
let s:I2 = [ '', '', 0, 2 ]

" Visual mode
let s:V1 = [ '', '', 1, 0 ]
let s:V2 = [ '', '', 0, 1 ]

" Replace mode
let s:R1 = [ '', '', 5, 0 ]
let s:R2 = [ '', '', 0, 5 ]

let g:airline#themes#wal#palette.normal  = airline#themes#generate_color_map(s:N1, s:N2, s:N2)
let g:airline#themes#wal#palette.insert  = airline#themes#generate_color_map(s:I1, s:I2, s:I2)
let g:airline#themes#wal#palette.visual  = airline#themes#generate_color_map(s:V1, s:V2, s:V2)
let g:airline#themes#wal#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R2)

let g:airline#themes#wal#palette.accents = { 'red': [ '', '', 0, 2, '' ] }

" Inactive mode
let s:IN1 = [ '', '', 0, 8 ]
let s:IN2 = [ '', '', 0, 0 ]

let s:IA = [ s:IN1[1], s:IN2[1], s:IN1[3], s:IN2[3], '' ]
let g:airline#themes#wal#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Warnings
let s:WI = [ '', '', 1, 0, 'bold' ]
let g:airline#themes#wal#palette.normal.airline_warning = s:WI
let g:airline#themes#wal#palette.insert.airline_warning = s:WI
let g:airline#themes#wal#palette.visual.airline_warning = s:WI
let g:airline#themes#wal#palette.replace.airline_warning = s:WI

" Tabline
let g:airline#themes#wal#palette.tabline = {
      \ 'airline_tab':     [ '', '', 4, 0, 'bold' ],
      \ 'airline_tabsel':  [ '', '', 4, 0, 'bold' ],
      \ 'airline_tabtype': [ '', '', 4, 0, 'bold' ],
      \ 'airline_tabfill': [ '', '', 4, 0, 'bold' ],
      \ 'airline_tabmod':  [ '', '', 4, 0, 'bold' ]
\ }

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let g:airline#themes#wal#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '', '', 0, 0, 'bold' ],
      \ [ '', '', 0, 0, 'bold' ],
      \ [ '', '', 0, 0, 'bold' ] )


