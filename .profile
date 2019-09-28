# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/applications/neovim/bin" ] ; then
    PATH="$HOME/applications/neovim/bin:$PATH"
fi

#if [ -L "$HOME/applications/ripgrep/rg" ] ; then
#    PATH="$HOME/applications/ripgrep:$PATH"
#fi

if [ -L "$HOME/applications/fzf/fzf" ] ; then
    PATH="$HOME/applications/fzf:$PATH"
fi


export PATH="$HOME/.cargo/bin:$PATH"
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export PATH="$PATH:`yarn global bin`"

#go
export GOPATH="$HOME/projects/go"
#export PATH="$PATH:$GOPATH/src/github.com/google/protobuf/bin"

export EDITOR=vim

export ANDROID_HOME="/home/glorydays/android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/android/flutter/bin/"


