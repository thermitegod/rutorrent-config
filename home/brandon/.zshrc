#https://github.com/vaeth/zshrc-mv/blob/master/zshrc
emulate sh -c "source /etc/profile"
emulate sh -c "source ${HOME}/.profile"
source /usr/share/zsh/site-contrib/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

export EDITOR="/usr/bin/nvim"
export USE_EDITOR="${EDITOR}"
export VISUAL="${EDITOR}"

#zsh specific
export REPORTTIME="2"

#gentoo
export EIX_LIMIT="0"

# z settings
zstyle ":completion:*" completer _ignored _approximate
zstyle ":completion:*" completions 1
zstyle ":completion:*" glob 1
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" max-errors 5 numeric
zstyle ":completion:*" substitute 1
zstyle ":compinstall" filename "${HOME}/.zshrc"
zstyle ":completion:*:descriptions" format "%U%B%d%b%u"
zstyle ":completion:*:warnings" format "%BNo matches for: %d%b"
zstyle ":completion:*" menu select
zstyle ":completion::complete:*" use-cache 1
zstyle ":completion:*:*:-command-:*:*" ignored-patterns "_*"

#TEST
# Completion System (man zshcompsys):
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) #([0-9a-z/-]# #[0-9:]# #)*=01;32=01;36=01;33'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=00;36'
zstyle ':completion:*:*:*:*:users' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:modules' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:interfaces' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:packages' list-colors '=*=01;32'
zstyle ':completion:*:*:*:*:categories' list-colors '=*=00;32'
zstyle ':completion:*:*:*:*:useflags' list-colors '=*=01;35'
zstyle ':completion:*:reserved-words' list-colors '=*=01;32'
zstyle ':completion:*:aliases' list-colors '=*=01;32'
zstyle ':completion:*:parameters' list-colors '=*=01;36'

# Restrict cd selections:
zstyle ':completion:*:cd:*' tag-order local-directories # directory-stack named-directories path-directories
#TESTEND

#dirs
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
#comp
setopt AUTO_LIST
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_SLASH
setopt COMPLETE_ALIASES
setopt GLOB_COMPLETE
setopt LIST_AMBIGUOUS
setopt LIST_PACKED
setopt LIST_ROWS_FIRST
setopt LIST_TYPES
setopt MENU_COMPLETE
#expan
setopt EXTENDED_GLOB
setopt GLOB
setopt GLOB_DOTS
setopt MARK_DIRS
setopt NOMATCH
setopt NUMERIC_GLOB_SORT
setopt WARN_CREATE_GLOBAL
#hist
setopt APPEND_HISTORY
setopt HIST_ALLOW_CLOBBER
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
#i/o
setopt CORRECT_ALL
setopt PATH_DIRS
#job
setopt AUTO_CONTINUE
setopt NOTIFY

bindkey -v

autoload -Uz compinit promptinit
compinit
promptinit; prompt gentoo

HISTSIZE="100"
SAVEHIST=${HISTSIZE}
HISTFILE="${HOME}/.history"

if [ ${EUID} -eq 0 ]; then
	PS1="[lxd] %F{1}%B%n%b%f %d %B#%b "
else
	PS1="[lxd] %F{1}%B%n%b%f %d %B>%b "
fi

# alias
alias chgrp="chgrp -v --preserve-root"
alias chmod="chmod -v --preserve-root"
alias chown="chown -v --preserve-root"
alias rm="rm -I --preserve-root"
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -ivs"
alias mkdir="mkdir -pv"

alias ls="ls --all -v --color=auto --group-directories-first --classify --file-type"
alias ll='ls -l --time-style=+"%Y-%m-%d %H:%M:%S"'
alias df="df -hTP"
alias du="du -k --one-file-system --total"
alias grep="grep --color=auto --ignore-case"
alias dir="dir --almost-all --color=auto"

#git
alias gadd="git add ."
alias gcm="git commit -m"
alias grl="git reflog"

#gentoo
alias update="emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs --update @world"
alias emerge-check="emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs @world"
alias quickpkg="quickpkg --include-config=y"
alias smart-live-rebuild="smart-live-rebuild -f '!zfs'"
alias eqf="equery f"
alias equ="equery u -i"
alias eqh="equery h"
alias eqa="equery a --overlay-tree"
alias eqb="equery b"
alias eql="equery l"
alias eqd="equery d"
alias eqg="equery g"
alias eqc="equery c"
alias eqk="equery k"
alias eqm="equery m"
alias eqy="equery y"
alias eqs="equery s"
alias eqss="equery s --bytes"
alias eqw="equery w"

#openrc
alias rc-status="rc-status -a"
