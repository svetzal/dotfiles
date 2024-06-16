export PATH=/opt/homebrew/bin:$PATH


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PICO_SDK_PATH=$HOME/Work/Personal/rpi/pico-sdk


export MODULAR_HOME="/Users/svetzal/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"


if [[ -e ~/.secrets.sh ]]; then
  source ~/.secrets.sh
fi

