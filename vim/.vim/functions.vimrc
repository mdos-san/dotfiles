function! EsLint(file)
  call setqflist([])

  let output = systemlist('npx eslint -f ~/js/eslint.quick-fix-formatter.js ' . a:file)

  let quickfix_list = []
  for line in output 
    let item = json_decode(line) 
    call add(quickfix_list, item)
  endfor

  call setqflist(quickfix_list)
  copen
endfunction
    
