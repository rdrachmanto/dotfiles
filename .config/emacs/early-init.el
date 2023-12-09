(defvar default-file-name-handler-alist file-name-handler-alist)
(setq package-enable-at-startup nil
      file-name-handler-alist nil
      gc-cons-threshold (* 50 1000 1000))
