#dotfiles
if [[ -z "${DOTFILES_HOME}" ]]; then
  export DOTFILES_HOME=~/dotfiles
fi
export DOTFILES_ZSH_HOME=${DOTFILES_HOME}/zsh

# check_update_dotfiles
# shellcheck source=.zshrc.check_update_dotfiles
source ${DOTFILES_ZSH_HOME}/.zshrc.check_update_dotfiles

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.anyenv/bin:$PATH"

# anyenv
if [[ "${+commands[anyenv]}" == 1 ]]
then
  eval "$(anyenv init - zsh)"
fi

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# starship
eval "$(starship init zsh)"
export PATH="/usr/local/opt/protobuf@3/bin:$PATH"

# git on homebrew
export PATH=/usr/local/bin/git:$PATH

# flatter
export PATH="$PATH:/Applications/flutter/bin"
