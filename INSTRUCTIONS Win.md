# scoop
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex
```

## Install
```cmd
scoop install mingit
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install neovim vcredist2022 gcc nodejs ripgrep FiraCode-NF-Mono
scoop uninstall vcredist2022
```

## Clone dots
```cmd
mkdir Git && cd Git
git clone https://github.com/Peglah/dotfiles
```

# Neovim
## Change font
```
nvim
:set guifont=*
```

## Make symlink
```cmd
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\Git\dotfiles\.config\nvim
```
Open nvim and wait for everything to install
