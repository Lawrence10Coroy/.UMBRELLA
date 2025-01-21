#PROMPT='%(?:%{$fg_bold[white]%}U M B R E L L A %{$fg_bold[red]%}☣%{$reset_color%} :%{$fg_bold[red]%}U M B R E L L A %{$fg_bold[white]%}☣ %{$reset_color%})%{$fg_bold[cyan]%}%~\
#$(git_prompt_info) %{$fg_bold[grey]%}>> %{$reset_color%} '

PROMPT=$'%(?:%{\e[1m\e[38;5;25m%}U M B R E L L A %{\e[1m\e[38;5;81m%}☣%{\e[0m%} :%{\e[38;5;25m%}U M B R E L L A %{\e[1;31m%}☣ %{\e[0m%})%{\e[1;90m%}%~$(git_prompt_info)\
%{\e[1;38;5;236m%}>%{\e[1;38;5;238m%}>%{\e[1;38;5;241m%}> %{\e[0m%} '

ZSH_THEME_GIT_PROMPT_PREFIX=$'%{\e[1;90m%} ⋅%{\e[38;5;25m%}'
ZSH_THEME_GIT_PROMPT_SUFFIX=$'%{\e[0m%}'

ZSH_THEME_GIT_PROMPT_DIRTY=$'%{\e[1;90m%}⋅%{\e[38;5;81m%}✿'

ZSH_THEME_GIT_PROMPT_CLEAN=''

#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%}⋅%{$fg[magenta]%}✿"
