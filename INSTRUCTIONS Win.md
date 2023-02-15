Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

scoop bucket add extras
scoop bucket add nerd-fonts
scoop install neovim vcredist2022 gcc nodejs ripgrep mingit FiraCode-NF-Mono
scoop uninstall vcredist2022

mkdir Git && cd Git
git clone github.com/Peglah/dotfiles

mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\Git\dotfiles\.config\nvim

:set guifont=*
