(setq load-path (cons "~/.emacs.d/python-mode" load-path))

(autoload 'python-mode "python-mode" "Python Mode." t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inferior-lisp-program "lein repl")
 '(inhibit-startup-screen t))
;; Color Settings
(set-foreground-color "white")
(set-background-color "black")

;;Font settings
(set-default-font "menlo-medium-r-normal-16")

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
;; Rails mode
(setq load-path (cons "~/.emacs.d/" load-path))
;;(setq load-path (cons "~/.emacs.d/rails" load-path))
;;(require 'find-recursive)
;;(require 'snippet)
;;(require 'inf-ruby)
;;(require 'rails)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
