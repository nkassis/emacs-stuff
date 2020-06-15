(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Removing useless things
(menu-bar-mode -1)
(tool-bar-mode -1)

;; theme
(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

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
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (magit direnv use-package ivy eglot jedi flymake-python-pyflakes zenburn-theme undo-tree rainbow-delimiters paredit elpy))))

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


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Company mode
(use-package company
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t))

;; paredit
(global-set-key [f7] 'paredit-mode)

;; undo-tree
(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)))

;; show parens mode on and no delay
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Better handling of paranthesis when writing Lisps.
(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly))
  :diminish nil)

;; eglot language server
(use-package eglot
  :ensure t)

(add-hook 'rust-mode-hook
          (lambda ()
	    (setq indent-tabs-mode nil)
	    (setq rust-format-on-save t)))

(add-hook 'rust-mode-hook 'cargo-minor-mode)

(use-package direnv
  :init
  (add-hook 'prog-mode-hook #'direnv-update-environment)
  :config
  (direnv-mode))

;; Git integration for Emacs
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

