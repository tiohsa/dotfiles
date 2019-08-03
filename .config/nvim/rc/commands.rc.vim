" 保存時に空白とタブの除去
function! s:remove_dust()
  let cursor = getpos(".")
  " 保存時に行末の空白を除去する
  if &filetype !~ 'markdown'
    %s/\s\+$//ge
  endif
  " 保存時にtabを2スペースに変換する
  %s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

"実行コマンド
command! Run call s:Run()
nmap <Leader>r :Run<CR>
function! s:Run()
  let e = expand("%:e")
  if e == "rs"
    ":RustRun
    :w
    ":!cargo run
    :!cargo test -- --nocapture
  endif
endfunction

"open directory
command! Nautilus call Nautilus()
function! Nautilus()
  let current_dir = expand('%:p:h')
  exec 'silent !nautilus ' . current_dir . ' &'
endfunction
nnoremap <Leader>od :<C-u>Nautilus<Return>

"open file
command! OpenFileByChrome call OpenFileByChrome()
function! OpenFileByChrome()
  let current_file = expand('%:p')
  exec 'silent !google-chrome ' . current_file . ' &'
endfunction
nnoremap <Leader>of :<C-u>OpenFileByChrome<Return>


"NERDTreeFind
nmap <F2> :NERDTreeFind<CR>
nmap <F3> :NERDTreeToggle<CR>

