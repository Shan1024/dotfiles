# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/shan/.oh-my-zsh
export GPG_TTY=$(tty)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="cobalt2"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############
##### GIT #####
###############
alias gitfo="git fetch origin"
alias gitpum="git pull upstream master"
alias gitpom="git pull origin master"
alias gitpos="git pull origin staging"

alias gitd="git diff"

alias gitc="git commit -m"

alias gits="git status"

alias gitr="git remote -v"

alias gitco="git checkout"
alias gitcom="git checkout master"
alias gitcos="git checkout staging"
alias gitcob="git checkout -b"

alias gitbd="git branch -d"

alias gitrem="git rebase master"
alias gitres="git rebase staging"

alias gitprune="git remote prune origin"

alias gitcleanm="gitcom && gitfo && gitpom && gitprune"
alias gitcleans="gitcos && gitfo && gitpos && gitprune"
######################
##### Kubernetes #####
######################

alias kk="kubectl"

alias karf="kubectl apply -R -f"
alias kdrf="kubectl delete -R -f"

alias kga="kubectl get all"
alias kgan="kubectl get all -n"

####################
##### Minikube #####
####################

alias mk="minikube"
alias mkr="minikube stop && minikube start"
alias mkl="eval $(minikube docker-env)"
alias mkul="eval $(minikube docker-env --unset)"

#################
###### SSH ######
#################

alias ssh-stackops="ssh -i stackops-bastion-key ec2-user@3.1.206.173"
alias ssh-apollo="ssh -i apollo-bastion-key ec2-user@18.136.206.246"

#################
##### Other #####
#################

alias k="kubecolor"

alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias d="axel -a"

alias tf="terraform"

#################

. /Users/shan/.oh-my-zsh/plugins/z/z.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH="/usr/local/opt/go@1.9/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
autoload -U +X bashcompinit && bashcompinit

. <(flux completion zsh)

# complete -o nospace -C /usr/local/bin/kustomize kustomize

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.oh-my-zsh/custom/themes/powerlevel10k/config/p10k-classic.zsh.
[[ ! -f ~/.oh-my-zsh/custom/themes/powerlevel10k/config/p10k-classic.zsh ]] || source ~/.oh-my-zsh/custom/themes/powerlevel10k/config/p10k-classic.zsh

complete -o nospace -C /usr/local/bin/terraform terraform
