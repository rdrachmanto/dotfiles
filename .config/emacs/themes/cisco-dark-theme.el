(deftheme cisco-dark
  "Cisco Dark Theme")

(let ((black1 "#0e100f")
      (black2 "#1e201f")
      (black3 "#1f211f")
      (black4 "#403e3c")
      (black5 "#878580")
      (black6 "#a0a0a0")
      
      (light1 "#f8f8f8")
      (light2 "#cecdc3")
      (light3 "#fefefe")
      
      (blue1 "#2b5375")
      (blue2 "#3aa99f")
      (blue3 "#4385be")
      (blue4 "#5b79e3")
      (blue5 "#79b8ff")
      (blue6 "#8caec1")

      (lightgreen "#a9be50")
      (green "#879a39")
      (green2 "#6c7b2e")

      (yellow1 "#ad8301")
      (yellow2 "#d0a215")
      (yellow3 "#f3cd07")

      (orange1 "#da702c")
      (orange2 "#fe9900")
      (orange3 "#ffab70")
      (orange4 "#ffc799")
      
      (purple1 "#b392f1")
      (purple2 "#e394dc")
      (purple3 "#834de8")
      
      (pink "#fa7584")
      (pink2 "#f84055")
      
      (red1 "#d14d41")
      (red2 "#d3604f"))
  (custom-theme-set-faces
   'cisco-dark
   ;; UI elements
   `(default ((t (:background ,black1 :foreground ,light2))))
   `(vertical-border ((t (:foreground ,black4))))
   `(internal-border ((t (:foreground ,black4, :background ,black1))))
   `(mode-line ((t (:background ,black3 :foreground ,light2 :box t))))
   `(mode-line-inactive ((t (:background ,black1 :foreground ,black4))))
   `(region ((t (:background ,black4))))
   `(hl-line ((t (:background ,black2))))

   `(line-number ((t (:foreground ,black5))))
   `(line-number-current-line ((t (:foreground ,orange2))))

   `(minibuffer-prompt ((t (:foreground ,blue5))))
   `(icomplete-selected-match ((t (:background ,black4))))

   ;; Text highlighting
   `(font-lock-comment-face ((t (:foreground ,black5))))
   `(font-lock-doc-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-comment-delimiter-face ((t (:inherit 'font-lock-comment-face))))
   `(font-lock-type-face ((t (:foreground ,blue5))))
   `(font-lock-string-face ((t (:foreground ,orange3))))
   `(font-lock-regexp-face ((t (:foreground ,black6))))
   `(font-lock-constant-face ((t (:foreground ,blue5))))
   `(font-lock-variable-name-face ((t (:foreground ,light2))))
   `(font-lock-variable-use-face ((t (:inherit 'font-lock-variable-name-face))))
   `(font-lock-builtin-face ((t (:foreground ,blue5))))
   `(font-lock-punctuation-face ((t (:foreground ,light2))))
   `(font-lock-function-name-face ((t (:foreground ,purple1))))
   `(font-lock-function-call-face ((t (:inherit 'font-lock-function-name-face))))
   `(font-lock-operator-face ((t (:foreground ,pink))))
   `(font-lock-keyword-face ((t (:foreground ,pink))))

   ;; Flymake
   `(flymake-note-echo ((t (:foreground ,blue5))))
   `(flymake-warning-echo ((t (:foreground ,orange3))))
   `(flymake-error-echo ((t (:foreground ,pink))))

   ;; Markdown
   `(markdown-code-face ((t (:inherit nil))))
   `(markdown-hr-face ((t (:foreground ,black2))))

   ;; Eglot
   `(eglot-inlay-hint-face ((t (:inherit nil :foreground ,black5 :height 0.8))))
   
   ))

(provide-theme 'cisco-dark)
(provide 'cisco-dark-theme)
