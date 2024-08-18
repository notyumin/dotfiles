# My Setup

- Editor: Neovim with [LazyVim](https://github.com/LazyVim/LazyVim)
- Shell: zsh with [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)
- Terminal: [Wezterm](https://github.com/wez/wezterm) with tmux
- WM: [Yabai](https://github.com/koekeishiya/yabai)

Dots managed by [GNU Stow](https://www.gnu.org/software/stow/)

# Installation

Just clone this repo into your home directory and run

```
stow .
```

This symlinks all the files in this repo to your machine

If you see the following error

```
WARNING! stowing . would cause conflicts:
...
```

Instead run
```
stow . --adopt
```
This will move any conflicting files into this repo before symlinking.
From there, either:
1. `git restore` if you want to keep the file from this repo

OR

2. `git commit` if you want to keep the file originally on your machine.

# Dependencies
Here's a list of things you have to install for my config to work:

- zsh
- zsh-autosuggestions
- Oh My Posh
- zoxide
- fzf
- asdf
- Neovimz
- tmux
- tpm
- Wezterm
- lazygit

# References

- [Setting up Stow](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Setting up tmux](https://www.youtube.com/watch?v=DzNmUNvnB04&t=138s)
- [Setting up yabai](https://www.youtube.com/watch?v=k94qImbFKWE)
- [Setting up Oh My Posh](https://www.youtube.com/watch?v=9U8LCjuQzdc)
