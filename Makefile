SHELL:=$(shell which bash)

.PHONY: install update grml submodules tmux oh-my-zsh fonts emacs customizations

install: fonts xmonad tmux emacs oh-my-zsh-install oh-my-zsh plantuml

submodules-update:
	git pull
#	git submodule update --init --recursive
	git submodule foreach -q --recursive 'git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)'
	git submodule update --recursive --remote

submodules-init:
	git submodule update --init --recursive

tmux:
#	cd maglev && make install
	cp .tmux.conf ~/

oh-my-zsh-install:
	$(SHELL) -c "$$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sed -e 's/^env zsh$$/\# env zsh/')"
	@echo oh-my-zsh installed

oh-my-zsh:
	cp bullet-train-oh-my-zsh-theme/bullet-train.zsh-theme ~/.oh-my-zsh/themes/
	cp sizur.zsh ~/.oh-my-zsh/custom/

#zsh:
#	cp -f .zshrc .zshrc.local ~/

fish:
	cp -rf .config ~/

fonts:
	rm -rf ~/.fonts || true
	mkdir -p ~/.local/share/fonts
	ln -s ~/.local/share/fonts ~/.fonts
#	cp -f .fonts/*pcf* ~/.local/share/fonts/
	find fonts \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0 | xargs -0 -I % cp "%" ~/.local/share/fonts
	mkfontscale ~/.local/share/fonts
	mkfontdir ~/.local/share/fonts

xmonad:
	cp .xinitrc ~/
	cp -rf .xmonad ~/
	cp -rf .dzen ~/
	cp .conky_bar ~/
	sed -i "s|~home|$$HOME|g" ~/.conky_bar
	mkdir -p ~/Downloads
	mkdir -p ~/music
	mkdir -p ~/.config/conky/scripts
	cp .config/conky/scripts/conky_lua_scripts.lua ~/.config/conky/scripts/

urxvt: xmonad
	cp .Xdefaults ~/
	mkdir -p ~/.urxvt/ext
	cp .urxvt/font-size/font-size ~/.urxvt/ext/
	cp .urxvt/tabbedex/tabbedex ~/.urxvt/ext/
	cp .urxvt/vtwheel ~/.urxvt/ext/
	xrdb ~/.Xdefaults

zsh-autosuggestions:
	cp -rf .zsh-autosuggestions ~/

emacs:
	rsync -vurl --exclude=.git/ .emacs.d/ ~/.emacs.d/
	rm ~/.emacs.d/emacs.el ~/.emacs.d/.#emacs.org || true

rtags:
#	cd .emacs.d/src/rtags && rm -rf bld && mkdir bld && cd bld && cmake -DCMAKE_BUILD_TYPE=Release .. && make
	cd .emacs.d/src/rtags && cmake -DCMAKE_INSTALL_PREFIX=$(shell pwd)/.emacs.d/local && make install

customizations:
	cp ~/.emacs.d/customizations.el .emacs.d/
