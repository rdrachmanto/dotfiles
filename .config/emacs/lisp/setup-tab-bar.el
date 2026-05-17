;;; setup-tab-bar.el -*- lexical-binding: t; -*-
;;; Commentary: to streamline tab-bar-mode customizations
;;; Code:

(defun rd/tab-bar-format (tab i)
  "Add padding"
  (let* ((name (alist-get 'name tab))
         (face (funcall tab-bar-tab-face-function tab))
         (hint (and tab-bar-tab-hints
                    (format "%d:" i))))
    (propertize
     (concat " " hint name " ")
     'face face)))


(setq tab-bar-tab-name-format-function #'rd/tab-bar-format)

(defun rd/tab-bar-project-rename ()
  "Change tab name if we're in an active project"
  (let ((project (project-current)))
    (if project
        (project-root project)
      (tab-bar-tab-name-current))))

(setq tab-bar-tab-name-function #'rd/tab-bar-project-rename)

(provide 'setup-tab-bar)
;;; setup-tab-bar.el ends here
