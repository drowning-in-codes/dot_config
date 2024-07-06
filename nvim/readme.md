For neovim,I just use lazyvim(or you can choose lunarvim,nvchat,etc.) and install favorable plugins

### step 1 download neovim

[neovim/INSTALL.md at master · neovim/neovim (github.com)](https://github.com/neovim/neovim/blob/master/INSTALL.md)

### step 2 download lazyvim

```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

```sh
:LazyHealth
```

### step 3 install your favorable plugins

take `wakatime` for instance

[Neovim - WakaTime - An open source Neovim extension for automatic time tracking and metrics about your programming.](https://wakatime.com/neovim)

create a lua file in plugins:

```lua
return {
  { "wakatime/vim-wakatime", lazy = false },
}
```

