exa: rust
	git clone https://github.com/ogham/exa
	cd exa && sudo -H PATH=${PATH}:${HOME}/.cargo/bin make install

rust:
	sudo -H curl https://sh.rustup.rs -sSf | sh

