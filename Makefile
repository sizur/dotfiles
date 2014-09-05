SHELL=/bin/bash

install: zsh fish emacs-packages

update: submodules
	cd .emacs.d && wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar
	cd .emacs.d/src/haskell-mode && make haskell-mode-autoloads.el
	cd .emacs.d/src/org-mode && make autoloads
	cd .emacs.d/src/magit && EFLAGS="-L ../git-modes" make lisp docs

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

zsh: zsh-autosuggestions fonts
	cp -f .zshrc ~/

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
	cp -rf .emacs.d ~/

emacs:
	cd .emacs && ./autogen.sh && ./configure && make && sudo make install
	cd .emacs && git reset --hard head && git clean -f
