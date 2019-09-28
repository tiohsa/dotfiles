function! CompareDate(date_text)
python << EOF
import vim
import datetime

today = datetime.date.today()
tdatetime = datetime.datetime.strptime(vim.eval("a:date_text"), "%Y-%m-%d")
tdate = datetime.date(tdatetime.year, tdatetime.month, tdatetime.day)
if today > tdate:
    result = 1
elif today < tdate:
    result = 2
else:
    result = 0
vim.command("let l:result = '" + result + "'")
EOF
if result == 1
  "highlight link limitDate Error
elseif result == 2
  return Identifier
else
  return limitDate Error
endif
endfunction

syn match limitDate "\d\{4}-\d\{2}-\d\{2}"
hi def link limitDate CompareDate

