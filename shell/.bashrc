export SHALIASCONFIG="$HOME/.config/shell/aliasrc"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#set bash prompt
# color \[\033[1;34m\]
PS1="\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h \[\033[35m\]\w\[\033[1;31m\]]\[\033[0m\]$ \[\033[0m\]"
# for server
# PS1="\[\033[1;31m\][\[\[\033[1;34m\]\D{%F}\[\033[1;36m\]&\[\033[1;34m\]\t\[\033[1;32m\]@\033[1;33m\]\u:\[\033[35m\]\w\[\033[1;31m\]]\[\033[0m\]$ \[\033[0m\]"
HISTTIMEFORMAT="%y-%m-%d %H:%M:%S "
HISTFILE=~/.cache/bash_history

#change ctrl caps key
# setxkbmap -option ctrl:swapcaps

[ -f $SHALIASCONFIG ] && source $SHALIASCONFIG

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"

eval "$(zoxide init bash --cmd j)"
. "$HOME/.cargo/env"
