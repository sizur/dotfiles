
(setq user-mail-address "eugene.grigoriev@gmail.com")
(setq user-full-name "Eugene Grigoriev")
;(set-face-attribute 'default nil :height 100)
(put 'overwrite-mode 'disabled t)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
(global-font-lock-mode t)
(column-number-mode t)
(global-linum-mode t)
(auto-compression-mode t)
(setq-default indent-tabs-mode nil)
(setq frame-title-format "%b - emacs")
(setq require-final-newline 't)

(setq inhibit-splash-screen t)
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

(show-paren-mode 1)
(require 'highlight-parentheses)

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
   (plantuml . t)
   ))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

(add-to-list 'load-path "~/.emacs.d/src/org-impress-js.el")
(require 'org-impress-js)

(add-to-list 'load-path
             "~/.emacs.d/src/emacs-calfw")
(require 'calfw-cal)
(require 'calfw-ical)
(require 'calfw-org)

(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    ;(cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
    (cfw:ical-create-source "main"  "~/calendars/my-main.ics" "IndianRed")
    (cfw:ical-create-source "bdays" "~/calendars/my-birthdays.ics" "Orange")
   )))

(add-to-list 'load-path
             "~/.emacs.d/src/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/src/yasnippet/snippets"
                         ;"~/.emacs.d/src/yasnippet/extras/imported"
                         ))
(yas/global-mode 1)

(add-to-list 'load-path
             "~/.emacs.d/src/multiple-cursors.el")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(add-to-list 'load-path
             "~/.emacs.d/src/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(load "~/.emacs.d/src/auctex.el" nil t t)
(load "~/.emacs.d/src/preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(add-to-list 'load-path
             "~/.emacs.d/src/zencoding")
(require 'zencoding-mode)
(add-hook 'nxml-mode-hook 'zencoding-mode)

(load "~/.emacs.d/src/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(require 'perltidy)
(eval-after-load 'perl-mode
  '(define-key perl-mode-map (kbd "C-c C-c") 'perltidy-dwim))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;(setq linum-relativenumber-last-pos 0)
(setq linum-last-pos 0) ; needed during sturtup

(defadvice linum-update (before linum-relativenumber-linum-update activate)
  (setq linum-last-pos (line-number-at-pos)))

(defun linum-relativenumber-format (line-number)
  (let ((diff (abs (- line-number linum-last-pos)))
        (w (length (number-to-string
                    (count-lines (point-min) (point-max))))))
    (concat (format "%d" line-number)
            (format (concat "%" (number-to-string (+ 1 w (- w (length (number-to-string line-number))))) "d")
                    diff))))

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;(global-set-key [remap goto-line] 'goto-line-with-feedback)
(setq linum-format 'linum-relativenumber-format)

(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key "\C-x\C-c" 'dont-kill-emacs)
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)

(setq vc-make-backup-files t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory ".backups")))))

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(server-start)
(require 'org-protocol)
(org-agenda-list)
