;;; ob-metapost.el --- org-babel functions for metapost evaluation

;; Copyright (C) 2010-2014 Free Software Foundation, Inc.

;; Author: Yevgeniy Grigoryev
;; Keywords: literate programming, reproducible research
;; Homepage: http://orgmode.org

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Org-Babel support for evaluating plantuml script.
;;
;; Inspired by Ian Yang's org-export-blocks-format-plantuml
;; http://www.emacswiki.org/emacs/org-export-blocks-format-plantuml.el

;;; Requirements:

;; mpost
(require 'xml)

;;; Code:
(require 'ob)

(defvar org-babel-default-header-args:metapost
  '((:results . "file") (:exports . "results"))
  "Default arguments for evaluating a plantuml source block.")

(defcustom org-mpost-path "/usr/bin/mpost"
  "Path to the mpost binary."
  :group 'org-metapost
  :version "24.1"
  :type 'string)
(defcustom org-convert-path "/usr/bin/convert"
  "Path to the mpost binary."
  :group 'org-metapost
  :version "24.1"
  :type 'string)

(defun svg-rezise-to-width (svg new-width)
  (let* ((svg-attr (car (cdr svg)))
         (width (cdr (car (--filter (eq (car it) 'width) svg-attr))))
         (height (cdr (car (--filter (eq (car it) 'height) svg-attr))))
         (factor (/ (float new-width) (string-to-number width)))
         (svg-attr-new (--map-when
                        (or (eq 'width (car it))
                            (eq 'height (car it)))
                        (cons (car it) (number-to-string (* factor (string-to-number (cdr it)))))
                        svg-attr)))
    (cons 'svg (cons svg-attr-new (cdr (cdr svg))))))

(defun org-babel-execute:metapost (body params)
  "Execute a block of metapost code with org-babel.
This function is called by `org-babel-execute-src-block'."
  (let* ((result-params (split-string (or (cdr (assoc :results params)) "")))
	 (out-file (or (cdr (assoc :file params))
		       (error "Metapost requires a \":file\" header argument")))
	 (header (or (cdr (assoc :header params)) ""))
         (width (or (cdr (assoc :width params)) 0))
	 (in-file (org-babel-temp-file "metapost-"))
	 (cmd (if (string= "" org-mpost-path)
		  (error "`org-mpost-path' is not set")
		(concat org-mpost-path " " in-file))))
    (unless (file-exists-p org-mpost-path)
      (error "Could not find mpost binary at %s" org-mpost-path))
    (with-temp-file in-file (insert (concat "outputtemplate := \"" out-file "\";\n"
                                            "outputformat := \""
                                            (file-name-extension out-file)
                                            "\";\n"
                                            header "\n"
                                            "beginfig(1);\n"
                                            body
                                            "\nendfig;\n"
                                            "end\n")))
    (message "%s" cmd) (org-babel-eval cmd "")
    (if (eq width 0) nil
      (with-temp-buffer
        (xml-print (list (svg-rezise-to-width
                          (car (xml-parse-file out-file))
                          width)))
        (write-file out-file)))
    nil)) ;; signal that output has already been written to file

(defun org-babel-prep-session:metapost (session params)
  "Return an error because plantuml does not support sessions."
  (error "Metapost does not support sessions"))

(provide 'ob-metapost)

;;; ob-plantuml.el ends here
