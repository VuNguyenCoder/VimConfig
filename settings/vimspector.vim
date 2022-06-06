nnoremap  <Leader>dl :call vimspector#Launch()<CR>
nnoremap  <Leader>ds :call vimspector#Reset()<CR>
nnoremap  <Leader>dc :call vimspector#Continue()<CR>

nnoremap  <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap  <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap      <Leader>dr <Plug>VimspectorRestart
nmap      <Leader>de <Plug>VimspectorStepOut
nmap      <Leader>di <Plug>VimspectorStepInto
nmap      <Leader>do <Plug>VimspectorStepOver
