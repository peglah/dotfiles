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
scoop install FiraCode-NF-Mono gcc less mingit neovim nodejs ripgrep vcredist2022
scoop uninstall vcredist2022
```

## Clone dots
```cmd
mkdir Git && cd Git
git clone https://github.com/Peglah/dotfiles
```

# Neovim
## Make symlink
```cmd
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\Git\dotfiles\.config\nvim
```

## Install everything in Neovim
```cmd
nvim --headless "+Lazy! sync" +qa
```

## Change font
```
nvim
:set guifont=*
```