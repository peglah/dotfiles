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

mklink %USERPROFILE%\.gitconfig %USERPROFILE%\git\Peglah\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.config %USERPROFILE%\git\Peglah\dotfiles\.config
```

# Neovim
## Make symlink
```cmd
mklink %USERPROFILE%\.editorconfig %USERPROFILE%\git\Peglah\dotfiles\.config\nvim\.editorconfig
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\git\Peglah\dotfiles\.config\nvim
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
Disable "Ask to save passwords"

about:config
findbar.highlightAll

about:support
Open Profile Folder
mkdir chrome
Edit chrome\userChrome.css
#TabsToolbar-customization-target { visibility: collapse !important; }
about:config
toolkit.legacyUserProfileCustomizations.stylesheets

## Addons
[Bitwarden](https://addons.mozilla.org/sv-SE/firefox/addon/bitwarden-password-manager/)

[I still don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/)

[Dark Reader](https://addons.mozilla.org/sv-SE/firefox/addon/darkreader/)

[Humble Gruvbox](https://addons.mozilla.org/sv-SE/firefox/addon/humble-gruvbox/)

[Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)

# Visual Studio Code addons
[Gruvbox Themes](https://marketplace.visualstudio.com/items?itemName=tomphilbin.gruvbox-themes)

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

# [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
```cmd
wsl --install
```
