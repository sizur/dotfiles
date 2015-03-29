(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(global-paren-face-mode t)
 '(icicle-Completions-text-scale-decrease 0.0)
 '(icicle-top-level-key-bindings
   (quote
    (([pause]
      icicle-switch-to/from-minibuffer t)
     ("`" icicle-search-generic t)
     ("$" icicle-search-word t)
     ("^" icicle-search-keywords t)
     (";" icicle-occur t)
     ("=" icicle-imenu t)
     ("\"" icicle-search-text-property t)
     ("/" icicle-complete-thesaurus-entry
      (fboundp
       (quote icicle-complete-thesaurus-entry)))
     ([24 134217829]
      icicle-execute-named-keyboard-macro t)
     (" " icicle-command-abbrev t)
     ("5o" icicle-select-frame t)
     ("" icicle-describe-option-of-type t)
     ([S-f4]
      icicle-kmacro t)
     (abort-recursive-edit icicle-abort-recursive-edit t)
     (apropos icicle-apropos t)
     (apropos-command icicle-apropos-command t)
     (apropos-value icicle-apropos-value t)
     (apropos-variable icicle-apropos-option
                       (fboundp
                        (quote icicle-apropos-option)))
     (apropos-variable icicle-apropos-variable
                       (not
                        (fboundp
                         (quote icicle-apropos-option))))
     (apropos-zippy icicle-apropos-zippy t)
     (bookmark-jump icicle-bookmark t)
     (bookmark-jump-other-window icicle-bookmark-other-window t)
     (bookmark-set icicle-bookmark-cmd t)
     (customize-apropos icicle-customize-apropos t)
     (customize-apropos-faces icicle-customize-apropos-faces t)
     (customize-apropos-groups icicle-customize-apropos-groups t)
     (customize-apropos-options icicle-customize-apropos-options t)
     (customize-face icicle-customize-face t)
     (customize-face-other-window icicle-customize-face-other-window t)
     (dabbrev-completion icicle-dabbrev-completion
                         (< emacs-major-version 24))
     (delete-window icicle-delete-window t)
     (delete-windows-for icicle-delete-window t)
     (dired icicle-dired t)
     (dired-other-window icicle-dired-other-window t)
     (exchange-point-and-mark icicle-exchange-point-and-mark t)
     (execute-extended-command icicle-execute-extended-command t)
     (find-file icicle-file t)
     (find-file-other-window icicle-file-other-window t)
     (find-file-read-only icicle-find-file-read-only t)
     (find-file-read-only-other-window icicle-find-file-read-only-other-window t)
     (insert-buffer icicle-insert-buffer t)
     (kill-buffer icicle-kill-buffer t)
     (kill-buffer-and-its-windows icicle-kill-buffer t)
     (minibuffer-keyboard-quit icicle-abort-recursive-edit
                               (fboundp
                                (quote minibuffer-keyboard-quit)))
     (other-window icicle-other-window-or-frame t)
     (other-window-or-frame icicle-other-window-or-frame t)
     (pop-global-mark icicle-goto-global-marker-or-pop-global-mark t)
     (repeat-complex-command icicle-repeat-complex-command t)
     (set-mark-command icicle-goto-marker-or-set-mark-command t)
     (switch-to-buffer icicle-buffer t)
     (switch-to-buffer-other-window icicle-buffer-other-window t)
     (where-is icicle-where-is t)
     (yank icicle-yank-maybe-completing t)
     (yank-pop icicle-yank-pop-commands
               (featurep
                (quote second-sel)))
     (yank-pop-commands icicle-yank-pop-commands
                        (featurep
                         (quote second-sel)))
     (zap-to-char icicle-zap-to-char
                  (fboundp
                   (quote read-char-by-name)))
     ("jt" icicle-find-file-tagged
      (featurep
       (quote bookmark+)))
     ("4jt" icicle-find-file-tagged-other-window
      (featurep
       (quote bookmark+)))
     (bmkp-autofile-set icicle-bookmark-a-file
                        (fboundp
                         (quote bmkp-bookmark-a-file)))
     (bmkp-tag-a-file icicle-tag-a-file
                      (fboundp
                       (quote bmkp-tag-a-file)))
     (bmkp-untag-a-file icicle-untag-a-file
                        (fboundp
                         (quote bmkp-untag-a-file)))
     (bmkp-find-file icicle-find-file-handle-bookmark
                     (fboundp
                      (quote bmkp-find-file)))
     (bmkp-find-file-other-window icicle-find-file-handle-bookmark-other-window
                                  (fboundp
                                   (quote bmkp-find-file-other-window)))
     (bmkp-autofile-jump icicle-bookmark-autofile
                         (fboundp
                          (quote bmkp-autofile-jump)))
     (bmkp-autofile-jump-other-window icicle-bookmark-autofile-other-window
                                      (fboundp
                                       (quote bmkp-autofile-jump)))
     (bmkp-autonamed-jump icicle-bookmark-autonamed
                          (fboundp
                           (quote bmkp-autonamed-jump)))
     (bmkp-autonamed-jump-other-window icicle-bookmark-autonamed-other-window
                                       (fboundp
                                        (quote bmkp-autonamed-jump)))
     (bmkp-autonamed-this-buffer-jump icicle-bookmark-autonamed-this-buffer
                                      (fboundp
                                       (quote bmkp-autonamed-this-buffer-jump)))
     (bmkp-bookmark-file-jump icicle-bookmark-bookmark-file
                              (fboundp
                               (quote bmkp-bookmark-file-jump)))
     (bmkp-bookmark-list-jump icicle-bookmark-bookmark-list
                              (fboundp
                               (quote bmkp-bookmark-list-jump)))
     (bmkp-desktop-jump icicle-bookmark-desktop
                        (fboundp
                         (quote bmkp-desktop-jump)))
     (bmkp-dired-jump icicle-bookmark-dired
                      (fboundp
                       (quote bmkp-dired-jump)))
     (bmkp-dired-jump-other-window icicle-bookmark-dired-other-window
                                   (fboundp
                                    (quote bmkp-dired-jump)))
     (bmkp-file-jump icicle-bookmark-file
                     (fboundp
                      (quote bmkp-file-jump)))
     (bmkp-file-jump-other-window icicle-bookmark-file-other-window
                                  (fboundp
                                   (quote bmkp-file-jump)))
     (bmkp-file-this-dir-jump icicle-bookmark-file-this-dir
                              (fboundp
                               (quote bmkp-file-this-dir-jump)))
     (bmkp-file-this-dir-jump-other-window icicle-bookmark-file-this-dir-other-window
                                           (fboundp
                                            (quote bmkp-file-this-dir-jump)))
     (bmkp-gnus-jump icicle-bookmark-gnus
                     (fboundp
                      (quote bmkp-gnus-jump)))
     (bmkp-gnus-jump-other-window icicle-bookmark-gnus-other-window
                                  (fboundp
                                   (quote bmkp-gnus-jump)))
     (bmkp-image-jump icicle-bookmark-image
                      (fboundp
                       (quote bmkp-image-jump)))
     (bmkp-image-jump-other-window icicle-bookmark-image-other-window
                                   (fboundp
                                    (quote bmkp-image-jump)))
     (bmkp-info-jump icicle-bookmark-info
                     (fboundp
                      (quote bmkp-info-jump)))
     (bmkp-info-jump-other-window icicle-bookmark-info-other-window
                                  (fboundp
                                   (quote bmkp-info-jump)))
     (bmkp-local-file-jump icicle-bookmark-local-file
                           (fboundp
                            (quote bmkp-local-file-jump)))
     (bmkp-local-file-jump-other-window icicle-bookmark-local-file-other-window
                                        (fboundp
                                         (quote bmkp-local-file-jump)))
     (bmkp-man-jump icicle-bookmark-man
                    (fboundp
                     (quote bmkp-man-jump)))
     (bmkp-man-jump-other-window icicle-bookmark-man-other-window
                                 (fboundp
                                  (quote bmkp-man-jump)))
     (bmkp-non-file-jump icicle-bookmark-non-file
                         (fboundp
                          (quote bmkp-non-file-jump)))
     (bmkp-non-file-jump-other-window icicle-bookmark-non-file-other-window
                                      (fboundp
                                       (quote bmkp-non-file-jump)))
     (bmkp-region-jump icicle-bookmark-region
                       (fboundp
                        (quote bmkp-region-jump)))
     (bmkp-region-jump-other-window icicle-bookmark-region-other-window
                                    (fboundp
                                     (quote bmkp-region-jump)))
     (bmkp-remote-file-jump icicle-bookmark-remote-file
                            (fboundp
                             (quote bmkp-remote-file-jump)))
     (bmkp-remote-file-jump-other-window icicle-bookmark-remote-file-other-window
                                         (fboundp
                                          (quote bmkp-remote-file-jump)))
     (bmkp-specific-buffers-jump icicle-bookmark-specific-buffers
                                 (fboundp
                                  (quote bmkp-specific-buffers-jump)))
     (bmkp-specific-buffers-jump-other-window icicle-bookmark-specific-buffers-other-window
                                              (fboundp
                                               (quote bmkp-specific-buffers-jump)))
     (bmkp-specific-files-jump icicle-bookmark-specific-files
                               (fboundp
                                (quote bmkp-specific-files-jump)))
     (bmkp-specific-files-jump-other-window icicle-bookmark-specific-files-other-window
                                            (fboundp
                                             (quote bmkp-specific-files-jump)))
     (bmkp-temporary-jump icicle-bookmark-temporary
                          (fboundp
                           (quote bmkp-temporary-jump)))
     (bmkp-temporary-jump-other-window icicle-bookmark-temporary-other-window
                                       (fboundp
                                        (quote bmkp-temporary-jump)))
     (bmkp-this-buffer-jump icicle-bookmark-this-buffer
                            (fboundp
                             (quote bmkp-this-buffer-jump)))
     (bmkp-this-buffer-jump-other-window icicle-bookmark-this-buffer-other-window
                                         (fboundp
                                          (quote bmkp-this-buffer-jump)))
     (bmkp-url-jump icicle-bookmark-url
                    (fboundp
                     (quote bmkp-url-jump)))
     (bmkp-url-jump-other-window icicle-bookmark-url-other-window
                                 (fboundp
                                  (quote bmkp-url-jump)))
     (bmkp-w3m-jump icicle-bookmark-w3m
                    (fboundp
                     (quote bmkp-w3m-jump)))
     (bmkp-w3m-jump-other-window icicle-bookmark-w3m-other-window
                                 (fboundp
                                  (quote bmkp-w3m-jump)))
     (bmkp-find-file-all-tags icicle-find-file-all-tags
                              (fboundp
                               (quote bmkp-find-file-all-tags)))
     (bmkp-find-file-all-tags-other-window icicle-find-file-all-tags-other-window
                                           (fboundp
                                            (quote bmkp-find-file-all-tags)))
     (bmkp-find-file-all-tags-regexp icicle-find-file-all-tags-regexp
                                     (fboundp
                                      (quote bmkp-find-file-all-tags-regexp)))
     (bmkp-find-file-all-tags-regexp-other-window icicle-find-file-all-tags-regexp-other-window
                                                  (fboundp
                                                   (quote bmkp-find-file-all-tags-regexp-other-window)))
     (bmkp-find-file-some-tags icicle-find-file-some-tags
                               (fboundp
                                (quote bmkp-find-file-some-tags)))
     (bmkp-find-file-some-tags-other-window icicle-find-file-some-tags-other-window
                                            (fboundp
                                             (quote bmkp-find-file-some-tags-other-window)))
     (bmkp-find-file-some-tags-regexp icicle-find-file-some-tags-regexp
                                      (fboundp
                                       (quote bmkp-find-file-some-tags-regexp)))
     (bmkp-find-file-some-tags-regexp-other-window icicle-find-file-some-tags-regexp-other-window
                                                   (fboundp
                                                    (quote bmkp-find-file-some-tags-regexp-other-window)))
     (bmkp-autofile-all-tags-jump icicle-bookmark-autofile-all-tags
                                  (fboundp
                                   (quote bmkp-autofile-all-tags-jump)))
     (bmkp-autofile-all-tags-jump-other-window icicle-bookmark-autofile-all-tags-other-window
                                               (fboundp
                                                (quote bmkp-autofile-all-tags-jump)))
     (bmkp-autofile-all-tags-regexp-jump icicle-bookmark-autofile-all-tags-regexp
                                         (fboundp
                                          (quote bmkp-autofile-all-tags-regexp-jump)))
     (bmkp-autofile-all-tags-regexp-jump-other-window icicle-bookmark-autofile-all-tags-regexp-other-window
                                                      (fboundp
                                                       (quote bmkp-autofile-all-tags-regexp-jump)))
     (bmkp-autofile-some-tags-jump icicle-bookmark-autofile-some-tags
                                   (fboundp
                                    (quote bmkp-autofile-some-tags-jump)))
     (bmkp-autofile-some-tags-jump-other-window icicle-bookmark-autofile-some-tags-other-window
                                                (fboundp
                                                 (quote bmkp-autofile-some-tags-jump)))
     (bmkp-autofile-some-tags-regexp-jump icicle-bookmark-autofile-some-tags-regexp
                                          (fboundp
                                           (quote bmkp-autofile-some-tags-regexp-jump)))
     (bmkp-autofile-some-tags-regexp-jump-other-window icicle-bookmark-autofile-some-tags-regexp-other-window
                                                       (fboundp
                                                        (quote bmkp-autofile-some-tags-regexp-jump)))
     (bmkp-all-tags-jump icicle-bookmark-all-tags
                         (fboundp
                          (quote bmkp-all-tags-jump)))
     (bmkp-all-tags-jump-other-window icicle-bookmark-all-tags-other-window
                                      (fboundp
                                       (quote bmkp-all-tags-jump)))
     (bmkp-all-tags-regexp-jump icicle-bookmark-all-tags-regexp
                                (fboundp
                                 (quote bmkp-all-tags-regexp-jump)))
     (bmkp-all-tags-regexp-jump-other-window icicle-bookmark-all-tags-regexp-other-window
                                             (fboundp
                                              (quote bmkp-all-tags-regexp-jump)))
     (bmkp-some-tags-jump icicle-bookmark-some-tags
                          (fboundp
                           (quote bmkp-some-tags-jump)))
     (bmkp-some-tags-jump-other-window icicle-bookmark-some-tags-other-window
                                       (fboundp
                                        (quote bmkp-some-tags-jump)))
     (bmkp-some-tags-regexp-jump icicle-bookmark-some-tags-regexp
                                 (fboundp
                                  (quote bmkp-some-tags-regexp-jump)))
     (bmkp-some-tags-regexp-jump-other-window icicle-bookmark-some-tags-regexp-other-window
                                              (fboundp
                                               (quote bmkp-some-tags-regexp-jump)))
     (bmkp-file-all-tags-jump icicle-bookmark-file-all-tags
                              (fboundp
                               (quote bmkp-file-all-tags-jump)))
     (bmkp-file-all-tags-jump-other-window icicle-bookmark-file-all-tags-other-window
                                           (fboundp
                                            (quote bmkp-file-all-tags-jump)))
     (bmkp-file-all-tags-regexp-jump icicle-bookmark-file-all-tags-regexp
                                     (fboundp
                                      (quote bmkp-file-all-tags-regexp-jump)))
     (bmkp-file-all-tags-regexp-jump-other-window icicle-bookmark-file-all-tags-regexp-other-window
                                                  (fboundp
                                                   (quote bmkp-file-all-tags-regexp-jump)))
     (bmkp-file-some-tags-jump icicle-bookmark-file-some-tags
                               (fboundp
                                (quote bmkp-file-some-tags-jump)))
     (bmkp-file-some-tags-jump-other-window icicle-bookmark-file-some-tags-other-window
                                            (fboundp
                                             (quote bmkp-file-some-tags-jump)))
     (bmkp-file-some-tags-regexp-jump icicle-bookmark-file-some-tags-regexp
                                      (fboundp
                                       (quote bmkp-file-some-tags-regexp-jump)))
     (bmkp-file-some-tags-regexp-jump-other-window icicle-bookmark-file-some-tags-regexp-other-window
                                                   (fboundp
                                                    (quote bmkp-file-some-tags-regexp-jump)))
     (bmkp-file-this-dir-all-tags-jump icicle-bookmark-file-this-dir-all-tags
                                       (fboundp
                                        (quote bmkp-file-this-dir-all-tags-jump)))
     (bmkp-file-this-dir-all-tags-jump-other-window icicle-bookmark-file-this-dir-all-tags-other-window
                                                    (fboundp
                                                     (quote bmkp-file-this-dir-all-tags-jump)))
     (bmkp-file-this-dir-all-tags-regexp-jump icicle-bookmark-file-this-dir-all-tags-regexp
                                              (fboundp
                                               (quote bmkp-file-this-dir-all-tags-regexp-jump)))
     (bmkp-file-this-dir-all-tags-regexp-jump-other-window icicle-bookmark-file-this-dir-all-tags-regexp-other-window
                                                           (fboundp
                                                            (quote bmkp-file-this-dir-all-tags-regexp-jump)))
     (bmkp-file-this-dir-some-tags-jump icicle-bookmark-file-this-dir-some-tags
                                        (fboundp
                                         (quote bmkp-file-this-dir-some-tags-jump)))
     (bmkp-file-this-dir-some-tags-jump-other-window icicle-bookmark-file-this-dir-some-tags-other-window
                                                     (fboundp
                                                      (quote bmkp-file-this-dir-some-tags-jump)))
     (bmkp-file-this-dir-some-tags-regexp-jump icicle-bookmark-file-this-dir-some-tags-regexp
                                               (fboundp
                                                (quote bmkp-file-this-dir-some-tags-regexp-jump)))
     (bmkp-file-this-dir-some-tags-regexp-jump-other-window icicle-bookmark-file-this-dir-some-tags-regexp-other-window
                                                            (fboundp
                                                             (quote bmkp-file-this-dir-some-tags-regexp-jump)))
     (find-tag icicle-find-tag
               (fboundp
                (quote command-remapping)))
     (find-tag-other-window icicle-find-first-tag-other-window t)
     (pop-tag-mark icicle-pop-tag-mark
                   (fboundp
                    (quote command-remapping)))
     (eval-expression icicle-pp-eval-expression
                      (fboundp
                       (quote command-remapping)))
     (pp-eval-expression icicle-pp-eval-expression
                         (fboundp
                          (quote command-remapping)))
     ([27 134217848]
      lacarte-execute-command
      (fboundp
       (quote lacarte-execute-command)))
     ([134217824]
      lacarte-execute-menu-command
      (fboundp
       (quote lacarte-execute-menu-command)))
     ([f10]
      lacarte-execute-menu-command
      (fboundp
       (quote lacarte-execute-menu-command))))))
 '(magit-use-overlays nil)
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(icicle-Completions-instruction-1 ((t (:foreground "yellow"))))
 '(icicle-candidate-part ((t (:background "black"))))
 '(icicle-current-candidate-highlight ((t (:background "blue"))))
 '(icicle-extra-candidate ((t (:background "brightblue"))))
 '(icicle-historical-candidate ((t (:foreground "magenta"))))
 '(icicle-mode-line-help ((t (:foreground "white"))))
 '(icicle-proxy-candidate ((t (:background "brightmagenta" :box (:line-width 2 :color "White" :style released-button)))))
 '(icicle-saved-candidate ((t (:background "green"))))
 '(icicle-special-candidate ((t (:background "color-16"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(quack-pltish-defn-face ((t (:foreground "brightyellow" :weight bold)))))
