if [ $(uname) == "Darwin" ]; then
  ln -sf ~/dotfiles/.config/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi
if [[ "$(uname -r)" == *microsoft* ]]; then
  ln -sf ~/dotfiles/.config/Code/User/settings.json ~/.vscode-server/data/Machine/settings.json
fi
