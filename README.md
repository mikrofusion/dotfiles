
install macvim via 
```
brew install macvim
```

install TMUX via 

```
brew install tmux
```

install janis via 
```
curl -Lo- https://bit.ly/janus-bootstrap | bash
```

note:  In iTerm2, in Preferences -> Profiles -> Terminal, under "Terminal Emulation" you have "Report Terminal Type:" set to screen-256color.

also will want to set the colorscheme of iterm2 to match the colorscheme being used

Note:  TMUX will probably require you to install the following (you'll
know cause it will error on boot).

brew install reattach-to-user-namespace

todos:
vimrc currently is a symbolic link specific to my system.  need
to fix this.

.vim is currently not a symbolic link and should be, for now manually
correct
