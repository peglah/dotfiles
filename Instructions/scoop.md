# [scoop](https://scoop.sh/)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Install
```cmd
scoop bucket add extras
scoop bucket add nerd-fonts

REM These are packages for Neovim
scoop install^
  FiraCode-NF^
  fzf^
  gcc^
  less^
  neovim^
  nodejs^
  ripgrep^
  vcredist2022 

scoop uninstall vcredist2022
reg import %userprofile%\scoop\apps\7zip\current\install-context.reg

REM These are other packages that might be wanted
scoop install^
  7zip^
  eartrumpet^
  firefox^
  k-lite-codec-pack-standard-np^
  pdf-xchange-editor^
  powertoys^
  rainmeter^
  sharex^
  slack^
  spotify^
  streamlink^
  taskbarx^
  telegram^
  vscode^
  windows-terminal^
  youtube-music
```

## Make symlink
```cmd
mklink %USERPROFILE%\.editorconfig %USERPROFILE%\git\Peglah\dotfiles\.config\nvim\.editorconfig
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\git\Peglah\dotfiles\.config\nvim
```

## Install everything in Neovim
```cmd
nvim --headless "+Lazy! sync" +qa
```

## Visual Studio Code addons
[Gruvbox Themes](https://marketplace.visualstudio.com/items?itemName=tomphilbin.gruvbox-themes)

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

