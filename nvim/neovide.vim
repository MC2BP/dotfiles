let g:neovide_transparency=0.8
" let g:neovide_profiler = v:true
let g:neovide_refresh_rate=144
let g:neovide_cursor_animation_length=0.035
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_unfocused_outline_width=0.125
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=1.2
let g:neovide_cursor_vfx_particle_density=10.0
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>
