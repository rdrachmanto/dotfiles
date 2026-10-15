;;; Theming:

(setq cisco-themes-large-mode-line t
      cisco-themes-pop-keywords nil
      cisco-themes-italic-keywords t)
(load-theme 'cisco-dark t)


;;; Emacs:
(setq-default indent-tabs-mode nil)
(use-package emacs
  :ensure nil
  :init
  ;; Helper modes
  (fido-vertical-mode t)
  (which-key-mode t)
  (windmove-default-keybindings)
  (menu-bar--display-line-numbers-mode-relative)
  (set-fringe-mode '(5 . 0))
  (electric-pair-mode)
  (tab-bar-mode)
  (save-place-mode)
  (global-auto-revert-mode)
  (global-hl-line-mode)
  (global-visual-line-mode)
  (delete-selection-mode)
  (outline-minor-mode)

  (setq history-length 25)
  (savehist-mode)
  (recentf-mode)

  (setq delete-by-moving-to-trash t)

  (setq use-dialog-box nil)
  ;; Completion settings
  (setq tab-always-indent 'complete)
  (global-completion-preview-mode)
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-auto-help 'lazy
	completion-auto-select 'second-tab
	completion-cycle-threshold 3
	completions-format 'horizontal
	completions-sort 'historical
	completions-max-height 10
	completion-show-help nil
	completion-styles '(basic partial-completion substring initials))
  (setq minibuffer-visible-completions t
	resize-mini-windows t
	max-mini-window-height 0.15
	completions-detailed t)

  ;; Initial screen
  (setq initial-scratch-message ""
	inhibit-startup-screen t)

  ;; Scroll smoothly
  (setq scroll-conservatively 10
	scroll-margin 15)

  ;; Tab-bar
  (setq tab-bar-tab-hints t
	tab-bar-close-button-show nil
	tab-bar-auto-width nil
	tab-bar-new-button nil
	tab-bar-new-tab-choice "*scratch*")

  (require 'setup-tab-bar)

  (keymap-global-set "C-c t t" 'tab-list)
  (keymap-global-set "C-c t n" 'tab-new)
  (keymap-global-set "C-c t r" 'tab-rename)
  (keymap-global-set "C-c t d" 'tab-close)
  (keymap-global-set "C-c [" 'tab-previous)
  (keymap-global-set "C-c ]" 'tab-next)

  ;; Org-mode

  (setq org-hide-leading-stars t
	org-startup-indented t)

  :hook
  (org-mode . display-line-numbers-mode)
  (text-mode . display-line-numbers-mode))

;; Hooks
(add-hook 'prog-mode-hook
	  (lambda ()
            (outline-minor-mode)
	    (setq display-line-numbers-width 3)
	    (display-line-numbers-mode)
	    (column-number-mode)))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-window-fringes
             (minibuffer-window frame) 6 6 nil t)))

(add-hook 'emacs-lisp-mode
          (lambda ()
            (outline-minor-mode)))

;;; Dired:

(use-package dired
  :ensure nil
  :config
  (setq dired-listing-switches "-alh --group-directories-first --no-group"
	dired-dwim-target t
	dired-recursive-copies 'always
	dired-create-destination-dirs 'ask
	dired-kill-when-opening-new-dired-buffer t)
  :hook
  (dired-mode . dired-hide-details-mode)) ; Remove details, can be toggled with '('


;;; Programming:

(use-package eglot
  :ensure nil
  :config
  (setq eglot-ignored-server-capabilites '(:inlayHintProvider))
  :hook
  (prog-mode . eglot-ensure))

(use-package eldoc
  :ensure nil
  :config
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
	eldoc-echo-area-use-multiline-p nil))
(use-package direnv
  :ensure t
  :config (direnv-mode))

;; Programming modes
(setq treesit-auto-install-grammar 'ask
      treesit-enabled-modes t)

(setq treesit-font-lock-level 4)   ;; max level is 4
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package emmet-mode
  :ensure t
  :config
  (setq emmet-move-cursor-between-quotes t)
  :hook
  (sgml-mode . emmet-mode)
  (css-mode . emmet-mode))

(use-package clojure-mode
  :ensure t)
(use-package clojure-ts-mode
  :ensure t)

(use-package nix-mode
  :ensure t)
(use-package nix-ts-mode
  :ensure t)

;; (use-package janet-mode
;;   :ensure t)
;; (use-package janet-ts-mode
;;   :vc (:url "https://github.com/sogaiu/janet-ts-mode"
;;        :rev :newest))

(use-package go-mode
  :ensure t)

;; Major mode remap
;; (add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(clojure-mode . clojure-ts-mode))
(add-to-list 'major-mode-remap-alist '(nix-mode . nix-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(janet-mode . janet-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))

;; Magit
(use-package magit
  :ensure t)

;; Autocompletions
(use-package corfu
  :ensure t
  :config
  (setq corfu-cycle t
	corfu-auto t
	corfu-auto-delay 0.2
	corfu-auto-prefix 2
	corfu-quit-no-match t)
  :hook (prog-mode . corfu-mode))

;; Popup documentation
(use-package eldoc-box
  :ensure t
  :bind (("C-c k" . eldoc-box-help-at-point)))


;;; Display rules:

(require 'window-rules)

(defvar blist-for-bottom-panel
      '(("^\\*[Ff]lymake.*\\*$" 0)
        ("^\\*eat\\*$" 0)
        ("^\\*xref\\*$" 0)
        ("^\\*[Cc]ompletions\\*$" 0)))

(defvar blist-for-right-panel
  '(("^\\*[Hh]elp\\*$" 1)
    ("^\\*[Ee]ldoc\\*$" -1)))

(setq window-rules-bottom-panel-list blist-for-bottom-panel
      window-rules-right-panel-list blist-for-right-panel
      window-rules-bottom-panel-size 0.15
      window-rules-right-panel-size 0.12)
(window-rules-apply)


;;; Movement:

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("C-c w" . ace-window)))

;; Modal editing
(use-package meow
  :ensure t
  :config
  (require 'meow-keybinds)  ;; Keybinds for movement and others defined here
  (meow-setup)
  (meow-setup-indicator)
  (meow-global-mode 1))

(use-package meow-tree-sitter
  :ensure t
  :config
  (meow-tree-sitter-register-defaults))

;; need to think of binds
(use-package multiple-cursors
  :ensure t)

;; Easy way to interact with parens
;; Kind of like paredit
(use-package puni
  :ensure t
  :defer t
  :init (puni-global-mode)
  :hook
  (term-mode . puni-disable-puni-mode)
  :bind (("C-)" . puni-slurp-forward)
         ("C-(" . puni-slurp-backward)
         ("C-}" . puni-barf-forward)
         ("C-{" . puni-barf-backward)
         ("C-c l s" . puni-splice)
         ("C-c l r" . puni-raise)))

(use-package expreg
  :ensure t
  :bind (("C-=" . expreg-expand)
         ("C--" . expreg-contract)))

(use-package move-text
  :ensure t
  :init (move-text-default-bindings))

(defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))

(advice-add 'move-text-up :after 'indent-region-advice)
(advice-add 'move-text-down :after 'indent-region-advice)


;;; Niceties:

(use-package diff-hl
  :ensure t
  :after magit
  :init (global-diff-hl-mode)
  :config
  (setq diff-hl-disable-on-remote t)
  :hook (magit-post-refresh-hook . diff-hl-magit-post-refresh))

(use-package nerd-icons
  :ensure t
  :config
  (setq nerd-icons-scale-factor 1.1))
(use-package nerd-icons-completion
  :ensure t
  :config
  (nerd-icons-completion-mode))
(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))
(use-package nerd-icons-ibuffer
  :ensure t
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package pulsar
  :ensure t
  :config
  (pulsar-global-mode 1))

(use-package eat
  :ensure t
  :bind (("C-c `" . eat)))


;;; Functions:

(require 'rd-functions)

(keymap-global-set "C-c i i" 'rd/open-user-init)
(keymap-global-set "C-c i r" 'rd/reload-user-init)

(keymap-global-set "C-x 2" 'rd/split-below)
(keymap-global-set "C-x 3" 'rd/split-right)

(keymap-global-set "C-c d d" 'rd/open-project-or-buffer-diagnostics)

(keymap-global-set "C-a" 'rd/go-to-beginning-of-line)

(keymap-global-set "C-x b" 'rd/switch-to-buffer)
(keymap-global-set "C-x C-f" 'rd/find-file)
