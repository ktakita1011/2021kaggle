#!/bin/sh

# パッケージリストを更新し、必要なパッケージをインストール
apt-get update && apt-get install -y \
    git \
    zsh \
    sed \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 環境変数SHELLを設定
export SHELL=/usr/bin/zsh

# Zshを実行（ただし、このコマンドはスクリプト内では効果がないため、コメントアウトしています）
# zsh

# デフォルトのシェルをzshに変更
chsh -s /bin/zsh

# zpreztoをインストール
git clone --recursive \
    https://github.com/sorin-ionescu/prezto.git \
    $HOME/.zprezto

# SHELL変数を設定（スクリプトではこの方法での設定は不要です）
# SHELL="/bin/zsh"

# zpreztoの設定ファイルをリンク
zsh -c 'setopt EXTENDED_GLOB; \
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do \
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; \
    done'

# prezto-contribをクローン
git clone --recurse https://github.com/belak/prezto-contrib $HOME/.zprezto/contrib

# .zpreztorcの設定を変更
sed -i "/'prompt'/c \\\ 'contrib-prompt' \\\\\n  'prompt'" /root/.zpreztorc
sed -i "s/theme 'sorin'/theme 'spaceship'/g" /root/.zpreztorc
