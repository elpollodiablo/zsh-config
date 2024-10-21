# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export TERM="screen-256color"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
if [ -f ~/python/bin/activate ]; then
    . ~/python/bin/activate;
fi
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
if [ -d /Users/${USER}/Library/Android/sdk/platform-tools/ ]; then
    export PATH=$PATH:/Users/${USER}/Library/Android/sdk/platform-tools/
    export JAVA_HOME=/usr/local/opt/openjdk@18/;
    #/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home;
fi

if [ -d ~/workspace ]; then
    export PATH=$PATH:node_modules/.bin;
fi

#export PATH="/usr/local/opt/node@14/bin:$PATH"
#export PATH="/usr/local/opt/node@16/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm use 20

export PATH="/usr/local/opt/openjdk@18/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/philip/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/philip/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/philip/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/philip/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
