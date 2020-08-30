# Sources plugins
source ~/.zsh_plugins.sh

# Completions
autoload -Uz compinit && compinit # TODO: Default autocomplete
compdef w=-redirect-,-default-,-default- # Gives <tab> autocomplete
bindkey '^[[A' history-substring-search-up # Searches in history with up arrow
bindkey '^[[B' history-substring-search-down # Searches in history with down arrow

# History
HISTFILE=~/.histfile # Lines of history to keep in memory for current session
HISTSIZE=999999999  # Lines of history to keep in memory for current session
SAVEHIST=999999999 # Number of history entries to save to disk

# Options - `man zshoptions`
setopt autocd extendedglob
setopt append_history # Append history to the history file (no overwriting)
setopt share_history # Share history across terminals
setopt inc_append_history # Immediately append to the history file, not just when a term is killed
setopt extended_glob # Use extended globbing syntax
setopt auto_cd # Auto change to a dir without typing cd

# Fixes delete key behaviour
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Fixes home and end keys behaviours
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Fixes iTerm backward-kill-line behaviour
# For reference: https://stackoverflow.com/a/29403520
bindkey "^U" backward-kill-line 
bindkey "^X\\x7f" backward-kill-line

# Themed prompt
autoload colors; colors;
setopt prompt_subst
local host_name="%{$fg[green]%}赵"
local path_string="%{$fg[cyan]%}%~"
local prompt_string="%{$fg[yellow]%}% »"
PROMPT='${path_string} ${prompt_string} %{$reset_color%}'

# Set tab title to current directory and set window title to full path on iTerm
# the $PROMPT_COMMAND environment variable is executed every time a command is run
DISABLE_AUTO_TITLE="true"
tab_title() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
add-zsh-hook precmd tab_title

# Env setup
export ANDROID_HOME="/Users/matteomazzarolo/Library/android/sdk"
export ANDROID_SDK="/Users/matteomazzarolo/Library/android/sdk"

# Aliases
alias la="command ls -laG"
alias ls="command ls -CG"
alias grep="command grep --color=auto"
alias dc="docker-compose"
alias emulator="$ANDROID_HOME/emulator/emulator"
