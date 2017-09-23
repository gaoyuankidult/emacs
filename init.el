;;; install packages for on a fresh emacs

;; load library for directory loading
(load-file "~/.emacs.d/load-directory-mu.el")
(require 'load-directory-mu)

;; list the needed packages
(setq package-list '()) 

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))




;; list the packages you want
(setq package-list
    '(auctex))


;; activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;; load functional modules
(load "~/.emacs.d/00-editor")
(load "~/.emacs.d/01-system")

;;; install python package
;; (see also: https://github.com/dimitri/el-get#basic-setup)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	(goto-char (point-max))
	(eval-print-last-sexp)))
(el-get 'sync)

;;; activate different packages
; invoke the AUCTeX package (LaTeX support)
(require 'tex-site)

;;; tell emacs to not warn me about anything except problems
(setq warning-minimum-level :emergency)
