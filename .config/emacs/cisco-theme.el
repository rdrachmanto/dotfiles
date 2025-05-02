(require 'autothemer)

(autothemer-deftheme
 cisco "Port of Zed-cisco-theme for emacs!"

 ((((class color) (min-colors #xFFFFFF)))

  (cisco-black1   "#0e100f")
  (cisco-black2   "#1e201f")
  (cisco-black3   "#1f211f")
  (cisco-black4   "#403e3c")
  (cisco-black5   "#878580")
  (cisco-black6   "#a0a0a0")

  (cisco-light1   "#f8f8f8")
  (cisco-light2   "#cecdc3")

  (cisco-blue1    "#2b5375")
  (cisco-blue2    "#3aa99f")
  (cisco-blue3    "#4385be")
  (cisco-blue4    "#5b79e3")
  (cisco-blue5    "#79b8ff")
  (cisco-blue6    "#8caec1")

  (cisco-green    "#879a39")

  (cisco-yellow1  "#ad8301")
  (cisco-yellow2  "#d0a215")
  (cisco-yellow3  "#f3cd07")

  (cisco-orange1  "#da702c")
  (cisco-orange2  "#fe9900")
  (cisco-orange3  "#ffab70")
  (cisco-orange4  "#ffc799")

  (cisco-purple1  "#b392f1")
  (cisco-purple2  "#e394dc")

  (cisco-pink     "#fa7584")

  (cisco-red1     "#d14d41")
  (cisco-red2     "#d3604f"))

 ((default    (:foreground cisco-light2 :background cisco-black1))
  (cursor     (:background cisco-orange2))
  (hl-line    (:background cisco-black2))
  (region     (:background cisco-blue1))

  (font-lock-doc-face   (:foreground cisco-black5))
  (font-lock-type-face  (:foreground cisco-blue5))
  (font-lock-escape-face  (:foreground cisco-pink))
  (font-lock-number-face  (:foreground cisco-light1))
  (font-lock-regexp-face  (:foreground cisco-black6))
  (font-lock-string-face  (:foreground cisco-orange3))
  (font-lock-bracket-face (:foreground cisco-yellow3))
  (font-lock-builtin-face (:foreground cisco-blue5))
  (font-lock-comment-face (:foreground cisco-black5))
  (font-lock-keyword-face (:foreground cisco-pink))
  (font-lock-warning-face (:foreground cisco-orange1))
  (font-lock-constant-face (:foreground cisco-blue5))
  (font-lock-operator-face (:foreground cisco-pink))
  (font-lock-delimiter-face  (:foreground cisco-light2))
  (font-lock-doc-markup-face   (:foreground cisco-black5))
  (font-lock-punctuation-face  (:foreground cisco-light2))
  (font-lock-preprocessor-face (:foreground cisco-orange4))
  (font-lock-property-use-face      (:foreground cisco-light2))
  (font-lock-variable-use-face      (:foreground cisco-light2))
  (font-lock-variable-name-face      (:foreground cisco-light2))
  (font-lock-function-name-face     (:foreground cisco-purple1))
  (font-lock-function-call-face     (:foreground cisco-purple1))
  (font-lock-negation-char-face     (:foreground cisco-blue5))
  (font-lock-property-name-face     (:foreground cisco-light2))
  (tree-sitter-hl-face:method.call     (:foreground cisco-purple1))
  (tree-sitter-hl-face:function.call     (:foreground cisco-purple1))

  (fringe (:background cisco-black1))
  (border (:background cisco-black3 :foreground cisco-black3))
  (vertical-border (:background cisco-black3 :foreground cisco-black3))

  (mode-line   (:background cisco-black3 :foreground cisco-light2))
  (mode-line-active (:background cisco-black3 :foreground cisco-light2))
  (mode-line-inactive (:background cisco-black1 :foreground cisco-light2))
  (doom-modeline-bar (:background cisco-orange1))

  (error (:foreground cisco-red1))
  (flymake-warning (:underline (:color cisco-orange1 :style 'wave)))

  (eldoc-box-border (:background cisco-black3))
  (eldoc-box-body (:inherit 'default))
  (eldoc-box-markdown-separator (:foreground cisco-black3 :strike-through t))
  (markdown-code-face (:inherit 'default))

  (minibuffer-prompt (:foreground cisco-blue5))

  (vertico-current (:inherit 'hl-line))

  (org-block (:background cisco-black3))
  
  ))

(provide-theme 'cisco)

