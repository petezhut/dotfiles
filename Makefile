DOTFILES_DIR=${HOME}/dotfiles
CONFIG_DIR=${HOME}/.config
I3_CONFIG=${CONFIG_DIR}/i3
NVIM_DIR=${CONFIG_DIR}/nvim
LILYTERM_DIR=${CONFIG_DIR}/lilyterm
BIN_DIR=${HOME}/bin
FZF_DIR=${HOME}/.fzf
PTPYTHON_DIR=${HOME}/.ptpython
VCPROMPT_URL="https://github.com/djl/vcprompt/raw/master/bin/vcprompt"
FZF_URL="https://github.com/junegunn/fzf.git"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

exa: rust
	git clone https://github.com/ogham/exa
	cd exa && sudo -H PATH=${HOME}/.cargo/bin make install

rust:
	sudo -H curl https://sh.rustup.rs -sSf | sh

fzf:
	if [ ! -d  ${FZF_DIR} ]; then
		git clone --depth 1 ${FZF_URL} ${FZF_DIR}
		${FZF_DIR}/install --all
	fi
