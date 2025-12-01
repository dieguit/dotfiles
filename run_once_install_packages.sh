#!/bin/sh

{{ if eq .chezmoi.os "linux" -}}
sudo apt install ripgrep lazygit lazydocker fzf fd-find
{{ else if eq .chezmoi.os "darwin" -}}
brew install ripgrep
brew install fzf
brew install fd
brew install lazygit
brew install lazydocker
brew install neovim
{{ end -}}

# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Getting ohmyz.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc --skip-chsh
else
  echo ".oh-my-zsh already found, skipping."
fi
