if [ $(uname) == "Darwin" ]; then
  ln -sf ~/dotfiles/.config/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
  ln -sf ~/dotfiles/.config/Code/User/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi
if [[ "$(uname -r)" == *microsoft* ]]; then
  ln -sf ~/dotfiles/.config/Code/User/settings.json ~/.vscode-server/data/Machine/settings.json
fi
