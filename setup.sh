#!/bin/sh

DOTFILES_DIR=${HOME}/dotfiles
CONFIG_DIR=${HOME}/.config
NVIM_DIR=${CONFIG_DIR}/nvim
BIN_DIR=${HOME}/bin
FZF_DIR=${HOME}/.fzf
VCPROMPT_URL="https://github.com/djl/vcprompt/raw/master/bin/vcprompt"
FZF_URL="https://github.com/junegunn/fzf.git"

# Making the right directories, but only if needed!
if [ ! -d ${CONFIG_DIR} ]; then
  mkdir ${CONFIG_DIR}
fi
if [ ! -d ${BIN_DIR} ]; then
  mkdir -p ${BIN_DIR}
fi

# NeoVim Setup
if [ ! -d ${NVIM_DIR} ]; then
  mkdir -p ${NVIM_DIR}
fi
ln -s ${DOTFILES_DIR}/neovim ${NVIM_DIR}

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
if [ ! -z "$DOTFILES_SETUP" ]; then
  cat ${DOTFILES_DIR}/bash/bashrc >> ${HOME}/.bashrc
fi
