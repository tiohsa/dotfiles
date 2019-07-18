"---------------------------------------------------------------------------
" denite.nvim
"
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])
      "\ ['rg', '--files', '--ignore-file', '~/.config/nvim/rc/plugins/.gitignore'])
"call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
"call denite#custom#var('grep', 'command', ['rg', '--threads', '1', '--ignore-file', '~/.config/nvim/rc/plugins/.gitignore'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', ['-r'])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file/old', 'matchers',
      \ ['matcher/fuzzy', 'matcher/project_files'])

if has('nvim')
  call denite#custom#source('file/rec,grep', 'matchers',
        \ ['matcher/cpsm'])
endif
call denite#custom#source('file/old', 'converters',
      \ ['converter/relative_word'])

call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/current', 'file/rec')
call denite#custom#var('file/rec/current', 'command',
      \ ['ls', '-1'])

" call denite#custom#option('default', 'prompt', '>')
" call denite#custom#option('default', 'short_source_names', v:true)
call denite#custom#option('default', {
      \ 'prompt': '>', 'source_names': v:true
      \ })

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#map(
      \ 'normal',
      \ 'w',
      \ '<denite:do_action:vsplit>',
      \ 'noremap'
      \)
