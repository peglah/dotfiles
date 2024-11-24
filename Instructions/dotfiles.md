# GNU/Linux
```bash
mkdir -p ~/git/Peglah
git clone https://github.com/Peglah/dotfiles.git ~/git/Peglah/dotfiles

rm ~/.bashrc
rm ~/.bash_profile

cd ~/git/Peglah/dotfiles
stow . -t $HOME
ln -s $HOME/git/Peglah/dotfiles/.local/bin/ $HOME/.local/bin
```

# Windows
```cmd
mkdir %USERPROFILE%\git\Peglah && cd %USERPROFILE%\git\Peglah
git clone https://github.com/Peglah/dotfiles.git %USERPROFILE%\git\Peglah\dotfiles

mklink %USERPROFILE%\.gitconfig %USERPROFILE%\git\Peglah\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.config %USERPROFILE%\git\Peglah\dotfiles\.config
```

