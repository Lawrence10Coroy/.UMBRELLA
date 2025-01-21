#!/usr/bin/bash
#AUTOR: LAWRENCE COROY

[ $# -le 0 ] && {
	while read -p "Already removing UMBRELLA? [y/n] " opt && [ -z $opt ]
	do
		continue
	done
	[ $opt = n ] || [ $opt = not ] && { exit 1; }
	[ $opt = y ] || [ $opt = yes ] && {
		yes|pkg uninstall lsd
		rm ~/.bashrc
		rm $PREFIX/var/log/Umbrella.log
		rm -rf ~/.config/lsd
		rm -r ~/.zshrc && mv ~/.zshrc.old.* ~/.zshrc &>/dev/null;
		rm -r ~/.oh-my-zsh/themes/Umbrella_cyan.zsh-theme ~/.oh-my-zsh/themes/Umbrella_red.zsh-theme;
		rm -r $PREFIX/etc/zshrc && mv $PREFIX/etc/zshrc.old.* $PREFIX/etc/zshrc;
		rm ~/.tmux/.tmux.conf ~/.tmux/.tmux.conf.local;
		rm -rf ~/.termux && mv ~/.termux.old ~/.termux;
		rm ~/.config/nvim/init.vim;
		rm ~/.vimrc
		rm -rf ~/.UMBRELLA;}
	}

