# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
PS1='[\[\033[1m\]\u@\h\[\033[0m\] \W]\$ '

export XKB_DEFAULT_LAYOUT=fr
export LIBGL_DEBUG=verbose

export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl
export ELM_DISPLAY=wl

export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_FORCE_DPI=physical
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export XDG_SESSION_TYPE=wayland
export XDG_RUNTIME_DIR=/tmp/xdg_runtime-$(id -u)
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
alias config='/usr/bin/git --git-dir=~/git/dotfiles --work-tree=~'
