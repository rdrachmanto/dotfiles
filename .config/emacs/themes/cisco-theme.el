(deftheme cisco
  "Cisco Theme")

(let (
      ;; Color definitions
      ;; Let's do it in a clear way

      ;; UI colors
      (bg "#fefefe")
      (bg+1 "#cecdc3")
      (bg+2 "#e0e0e0")
      (border "#403e3c")
      (fg "#0e100f")
      (fg-dim "#878580")

      ;; Accents for syntax
      ;; (accent-def "#b3071a")
      (accent-parens "#5b79e3")
      (accent-def "#834de8")
      (accent-str "#448c27")
      (accent-num "#c46222")
      (accent-doc "#d3604f")
      (accent-comments "#878580")
      (accent-var "#5b79e3")

      ;; UI accents
      (accent-cursor "#da702c")
      (accent-hl-line "#b392f1")

      ;; Signals -- for diagnostics and diff-hl
      ;; reuse signal-ok for diff-hl-insert
      ;;       signal-info for diff-hl-change
      ;;       signal-error for diff-hl-delete
      (signal-ok "#6c7b2e")
      (signal-warn "#ffab70")
      (signal-error "#d14d41")
      (signal-info "#79b8ff"))
  (custom-theme-set-faces
   'cisco
   ;; UI elements
   `(default ((t (:background ,bg :foreground ,fg))))
   `(vertical-border ((t (:foreground ,border))))
   `(region ((t (:background ,bg+1))))
   `(line-number ((t (:foreground ,fg-dim))))
   `(line-number-current-line ((t (:foreground ,accent-num))))
   `(cursor ((t (:background ,accent-num))))

   `(mode-line ((t :background ,bg+1 :foreground ,fg)))
   `(mode-line-inactive ((t :foreground ,border)))

   `(fringe ((t (:background ,bg :foreground ,bg))))

   ;; Tab-bar mode
   `(tab-bar ((t (:inherit nil :background ,bg))))
   `(tab-bar-tab-inactive ((t :background ,bg+2 :box (:color ,bg+2 :line-width 4))))
   `(tab-bar-tab ((t :background ,bg+1 :weight bold :box (:color ,bg+1 :line-width 4))))
   
   ;; Text highlighting
   `(font-lock-comment-face ((t (:foreground ,accent-comments))))
   `(font-lock-doc-face ((t (:foreground ,accent-doc))))
   `(font-lock-comment-delimiter-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-string-face ((t (:foreground ,accent-str))))
   `(font-lock-number-face ((t (:foreground ,accent-num))))
   `(font-lock-regexp-face ((t (:inherit 'default))))
   `(font-lock-punctuation-face ((t (:foreground ,fg-dim))))
   `(font-lock-operator-face ((t (:inherit 'default))))

   `(font-lock-constant-face ((t (:foreground ,accent-num))))
   `(font-lock-variable-name-face ((t (:inherit 'default))))
   `(font-lock-variable-use-face ((t (:inherit 'default))))
   `(font-lock-function-name-face ((t (:foreground ,accent-def))))
   `(font-lock-function-call-face ((t (:inherit 'default))))
   `(font-lock-type-face ((t (:inherit 'default))))
   
   `(font-lock-builtin-face ((t (:inherit 'default))))
   `(font-lock-keyword-face ((t (:inherit 'default))))
   
   ;; Flymake
   `(flymake-note-echo ((t (:foreground ,signal-info))))
   `(flymake-warning ((t (:underline (:style wave :color ,signal-warn)))))
   `(flymake-warning-echo ((t (:foreground ,signal-warn))))
   `(warning ((t (:foreground ,signal-warn))))
   `(flymake-error-echo ((t (:foreground ,signal-error))))

   ;; Markdown
   `(markdown-code-face ((t (:inherit nil))))
   `(markdown-hr-face ((t (:foreground ,fg-dim))))
   
   ;; Eldoc box
   `(eldoc-box-body ((t (:background ,bg+2))))
   `(eldoc-box-border ((t (:background ,bg+2))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,accent-parens))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,accent-parens))))
   ;; `(rainbow-delimiters-depth-1-face ((t (:foreground ,accent-def))))
   ;; `(rainbow-delimiters-depth-2-face ((t (:foreground ,accent-str))))
   ;; `(rainbow-delimiters-depth-3-face ((t (:foreground ,accent-num))))
   ;; `(rainbow-delimiters-depth-4-face ((t (:foreground ,signal-ok))))
   ;; `(rainbow-delimiters-depth-5-face ((t (:foreground ,signal-warn))))
   ;; `(rainbow-delimiters-depth-6-face ((t (:foreground ,signal-error))))
   ;; `(rainbow-delimiters-depth-7-face ((t (:foreground ,signal-info))))


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
   `(diff-hl-insert ((t :foreground ,signal-ok :background ,signal-ok :inherit nil)))
   `(diff-hl-change ((t :foreground ,signal-info :background ,signal-info :inherit nil)))
   `(diff-hl-delete ((t :foreground ,signal-error :background ,signal-error :inherit nil)))
   ))

(provide-theme 'cisco)
(provide 'cisco-theme)
