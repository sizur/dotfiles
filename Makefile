SHELL=/bin/bash

install: tmux zsh fish emacs-packages

update: submodules
	cd .emacs.d && wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar
	cd .emacs.d/src/haskell-mode && make haskell-mode-autoloads.el
	cd .emacs.d/src/org-mode && make autoloads
	cd .emacs.d/src/magit && EFLAGS="-L ../git-modes" make lisp docs
	cd .emacs.d/src/predictive && make

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

tmux:
	cp -f .tmux.conf ~/

zsh:
	cp -f .zshrc .zshrc.local ~/

fish:
	cp -rf .config ~/

fonts:
	cp -rf .fonts ~/

fonts-setup:
	mkfontdir ~/.fonts
	xset fp+ ~/.fonts
	xset fp rehash
	fc-cache -f -v

zsh-autosuggestions:
	cp -rf .zsh-autosuggestions ~/

emacs-packages:
	rsync -vurl .emacs.d/ ~/.emacs.d/
	rm ~/.emacs.d/emacs.el ~/.emacs.d/.#emacs.org || true

emacs:
	cd .emacs && ./autogen.sh && ./configure && make && sudo make install
	cd .emacs && git reset --hard head && git clean -f

customizations:
	cp ~/.emacs.d/customizations.el .emacs.d/
