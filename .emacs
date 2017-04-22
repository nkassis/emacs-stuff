(load "package")
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Removing useless things
(menu-bar-mode -1)
(tool-bar-mode -1)

;; theme
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" default)))
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js2-basic-offset 2))

(transient-mark-mode 1)
(global-font-lock-mode 1)

(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "linux")))
;;From Unix Power tools
;; Map \C-h to backwards delete
(define-key global-map "\C-h" 'backward-delete-char)
(setq search-delete-char (string-to-char "\C-h"))
;; Remap help to \C-_
(define-key global-map "\C-_" 'help-command)
(setq help-char (string-to-char "\C-_"))
;; Map \M-h to delete backwards word
(define-key global-map "\M-h" 'backward-kill-word)
;; Remap undo to \C-x \C-u
(define-key global-map "\C-x\C-u" 'undo)
;; Use \C-x \C-v to "visit" new file
(define-key global-map "\C-x\C-v" 'find-file-other-window)
(setq mac-command-key-is-meta nil)

(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; paredit
(global-set-key [f7] 'paredit-mode)


;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion

(require 'undo-tree)
(global-undo-tree-mode)

(show-paren-mode 1)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
