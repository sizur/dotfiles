(when (>= emacs-major-version 24)

  (require 'package)

  (setq package-archives
        '(("org"          . "http://orgmode.org/elpa/")
          ("elpy"         . "https://jorgenschaefer.github.io/packages/")
          ("gnu"          . "https://elpa.gnu.org/packages/")
          ("melpa"        . "https://melpa.org/packages/")
          ("melpa-stable" . "https://stable.melpa.org/packages/")
          ))

  (package-initialize)

  ;; update package list
  (package-refresh-contents)

  ;; ensure use-package is installed
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (require 'use-package)
  
  ;; always try to use package.el
  (setq use-package-always-ensure t)
  
  ;; ensure use-package is updated from stable
  (use-package use-package
    ;; :pin melpa-stable
    )

    ;; emacs.d directory
  (defconst sizur/emacs.d
    (expand-file-name ".emacs.d" (getenv "HOME")))

  ;; emacs.d subdirectory function
  (defun sizur/emacs.d (d)
    (expand-file-name d sizur/emacs.d))

  ;; update org-mode and use babel
  (use-package org
    :ensure org-plus-contrib
    :pin org
    :config
    (require 'ob)
    (require 'ob-tangle)
    
    ;; tangle and evaluate literate configuration
    (org-babel-load-file (sizur/emacs.d "emacs.org"))))
