some of that configs I don't use at all but I keep them just in case

# how to use

to apply config you need to use GNU stow. For example:

```shell
$ git clone https://github.com/rssnk/dotfiles
$ cd dotfiles
$ stow -t ~ zsh
```

it'll create symlink for zsh config inside home

# dependencies

- nvim
    - wget, unzip, [npm](https://www.npmjs.com/) - for lsp installing
    - [ripgrep](https://github.com/BurntSushi/ripgrep), fd - for faster fzf.lua
- x11
    - [dwm](https://github.com/rssnk/dwm) - WM
    - [st](https://github.com/rssnk/st) - terminal emulator
    - [dwmblocks](https://github.com/torrinfail/dwmblocks) - for easier customization of the dwm bar
    - [autorandr](https://github.com/phillipberndt/autorandr) - to automatically apply xrandr settings on startup
    - [feh](https://github.com/derf/feh) - for wallpapers
    - pipewire for audio (pipewire, pipewire-pulse, alsa, alsa-pulse)
- git
    - [moar](https://github.com/walles/moar) - for paging log, diff etc.
- mpv
    - [yt-dlp](https://github.com/yt-dlp/yt-dlp) - for streaming videos from youtube.com
