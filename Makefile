SHELL=/bin/bash

install: zsh fish emacs

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
	cp -rf .config ~/.config

fonts:
	cp -rf .fonts ~/

fonts-setup:
	mkfontdir ~/.fonts
	xset fp+ ~/.fonts
	xset fp rehash
	fc-cache -f -v

zsh-autosuggestions:
	cp -rf .zsh-autosuggestions ~/

emacs:
	cp -rf .emacs.d ~/

