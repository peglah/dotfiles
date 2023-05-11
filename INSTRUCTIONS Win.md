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
scoop install FiraCode-NF-Mono fzf gcc less neovim nodejs ripgrep vcredist2022 wezterm
scoop uninstall vcredist2022
reg import %userprofile%\scoop\apps\7zip\current\install-context.reg

REM These are other packages that might be wanted
scoop install 7zip eartrumpet k-lite-codec-pack-standard-np powertoys rainmeter sharex slack spotify streamlink taskbarx telegram youtube-music
```

Log out and back in

## Clone dots
```cmd
mkdir git && cd git
git clone https://github.com/Peglah/dotfiles
```

# Neovim
## Make symlink
```cmd
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\git\dotfiles\.config\nvim
REM copy %USERPROFILE%\git\dotfiles\.config\nvim\.editorconfig %USERPROFILE%
mklink %USERPROFILE% %USERPROFILE%\git\dotfiles\.config\nvim\.editorconfig
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
