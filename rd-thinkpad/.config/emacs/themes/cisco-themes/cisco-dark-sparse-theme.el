(require 'cisco-themes)

(deftheme cisco-dark-sparse
  "Cisco Dark Sparse Theme")

(cisco-theme-apply-faces 'cisco-dark-sparse cisco-theme-dark-palette)

(custom-theme-set-faces
 'cisco-dark-sparse
 
 `(font-lock-punctuation-face ((t :inherit 'default)))
 `(font-lock-operator-face ((t :inherit 'font-lock-punctuation-face)))

 `(font-lock-function-name-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-def))))
 `(font-lock-function-call-face ((t :inherit 'default)))
 `(font-lock-type-face ((t :inherit 'default)))
 `(font-lock-property-name-face ((t :inherit 'default)))
 `(font-lock-property-use-face ((t :inherit 'default)))
 `(font-lock-variable-name-face ((t :inherit 'default)))
 `(font-lock-variable-use-face ((t :inherit 'default)))
 `(font-lock-constant-face ((t :foreground ,(plist-get cisco-theme-dark-palette :accent-constants))))
 
 `(font-lock-keyword-face ((t :inherit 'default)))
 `(font-lock-builtin-face ((t :inherit 'default))))

(provide-theme 'cisco-dark-sparse)
(provide 'cisco-dark-sparse-theme)
