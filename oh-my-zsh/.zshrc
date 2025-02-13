#   CONFIGURATION UMBRELLA
#   AUTOR:  LAWRENCE COROY

# Disable Powerlevel10k configuration wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Set up PATH and environment variables
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export _JAVA_AWT_WM_NONREPARENTING=1
export ZSH="$HOME/.oh-my-zsh"

# Set colors lsd configurations
eval "$(dircolors -b ~/.dircolors)"

# History configuration
SAVEHIST=1000
HISTFILE=~/.zsh_history

#Disable LS color and auto-title
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"

# Load Oh My Zsh plugins
plugins=(
  git
  rails
  ruby
  zsh-autosuggestions
  zsh-syntax-highlighting
  alias-finder
#  tmux
  )

# Auto-start tmux if not already in a sessions
ZSH_TMUX_AUTOSTART=true
# Set ZSH theme
ZSH_THEME="Umbrella_red"
source $ZSH/oh-my-zsh.sh

# Set lenguage environment
export LANG=en_US.UTF-8

# Ser preferred editor based on SHH connection
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Aliases for common commands
alias tldr='tldr --language es'
alias ls='lsd --group-dirs=first'
alias lsa='lsd -a --group-dirs=first'
alias l='lsd -lh --group-dirs=first'
alias ll='lsd -lha --group-dirs=first'
alias bat="bat -f --theme 'base16-256'"
alias ipa="ip -brief a"
alias getip="wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1 | sed 's/ //g'"
alias hg="history | grep -i"
alias cat="$PREFIX/bin/bat --style=plain"
alias can="cat"
alias vim="nvim"
alias cl="clear"
alias fzf-lovely="fzf-lovely h"

# Custom Functions
function man() {
  env \
  LESS_TERMCAP_mb=$'\e[01;31m' \
  LESS_TERMCAP_md=$'\e[01;38;5;220m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  /usr/bin/man $@
}

function fzf-lovely() {
  if ! command -v file >/dev/null;then
    pkg install file >/dev/null 2>&1
  fi

  local preview_cmd='[[ $(file --mine {}) =~ binary ]] && echo {} is a binary file || (bat -f --theme base16-256 --style=numbers {} || highlightn -O ansi -l {} || coderay {} || rougify {} || cat {}) 2>/dev/null | head -500'

  if [[ "$1" = "h" ]]; then
    fzf -m --reverse --preview-window down:20 --preview "$preview_cmd"
  else
    fzf -m --preview "$preview_cmd"
  fi
}

function archivos() {
  am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/root/primary" >/dev/null
}

function df() {
  command -v duf >/dev/null || yes | pkg install duf >/dev/null
  duf "$@"
}

function du() {
  command du -hP "$@";
}

function localhost() {
  command ifconfig 2>/dev/null|grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'|grep -v 255|grep -v 127|tail -n 1;
}

function lock() {
  command -v cacademo >/dev/null || apt install libcaca > /dev/null
  cacademo
}

function color() {
  setterm --foreground yellow
  echo "Usage: in OUTPUT strings"
  echo
  echo 'Color\t\t<n> is number color!'
  echo 'Foreground\t\\033[38;05;<n>m'
  echo 'Background\t\\033[48;05;<n>m'
  echo "Color:\n"
  setterm --foreground default
  for i in {0..250}; do
    echo -en "\033[38;05;${i}m $i"
  done
  echo -e "\033[0m"
}

function whoami() {

  if [[ -f ~/.UMBRELLA/UMBRELLA/.user ]]; then
    cat ~/.UMBRELLA/UMBRELLA/.user|openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:dynamic_key|awk 'NF{print $NF}'
  else
    command whoami
  fi
}

function traductor() {
  gawk -f <(curl -Ls git.io/translate) -- -shell
}

function rm() {
  setterm --foreground yellow;
  if [[ $# -eq 0 ]] && { command rm --help; return 1 }

  case "$@" in
    --help|-h) command rm --help ;;
    *)
      local files=("$@")
      for file in "${files[@]}"; do
        if [[ -d "$file" ]]; then
          command rm -rf "$file" && echo "Done!"
        elif [[ -a "$files" ]]; then
          command -v scrub >/dev/null || yes | apt install scrub >/dev/null
          command -v shred >/dev/null || yes | apt install shred >/dev/null

          scrub -p dod "$file"
          shred -zun 10 -v "$file"
          command rm -f "$file"
          echo "Done"
        else
          echo "$0: cannot remove '$file': No such file or directory."
          return 1
        fi
      done
      ;;
  esac
  command setterm --foreground default
  }

# Add custom function to PATH
if [[ ! "$PATH" == *$HOME/.UMBRELLA/libexec/functions* ]]; then
  export PATH="$PATH:$HOME/.UMBRELLA/libexec/functions"
fi

# Load FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
