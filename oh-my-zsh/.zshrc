#   CONFIGURATION UMBRELLA
#   AUTOR:  LAWRENCE COROY

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
source ~/powerlevel10k/powerlevel10k.zsh-theme
# If you come from bash you might have to change your $PATH.
PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#Compilation flags
export ARCHFLAGS="-arch x86_64"
#Fix the Java Problems
export _JAVA_AWT_WM_NONREPARENTING=1
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

SAVEHIST=1000
HISTFILE=~/.zsh_history


# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  rails
  ruby
  zsh-autosuggestions
  zsh-syntax-highlighting
  alias-finder
#  tmux
  )

ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi



# ALIAS:   
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls="lsd -a --group-dirs=last"
alias bat="bat -f --theme 'GitHub'"
alias ipa="ip -brief a"
alias getip="wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1 | sed 's/ //g'"
alias hg="history | grep -i"

alias cat="/data/data/com.termux/files/usr/bin/bat --style=plain"
alias can="/data/data/com.termux/files/usr/bin/cat"
alias vim="nvim"
alias cl="clear"
alias fzf-lovely="fzf-lovely h"

#function
#

function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    /usr/bin/man $@
}
function fzf-lovely(){                                                                                                                                            if [ "$1" = "h" ]; then                                                            fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
                    echo {} is a binary file ||                                                     (bat --style=numbers --color=always {} ||
                      highlight -O ansi -l {} ||                                                     coderay {} ||
                      rougify {} ||                                                                  cat {}) 2> /dev/null | head -500'                        
    else
            fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
                             echo {} is a binary file ||                                                    (bat --style=numbers --color=always {} ||                                       highlight -O ansi -l {} ||
                              coderay {} ||
                              rougify {} ||
                              cat {}) 2> /dev/null | head -500'
    fi
  }

function archivos() {
  am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/root/primary" >/dev/null
}

function apkinfo() {
  bash ~/.UMBRELLA/libexec/functions/apkinfo "$@";
}

function df() {
  if test ! $(command -v duf) 1>/dev/null; then
    yes|pkg install duf >/dev/null;
  fi
  command duf $1
}

function du() {
  command du -hP $1;
}

function localhost() {
  command ifconfig 2>/dev/null|grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'|grep -v 255|grep -v 127|tail -n 1;
}

function lock() {
  if test ! $(command -v cacademo) 1>/dev/null; then
    yes|apt install libcaca;
  fi
  command cacademo;
}

function whoami() {

  if [ ! -f ~/.UMBRELLA/UMBRELLA/.user ]; then
    command whoami;
  else
    cat ~/.UMBRELLA/UMBRELLA/.user|openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:Secret@123#|awk 'NF{print $NF}'
  fi
}

function traductor() {
  gawk -f <(curl -Ls git.io/translate) -- -shell
}

function rm() {
  setterm --foreground yellow;
  if [ -z $@ ] && { command rm $@; }
   if [ ! -d $@ ]; then
    if test ! $(command -v scrub) 1>/dev/null;then
      yes|apt install scrub;
    fi
    if test ! $(command -v shred) 1>/dev/null;then
      yes|apt install shred;
    fi
    scrub -p dod $@
    shred -zun 10 -v $@
  else
    command rm -rf $@ && echo "*Sucessfull";
  fi
  command setterm --foreground default
  }

if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
             command_not_found_handler() {
                 if test ! -f /data/data/com.termux/files/home/.UMBRELLA/libexec/functions/$1 ; then
                     /data/data/com.termux/files/usr/libexec/termux/command-not-found $1;
                 else
                     bash /data/data/com.termux/files/home/.UMBRELLA/libexec/functions/$@ ;
                 fi
             }
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
