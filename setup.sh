#!/bin/sh

# ドットファイルをFinderに表示する
echo "--- ドットファイルをFinderに表示する  ---"
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

# brew がインストールされていなければインストール
if [ -z "$(command -v brew)" ]; then
    echo "--- Install Homebrew is Start! ---"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle

    echo "--- Install Homebrew is Done!  ---"
else
    echo "--- Already installed brew  ---"
fi

# nerd_fonts(ターミナル絵文字対応)
if [ ! -d ~/Library/Fonts/NerdFonts ]; then
    git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts || exit
    ./install.sh CodeNewRoman
    cd .. || exit
    rm -rf nerd-fonts
else
    echo "--- Already installed NerdFonts  ---"
fi

# anyenv
if [ ! -d ~/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    echo "--- how to use anyenv ---"
    echo "anyenv init"
    echo "anyenv install -l"
    echo "anyenv install nodenv"
    echo "nodenv install -l"
else
    echo "--- Already installed anyenv  ---"
fi

# sdkman
if [ ! -d ~/.sdkman ]; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    echo "--- how to use sdkman ---"
    echo "sdk list java"
    echo "sdk install java xxx"
    echo "sdk default java xxx"
else
    echo "--- Already installed sdkman  ---"
fi

# dotfilesを配置
echo "--- Link dotfiles is Start! ---"

# zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# starship
mkdir -p ~/.config
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

echo "--- Link dotfiles is Done!  ---"
