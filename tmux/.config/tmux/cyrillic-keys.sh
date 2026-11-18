#!/bin/sh
# Author: https://github.com/lawrence-naumov/tmux
# Big thanks

tmp=$(mktemp "${TMPDIR:-/tmp}/tmux-cyrillic.XXXXXX") || exit 1

for table in prefix copy-mode-vi; do
  tmux list-keys -T "$table"
done | awk '
BEGIN {
  # \x27 = одинарная кавычка; в выводе list-keys спецсимволы экранированы
  n = split("q w e r t y u i o p [ ] a s d f g h j k l \\; \\\x27 z x c v b n m , .", en, " ")
  split("й ц у к е н г ш щ з х ъ ф ы в а п р о л д ж э я ч с м и т ь б ю", ru, " ")
  for (i = 1; i <= n; i++) map[en[i]] = ru[i]
  n = split("Q W E R T Y U I O P \\{ \\} A S D F G H J K L : \\\" Z X C V B N M < >", en, " ")
  split("Й Ц У К Е Н Г Ш Щ З Х Ъ Ф Ы В А П Р О Л Д Ж Э Я Ч С М И Т Ь Б Ю", ru, " ")
  for (i = 1; i <= n; i++) map[en[i]] = ru[i]
}
match($0, /-T [^ ]+ +[^ ]+ /) {
  head = substr($0, 1, RSTART - 1)
  split(substr($0, RSTART, RLENGTH), f, " ")
  if (f[3] in map)
    print head "-T " f[2] " " map[f[3]] " " substr($0, RSTART + RLENGTH)
}' > "$tmp"

tmux source-file "$tmp"
rm -f "$tmp"
