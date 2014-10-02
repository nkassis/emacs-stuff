(load "package")
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; Removing useless things
(menu-bar-mode -1)
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2))
;; Color Settings
;;(set-foreground-color "white")
;;(set-background-color "black")

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

(setq load-path (cons "~/.emacs.d/" load-path))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; rainbow delimiters
(global-rainbow-delimiters-mode)

;; paredit
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(global-set-key [f7] 'paredit-mode)

;; nrepl
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;; theme
(load-theme 'solarized-light t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(cursor-type 'bar t)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(tool-bar-mode nil))

(require 'undo-tree)
(global-undo-tree-mode)

(show-paren-mode 1)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
