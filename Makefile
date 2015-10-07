SHELL=/usr/bin/bash

.PHONY: install update grml submodules tmux oh-my-zsh fonts emacs customizations

install: fonts xdefaults oh-my-zsh-install oh-my-zsh tmux emacs

update: submodules
	cd .emacs.d && wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar
	cd .emacs.d/src/haskell-mode && make haskell-mode-autoloads.el
	cd .emacs.d/src/org-mode && make autoloads
	cd .emacs.d/src/magit && EFLAGS="-L ../git-modes" make lisp docs
#	cd .emacs.d/src/predictive && make

grml:
	wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
#	wget -O .zshrc.local  http://git.grml.org/f/grml-etc-core/etc/skel/.zshrc

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

tmux:
	cd maglev && make install

oh-my-zsh-install:
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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
	xset fp+ ~/.local/share/fonts
	xset fp rehash
	fc-cache -f -v

xdefaults:
	cp .Xdefaults ~/

zsh-autosuggestions:
	cp -rf .zsh-autosuggestions ~/

emacs:
	rsync -vurl .emacs.d/ ~/.emacs.d/
	rm ~/.emacs.d/emacs.el ~/.emacs.d/.#emacs.org || true

customizations:
	cp ~/.emacs.d/customizations.el .emacs.d/
