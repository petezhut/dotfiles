#!/bin/sh

DOTFILES_DIR=${HOME}/dotfiles
CONFIG_DIR=${HOME}/.config
I3_CONFIG=${CONFIG_DIR}/i3
NVIM_DIR=${CONFIG_DIR}/nvim
LILYTERM_DIR=${CONFIG_DIR}/lilyterm
ALACRITTY_DIR=${CONFIG_DIR}/alacritty
BIN_DIR=${HOME}/bin
FZF_DIR=${HOME}/.fzf
PTPYTHON_DIR=${HOME}/.ptpython
VCPROMPT_URL="https://github.com/djl/vcprompt/raw/master/bin/vcprompt"
FZF_URL="https://github.com/junegunn/fzf.git"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Create a new SSH Key
cat /dev/zero | ssh-keygen -q -N ""

# Making the right directories, but only if needed!
[ ! -d ${CONFIG_DIR} ] && mkdir ${CONFIG_DIR}
[ ! -d ${BIN_DIR} ] && mkdir -p ${BIN_DIR}

# NeoVim Setup
[ ! -d ${NVIM_DIR} ] && ln -s ${DOTFILES_DIR}/neovim ${NVIM_DIR}

# Vimrc/NVimrc connection
[ ! -f ${HOME}/.vimrc ] && ln -s ${NVIM_DIR}/init.vim ${HOME}/.vimrc
[ ! -f ${HOME}/.nvimrc ] && ln -s ${NVIM_DIR}/init.vim ${HOME}/.nvimrc
nvim +PlugInstall +qall

# Copying my I3 configuration
[ ! -d ${I3_CONFIG} ] && ln -s ${DOTFILES_DIR}/i3 ${I3_CONFIG}

# Copying my lilyterm configuration
[ ! -d ${LILYTERM_DIR} ] && ln -s ${DOTFILES_DIR}/lilyterm ${LILYTERM_DIR}

# Copying my alacritty configuration
[ ! -d ${ALACRITTY_DIR} ] && ln -s ${DOTFILES_DIR}/alacritty ${ALACRITTY_DIR}

# Git Config Stuff
[ ! -f ${HOME}/.gitconfig ] && ln -s ${DOTFILES_DIR}/gitconfig ${HOME}/.gitconfig

# Tmux Config Stuff
[ ! -f ${HOME}/.tmux.conf ] && ln -s ${DOTFILES_DIR}/tmux.conf ${HOME}/.tmux.conf

# PtPython Config Stuff
[ ! -d ${PTPYTHON_DIR} ] && ln -s ${DOTFILES_DIR}/ptpython ${PTPYTHON_DIR}


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
