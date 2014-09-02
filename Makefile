
install: zsh emacs

update: submodules
	cd .emacs.d && wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar
	cd .emacs.d/src/haskell-mode && make haskell-mode-autoloads.el
	cd .emacs.d/src/org-mode && make autoloads

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

zsh: zsh-autosuggestions fonts
	rm -f ~/.zshrc
	cp .zshrc ~/

fonts:
	rm -rf ~/.fonts
	cp -r .fonts ~/

fonts-setup:
	mkfontdir ~/.fonts
	xset fp+ ~/.fonts
	xset fp rehash
	fc-cache -f -v

zsh-autosuggestions:
	rm -rf ~/.zsh-autosuggestions
	cp -r .zsh-autosuggestions ~/

emacs:
	rm -rf ~/.emacs.d
	cp -r .emacs.d ~/

