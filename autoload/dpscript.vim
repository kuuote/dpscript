let s:initialized = v:false
autocmd User DenopsStarted let s:initialized = v:false
autocmd User DenopsPluginPost:dpscript let s:initialized = v:true

let s:pending = []

function! dpscript#load(target) abort
  if !s:initialized
    call add(s:pending, a:target)
  else
    call denops#request('dpscript', 'load', [fnamemodify(a:target, ':p')])
  endif
endfunction

function! s:load_pending() abort
  try
    for s in s:pending
      call dpscript#load(s)
    endfor
  catch
    echom string([v:exception, v:throwpoint])
  endtry
endfunction

autocmd User DenopsPluginPost:dpscript call s:load_pending()
