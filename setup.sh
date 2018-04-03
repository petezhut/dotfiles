#!/bin/sh

DOTFILES_DIR=${HOME}/dotfiles
CONFIG_DIR=${HOME}/.config
I3_CONFIG=${CONFIG_DIR}/i3
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

# Copying my I3 configuration
[ ! -d ${CONFIG_DIR}/i3 ] && ln -s ${DOTFILES_DIR}/i3 ${CONFIG_DIR}/i3

# Git Config Stuff
[ ! -f ${HOME}/.gitconfig ] && ln -s ${DOTFILES_DIR}/gitconfig ${HOME}/.gitconfig

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
[ -z ${DOTFILES_SETUP+x} ] && cat ${DOTFILES_DIR}/bash/bashrc >> ${HOME}/.bashrc

# Add Neovim packages
curl -fLo ${NVIM_DIR}/autoload/plug.vim --create-dirs ${VIM_PLUG_URL}

# Adding my flake8 ignore file
[ ! -f ${CONFIG_DIR}/flake8 ] && ln -s ${DOTFILES_DIR}/flake8 ${CONFIG_DIR}/flake8
