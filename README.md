# dotfiles

My dotfiles as of `2022-12-30`

## [VIm](https://vim.org)
- .vimrc
- plugins

## [zsh](https://zsh.org) and [themes](https://ohmyz.sh)
- .zshrc
- honukai.zsh-theme

## [mpv](https://mpv.io/)
- mpv.conf
- input.conf
- Lua script for info

## [tmux](https://github.com/tmux/tmux)
- tmux.conf

## [WeeChat](https://weechat.org)
- Plugins
- General config
- Build with: `./configure --with-aspell --with-curl --with-python --with-perl --with-ruby --with-lua --with-guile`


## [nginx](https://nginx.com)
- Example `.conf` file for WordPress subfolder and friendly link

## [i3](https://i3wm.org)
- `config` file for [i3-gaps-rounded](https://github.com/resloved/i3) but it works with regular `i3` and `i3` gaps (assuming you remove/comment the specific lines for said `i3` flavor)

## [fzf - fuzzy finder](https://github.com/junegunn/fzf)
- Both `fzf` folder and `.fzf.zsh` that is called in `~/.zshrc`. With this bindings such as <C>+r works with fzf functionality.  

## [picom/compton](https://github.com/yshui/picom)
- `conf` file for [compton](https://aur.archlinux.org/packages/compton-tryone-git/) - tryone's patched fork of compton with kawase blur, actually

## [rofi](https://github.com/davatorium/rofi)
- `.rasi` file (config)

## Misc
- Build configuration for ffmpeg
- No tear fix for GNOME

## _etc..._
- Run `# sync; echo 3 > /proc/sys/vm/drop_caches` in order to free _some_ memory.
