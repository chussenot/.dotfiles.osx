# vim: set filetype=zsh:

local check_mark='\xE2\x9C\x94'
local x_mark='\xE2\x9C\x98'

# User info.
function prompt_user(){
    echo "%{$fg[cyan]%}%n"
}

# Machine info.
function prompt_machine(){
    echo "%{$fg[green]%}%m"
}

# Directory info.
function prompt_dir(){
    echo "%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}"
}

# Git info
function prompt_git(){
    ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[cyan]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}$x_mark"
    ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}$check_mark"
    git_prompt_info
}

# Pyenv info
function prompt_pyenv(){
    if which pyenv &>/dev/null; then
        local pyenv_version="$(pyenv version-name)"
        if [[ "$pyenv_version" != "system" ]]; then
            echo "python:%{${fg[yellow]}%}$pyenv_version%{$reset_color%}"
        fi
    fi
}

# Rbenv info
function prompt_rbenv(){
    if which rbenv &>/dev/null; then
        local rbenv_version="$(rbenv version-name)"
        if [[ "$rbenv_version" != "system" ]]; then
            echo "ruby:%{${fg[yellow]}%}$rbenv_version%{$reset_color%}"
        fi
    fi
}

# Aws profile
function prompt_aws_profile(){
    if [[ -n  "$AWS_PROFILE" ]]; then
        echo "aws:%{${fg[yellow]}%}$AWS_PROFILE%{$reset_color%}"
    else
        echo "aws:%{${fg[yellow]}%}default%{$reset_color%}"
    fi
}

# Terraform info
function prompt_tfenv(){
    if which tfenv &>/dev/null; then
        local tfenv_version="$(tfenv version-name)"
        echo "tf:%{${fg[yellow]}%}$tfenv_version%{$reset_color%}"
    fi
}

# NVM: Node version manager
prompt_nvm() {
  local nvm_prompt
  if type nvm >/dev/null 2>&1; then
    nvm_prompt=$(nvm current 2>/dev/null)
    [[ "${nvm_prompt}x" == "x" ]] && return
  else
    nvm_prompt="$(node --version)"
  fi
  nvm_prompt=${nvm_prompt}
  echo "node:%{${fg[yellow]}%}$nvm_prompt%{$reset_color%}"
}

# Assemble additional info
function prompt_additional(){
    local -a array
    array=( \
        "$(prompt_git)" \
        "$(prompt_rbenv)" \
        "$(prompt_nvm)" \
        "$(prompt_tfenv)" \
        "$(prompt_aws_profile)" \
    )
    array=(${array[@]})
    if [[ $#array != 0 ]]; then
        echo "%{$reset_color%}on ${(pj:, :)array} "
    fi
}

# Prompt info.
function prompt_status(){
    local color="%(?:%{$fg[cyan]%}:%{$fg[red]%})"
    if [[ $EUID -ne 0 ]]; then
        echo "${color}$ %{$reset_color%}"
    else
        echo "${color}# %{$reset_color%}"
    fi
}

# Main prompt
# Format: \n # USER at MACHINE in DIRECTORY on [git/hg] [pyenv] [rbenv] [TIME] \n $
PROMPT='
%{$fg[cyan]%}#%{$reset_color%} \
$(prompt_user) \
%{$reset_color%}in \
$(prompt_dir) \
$(prompt_additional)\
%{$reset_color%}
$(prompt_status)'
