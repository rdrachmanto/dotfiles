(deftheme cisco-dark
  "Cisco Dark Theme")

(let (;; Color definitions
      ;; Let's do it in a clear way
      
      ;; UI colors
      (bg "#0e100f")
      (bg+1 "#1e201f")
      (bg+2 "#1f211f")
      (border "#403e3c")
      (fg "#a0a0a0")
      (fg-dim "#878580")
      (fg-dim+1 "#403e3c")

      ;; Accents for syntax
      (accent-parens "#2b5375")
      (accent-def "#b392f1")
      (accent-var "#4385be")
      (accent-str "#879a39")
      (accent-num "#da702c")
      (accent-comments "#ad8301")
      (accent-doc "#ad8301")
      
      ;; UI accents
      (accent-cursor "#fe9900")
      (accent-hl-line "#1e201f")

      ;; Signals -- for diagnostics and diff-hl
      ;; reuse signal-ok for diff-hl-insert
      ;;       signal-info for diff-hl-change
      ;;       signal-error for diff-hl-delete
      (signal-ok "#6c7b2e")
      (signal-warn "#ffab70")
      (signal-error "#d14d41")
      (signal-info "#79b8ff"))
  (custom-theme-set-faces
   'cisco-dark
   ;; UI elements
   `(default ((t (:background ,bg :foreground ,fg))))
   `(vertical-border ((t (:foreground ,border))))
   `(internal-border ((t (:foreground ,border, :background ,bg))))
   `(mode-line ((t (:background ,border foreground ,fg))))
   `(mode-line-inactive ((t (:background ,bg :foreground ,accent-comments))))
   `(region ((t (:background ,border))))
   `(hl-line ((t (:background ,accent-hl-line))))
   `(cursor ((t (:background ,accent-cursor))))

   `(line-number ((t (:foreground ,fg-dim+1))))
   `(line-number-current-line ((t (:foreground ,accent-num))))

   `(fringe ((t (:background ,bg :foreground ,bg))))
   `(window-divider ((t (:background ,bg :foreground ,border))))
   
   `(minibuffer-prompt ((t (:foreground ,signal-info))))
   `(icomplete-selected-match ((t (:background ,border))))

   ;; Tab-bar mode
   `(tab-bar ((t (:inherit nil :background ,bg))))
   `(tab-bar-tab-inactive ((t :background ,bg+1 :box (:color ,bg+1 :line-width 4))))
   `(tab-bar-tab ((t :background ,border :foreground ,fg :weight bold :box (:color ,border :line-width 4))))
   
   ;; Text highlighting
   `(font-lock-comment-face ((t (:foreground ,accent-comments))))
   `(font-lock-doc-face ((t (:foreground ,accent-doc))))
   `(font-lock-comment-delimiter-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-string-face ((t (:foreground ,accent-str))))
   `(font-lock-regexp-face ((t (:inherit 'default))))
   `(font-lock-number-face ((t (:foreground ,accent-num))))
   `(font-lock-punctuation-face ((t (:inherit 'default))))
   `(font-lock-operator-face ((t (:inherit 'default))))

   
   `(font-lock-constant-face ((t (:foreground ,accent-num))))
   `(font-lock-variable-name-face ((t (:inherit 'default))))
   `(font-lock-variable-use-face ((t (:inherit 'default))))
   `(font-lock-function-name-face ((t (:foreground ,accent-def))))
   `(font-lock-function-call-face ((t (:inherit 'default))))
   `(font-lock-type-face ((t (:inherit 'default))))
   
   `(font-lock-builtin-face ((t (:inherit 'default :weight bold))))
   `(font-lock-keyword-face ((t (:inherit 'default :weight bold))))

   ;; Flymake
   `(flymake-note-echo ((t (:foreground ,signal-info))))
   `(flymake-warning-echo ((t (:foreground ,signal-warn))))
   `(flymake-error-echo ((t (:foreground ,signal-error))))

   ;; Markdown
   `(markdown-code-face ((t (:inherit nil))))
   `(markdown-hr-face ((t (:foreground ,bg+1))))

   ;; Eglot
   `(eglot-inlay-hint-face ((t (:inherit nil :foreground ,fg :height 0.8))))

   ;; Eldoc box
   `(eldoc-box-body ((t :background ,bg+2)))
   `(eldoc-box-border ((t :background ,bg+2)))

   ;; Rainbow delim
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,accent-parens))))

   ;; Org
   `(org-document-info-keyword ((t (:foreground ,fg))))
   `(outline-1 ((t (:foreground ,accent-def))))
   `(outline-2 ((t (:foreground ,accent-def))))
   `(outline-3 ((t (:foreground ,accent-def))))
   `(outline-4 ((t (:foreground ,accent-def))))
   `(outline-5 ((t (:foreground ,accent-def))))
   `(outline-6 ((t (:foreground ,accent-def))))
   `(outline-7 ((t (:foreground ,accent-def))))
   
   ;; Diff-hl
   `(diff-hl-insert ((t :foreground nil :background ,signal-ok :inherit nil)))
   `(diff-hl-change ((t :foreground nil :background ,signal-info :inherit nil)))
   `(diff-hl-delete ((t :foreground nil :background ,signal-error :inherit nil)))
   ))

(provide-theme 'cisco-dark)
(provide 'cisco-dark-theme)
