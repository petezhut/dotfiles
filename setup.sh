#!/bin/sh

DOTFILES_DIR=${HOME}/dotfiles
CONFIG_DIR=${HOME}/.config
NVIM_DIR=${CONFIG_DIR}/nvim
BIN_DIR=${HOME}/bin
FZF_DIR=${HOME}/.fzf
VCPROMPT_URL="https://github.com/djl/vcprompt/raw/master/bin/vcprompt"
FZF_URL="https://github.com/junegunn/fzf.git"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Create a new SSH Key
cat /dev/zero | ssh-keygen -q -N ""

# Making the right directories, but only if needed!
[ ! -d ${CONFIG_DIR} ] && mkdir ${CONFIG_DIR}
[ ! -d ${BIN_DIR} ] && mkdir -p ${BIN_DIR}

# NeoVim Setup
[ ! -d ${NVIM_DIR} ] && mkdir -p ${NVIM_DIR}
[ ! -f ${NVIM_DIR}/init.vim ] && ln -s ${DOTFILES_DIR}/neovim/init.vim ${NVIM_DIR}/init.vim

# Vimrc/NVimrc connection
[ ! -f ${HOME}/.vimrc ] && ln -s ${NVIM_DIR}/init.vim ${HOME}/.vimrc
[ ! -f ${HOME}/.nvimrc ] && ln -s ${NVIM_DIR}/init.vim ${HOME}/.nvimrc

# FZF Stuff
if [ ! -d  ${FZF_DIR} ]; then
  git clone --depth 1 ${FZF_URL} ${FZF_DIR}
  ${FZF_DIR}/install --all
fi

# VCPrompt Stuff
if [ ! -f ${BIN_DIR}/vcprompt ]; then
  curl -sL ${VCPROMPT_URL} > ${BIN_DIR}/vcprompt
  chmod 755 ${BIN_DIR}/vcprompt
fi

# Bash Fixups
[ ! -z "$DOTFILES_SETUP" ] && cat ${DOTFILES_DIR}/bash/bashrc >> ${HOME}/.bashrc

# Add Neovim packages
source {$HOME}/.bashrc
curl -fLo ${NVIM_DIR}/autoload/plug.vim --create-dirs ${VIM_PLUG_URL}
mkvirtualenv -p $(which python2) neovim2 -i neovim && deactivate
mkvirtualenv -p $(which python3) neovim3 -i neovim && deactivate
