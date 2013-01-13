
(setq user-mail-address "eugene.grigoriev@gmail.com")
(setq user-full-name "Eugene Grigoriev")
(setq inhibit-splash-screen t)
(set-face-attribute 'default nil :height 100)
(put 'overwrite-mode 'disabled t)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
(setq make-backup-files nil)
(global-font-lock-mode t)
(column-number-mode t)
(global-linum-mode t)
(show-paren-mode t)
(auto-compression-mode t)
(setq-default indent-tabs-mode nil)
(setq frame-title-format "%b - emacs")
(setq require-final-newline 't)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

(add-to-list 'default-frame-alist '(font . "-*-proggyclean-*-*-*-*-*-*-*-*-*-*-iso8859-*"))

(add-to-list 'load-path "~/.emacs.d/src")
(require 'zenburn-theme)
(load-theme 'zenburn 1)

(setq browse-url-browser-function 'browse-url-xdg-open)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-directory "~/org")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-startup-indented t) ; bugs in overlay
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

; your elisp code here

(add-hook 'org-capture-after-finalize-hook
          (lambda () (if (< 1 (length (frames-on-display-list)))
                         (delete-frame))))
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "captures.org" "Tasks")
         "* TODO %?\n  %U\n  %i\n  %a")
        ("w" "conkeror-integration" entry (file+headline "captures.org" "Web")
         "* %?\n  Source: %u, %c\n\n  %i\n")
        ("b" "Buy" checkitem (file+headline "captures.org" "Buy"))
        ("j" "Journal" entry (file+datetree "journal.org")
         "* %?\n  Entered on %U\n  %i\n  %a")
        ))

;(org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   ))

(add-to-list 'load-path
             "~/.emacs.d/src/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/src/yasnippet/snippets"
                         ;"~/.emacs.d/src/yasnippet/extras/imported"
                         ))
(yas/global-mode 1)

(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key "\C-x\C-c" 'dont-kill-emacs)

(server-start)
(require 'org-protocol)
(org-agenda-list)

; your elisp code here
