# dotfiles
1. .tmux/vim-session
  + .bashrc(.zshrc)へ以下を記載すると、tmux起動時に分割された状態で開始される。
    ```
    if [ $SHLVL = 1 ]; then
          alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/vim-session"
    if
    ```
