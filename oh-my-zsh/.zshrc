#   CONFIGURATION UMBRELLA
#   AUTOR:  LAWRENCE COROY

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

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
ZSH_THEME="Umbrella_red"
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
alias ls='lsd --group-dirs=first'
alias lsa='lsd -a --group-dirs=first'
alias l='lsd -lh --group-dirs=first'
alias ll='lsd -lha --group-dirs=first'
alias bat="bat -f --theme 'GitHub'"
alias ipa="ip -brief a"
alias getip="wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1 | sed 's/ //g'"
alias hg="history | grep -i"
alias cat="/data/data/com.termux/files/usr/bin/bat --style=plain"
alias can="/data/data/com.termux/files/usr/bin/cat"
alias vim="nvim"
alias cl="clear"
alias fzf-lovely="fzf-lovely h"

#FUNCTIONS:
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

function fzf-lovely() {
 command -v file >/dev/null || { pkg install file >/dev/null 2>&1; }
if [ "$1" = "h" ]; then
  fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
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

function X11_distro() {
  command -v proot-distro >/dev/null || { echo -en "\e[0;31m(⋯☣) \e[0;33mUMBRELLA CORPORACION need proot-distro. Run \e[0;34mpkg2install \e[0;31mproot-distro\e[0m\n" }

  /data/data/com.termux/files/home/.UMBRELLA/libexec/functions/X11_distro

}

function df() {
  if test ! $(command -v duf) 1>/dev/null; then
    yes|pkg install duf >/dev/null;
  fi
  command duf $1
}

function X11_native() {

    command -v termux-x11 >/dev/null || { echo -en "\e[0;31m(⋯☣) \e[0;33mUMBRELLA CORPORACION need termux-X11. Run \e[0;34mpkg2install \e[0;31mX11_native\e[0m\n" }
    /data/data/com.termux/files/home/.UMBRELLA/libexec/functions/X11_native >/dev/null 2>&1;

}

function du() {
  command du -hP $1;
}

function distro() {
    command -v proot-distro >/dev/null || { echo -en "\e[0;31m(⋯☣) \e[0;33mUMBRELLA CORPORACION need proot-distro. Run \e[0;34mapt \e[0;31minstall \e[0;33mproot-distro\e[0m\n" }
    /data/data/com.termux/files/home/.UMBRELLA/libexec/functions/distro

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
    command rm -rf $@ && echo "Done!";
  fi
  command setterm --foreground default
  }

if [[ ! "$PATH" == */data/data/com.termux/files/home/.UMBRELLA/libexec/functions* ]]; then PATH="${PATH:+${PATH}:}/data/data/com.termux/files/home/.UMBRELLA/libexec/functions";
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
