# Windows dark theme
```cmd
ms-settings:colors
```

# [Disable Shake to minimize](https://www.technipages.com/how-to-disable-shake-to-minimize-in-windows-10)

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

REM These are packages for Neovim
scoop install^
  firacode^
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
  putty^
  rainmeter^
  sharex^
  slack^
  spotify^
  streamlink^
  taskbarx^
  telegram^
  vscode^
  wezterm^
  windows-terminal^
  youtube-music
```

Log out and back in

## Clone dots
```cmd
mkdir %USERPROFILE%\git && cd %USERPROFILE%\git
git clone https://github.com/Peglah/dotfiles.git

mklink %USERPROFILE%\.gitconfig %USERPROFILE%\git\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.config %USERPROFILE%\git\dotfiles\.config
```

# Neovim
## Make symlink
```cmd
mklink %USERPROFILE%\.editorconfig %USERPROFILE%\git\dotfiles\.config\nvim\.editorconfig
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\git\dotfiles\.config\nvim
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

# Firefox 
## Settings
Never remember password

Highlight search results

## Addons
[Bitwarden](https://addons.mozilla.org/sv-SE/firefox/addon/bitwarden-password-manager/)

[Consent-O-Matic](https://addons.mozilla.org/sv-SE/firefox/addon/consent-o-matic/)

[Dark Reader](https://addons.mozilla.org/sv-SE/firefox/addon/darkreader/)

[Humble Gruvbox](https://addons.mozilla.org/sv-SE/firefox/addon/humble-gruvbox/)

[Tree Style Tab](https://addons.mozilla.org/sv-SE/firefox/addon/tree-style-tab/)

# Visual Studio Code addons
[Gruvbox Themes](https://marketplace.visualstudio.com/items?itemName=tomphilbin.gruvbox-themes)

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

# [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
```cmd
wsl --install
```
