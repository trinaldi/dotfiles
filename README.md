# dotfiles

My dotfiles as of `2022-06-08`

## VIM:
- .vimrc
- folder and plugins

## ZSH and Themes:
- .zshrc
- honukai.zsh-theme

## MPV:
- mpv.conf
- input.conf
- Lua script for info

## TMUX:
- tmux.conf

## WeeChat
- Plugins
- General config
- Build with: `./configure --with-aspell --with-curl --with-python --with-perl --with-ruby --with-lua --with-guile`

## Misc
- Build configuration for ffmpeg
- No tear fix for GNOME
- Fira Mono Medium for Powerline font

## Nginx
- Example `.conf` file for WordPress subfolder and friendly link

## i3
- `config` file for [i3-gaps-rounded](https://github.com/resloved/i3) but it works with regular `i3` and `i3` gaps (assuming you remove/comment the specific lines for said `i3` flavor)

## fzf (fuzzy finder)
- Both `fzf` folder and `.fzf.zsh` that is called in `~/.zshrc`. With this bindings such as <C>+r works with fzf functionality.  

## picom (a.k.a compton)
- `conf` file for [compton](https://aur.archlinux.org/packages/compton-tryone-git/) - tryone's patched fork of compton with kawase blur, actually

## Misc
- Run `# sync; echo 3 > /proc/sys/vm/drop_caches` in order to free _some_ memory.
