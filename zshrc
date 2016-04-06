export TERM="xterm-256color"
export EDITOR="vim"
export DEFAULT_USER="$USER"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Install git clone https://github.com/gabrielelana/awesome-terminal-fonts.git
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-fontconfig'

# Theme config
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON='\uf126 '
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON=''
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_CHANGESET_HASH_LENGTH=5
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n%{%F{236}%}\u250f\u2501"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{236}%}\u2516 %{%F{default}%}"
POWERLEVEL9K_STATUS_OK_BACKGROUND='234'
POWERLEVEL9K_STATUS_OK_FOREGROUND='240'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='234'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='red'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='235'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='208'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='233'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='242'
POWERLEVEL9K_DIR_HOME_BACKGROUND='208'
POWERLEVEL9K_DIR_HOME_FOREGROUND='235'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='208'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='235'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='208'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='235'
POWERLEVEL9K_TIME_BACKGROUND='233'
POWERLEVEL9K_TIME_FOREGROUND='249'
POWERLEVEL9K_HISTORY_BACKGROUND='235'
POWERLEVEL9K_HISTORY_FOREGROUND='240'
POWERLEVEL9K_VCS_BACKGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='236'
POWERLEVEL9K_VCS_FOREGROUND='249'
POWERLEVEL9K_PROMPT_BACKGROUND='239'
POWERLEVEL9K_CUSTOM_DOCKER_BACKGROUND="blue"
POWERLEVEL9K_LOAD_BACKGROUND='yellow'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context status background_jobs dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_STATUS_VERBOSE=true

#zsh syntax highlighting
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/$DEFAULT_USER/usr/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export LD_LIBRARY_PATH="/home/$DEFAULT_USER/usr/lib:$LD_LIBRARY_PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# set dark theme for xterm emulators
if [[ "$TERM" == "xterm-256color" ]] || [[ "$TERM" == "xterm" ]]; then
    xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id `xprop -root |
        awk '/^_NET_ACTIVE_WINDOW/ {print $5}'`
fi
