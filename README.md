## Installation

## Presequisites
### Node
```bash
brew install node@22
```

### Packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

Then,
```
:ParkerSync
```

### ripgrep
```bash
brew install ripgrep
```

## Key Mapping
### Terminal
- Toggle floating terminal: <kbd>\\+tt</kbd> or <kbd>Leader+tt</kbd>
  - Opens a centered floating terminal over the current window and drops into insert mode. Press again to hide it (the shell session persists).
  - Exit terminal mode to normal mode with <kbd>Ctrl+\\</kbd> <kbd>Ctrl+n</kbd>.

### File explorer
- Opening: <kbd>\\+b</kbd> or <kbd>Leader+b</kbd>
- Closing: <kbd>\\+B</kbd> or <kbd>Leader+B</kbd>

### Spliting
- Vertical Spliting: <kbd>\\+vs</kbd> or <kbd>Leader+vs</kbd>

### Live grep
- Opening: <kbd>\\+lg</kbd> or <kbd>Leader+lg</kbd>

## Troubleshooting
### Font Icons missing
Make sure you install a Nerd Font and using it for the terminal. You can download the [Nerd Fonts](https://www.nerdfonts.com/font-downloads) here.
