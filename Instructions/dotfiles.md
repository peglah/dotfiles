# GNU/Linux
```bash
mkdir -p ~/git/Peglah
git clone https://github.com/Peglah/dotfiles.git ~/git/Peglah/dotfiles

rm ~/.bashrc

cd ~/git/Peglah/dotfiles
stow . -t $HOME
```

# Windows
```cmd
mkdir %USERPROFILE%\git\Peglah && cd %USERPROFILE%\git\Peglah
git clone https://github.com/Peglah/dotfiles.git %USERPROFILE%\git\Peglah\dotfiles

mklink %USERPROFILE%\.gitconfig %USERPROFILE%\git\Peglah\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.config %USERPROFILE%\git\Peglah\dotfiles\.config
```

