# Firefox 
## Addons
[Bitwarden](https://addons.mozilla.org/sv-SE/firefox/addon/bitwarden-password-manager/)

[I still don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/)

[Dark Reader](https://addons.mozilla.org/sv-SE/firefox/addon/darkreader/)

[Humble Gruvbox](https://addons.mozilla.org/sv-SE/firefox/addon/humble-gruvbox/)

[Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)

## Settings
* Disable "Ask to save passwords"

1) about:support
2) Open Profile Folder
3) mkdir chrome
4) Edit chrome\userChrome.css
```css
#TabsToolbar-customization-target { visibility: collapse !important; }
```

```
about:config
findbar.highlightAll
toolkit.legacyUserProfileCustomizations.stylesheets
```


