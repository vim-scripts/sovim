" If there is a file named `so.vim` in current dir or any of its
" parent dirs, source it
"
function! Sovim_Source(filename)
    let a:parent = fnamemodify('.', ":p:h")
    let a:path = a:parent . '/' . a:filename
    let a:found = 1
    while ! filereadable( a:path )
        if a:parent ==# '/'
            let a:found = 0
            break
        endif
        let a:parent = fnamemodify( a:parent, ":h") 
        let a:path = a:parent . '/' . a:filename
    endwhile
    if a:found
        exe "so " . a:path
    endif
endfunction

if !exists('g:sovim_basename')
    let g:sovim_basename = 'so.vim'
endif

autocmd BufRead,BufNewFile * call Sovim_Source(g:sovim_basename)
