;;; rd-functions.el -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Rakandhiya Rachmanto

;; Author: Rakandhiya Rachmanto

;;; Commentary:

;; To provide nice small functions!

;;; Code:

(defun rd/split-right ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun rd/split-right-dired ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (dired "."))

(defun rd/split-right-project-dired ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (project-dired))

(defun rd/split-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun rd/open-user-init ()
  (interactive)
  (find-file-other-window user-init-file))

(defun rd/reload-user-init ()
  (interactive)
  (load-file user-init-file)
  (message "Reloaded with newest init"))

(defun rd/comment-or-uncomment-line-or-region ()
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region)
    (comment-line)))

(defun rd/open-buffer-diagnostics ()
  (interactive)
  (flymake-show-buffer-diagnostics)
  (other-window 1))

(defun rd/open-project-or-buffer-diagnostics ()
  (interactive)
  (if (project-current)
      (flymake-show-project-diagnostics)
    (flymake-show-buffer-diagnostics))
  (other-window 1))

(defun rd/go-to-beginning-of-line ()
  (interactive)
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun rd/switch-to-buffer (&optional all-buffers)
  (interactive "P")
  (if (or (not (project-current)) all-buffers)
      (call-interactively #'switch-to-buffer)
    (call-interactively #'project-switch-to-buffer)))

(defun rd/find-file (&optional all-buffers)
  (interactive "P")
  (if (or (not (project-current)) all-buffers)
      (call-interactively #'find-file)
    (call-interactively #'project-find-file)))

(defun rd/insert-elisp-metadata ()
  "Insert elisp comments at the beginning and end of file

Check if:
1. Buffer is visiting a file
2. Major-mode is `emacs-lisp-mode'
3. Buffer is empty
"
  (interactive)
  (cond ((or (not buffer-file-name) (not (eq major-mode 'emacs-lisp-mode)))
         (message "Buffer is not visiting a file, aborted"))
        ((not (= (buffer-size) 0))
         (message "Buffer is not empty, aborted"))
        (t (progn
             (goto-char (point-min))
             (insert (concat ";;; " (file-name-nondirectory buffer-file-name) " -*- lexical-binding: t; -*-"))
             (insert (concat "\n\n;; Copyright (C) " (format-time-string "%Y") " Rakandhiya Rachmanto"))
             (insert "\n\n;; Author: Rakandhiya Rachmanto")
             (insert "\n\n;;; Commentary:")
             (insert "\n\n;;; Code:")
             (insert "\n\n\n\n")
             (insert (concat ";;; " (file-name-nondirectory buffer-file-name) " ends here"))
             (forward-line -2)))))

(defun rd/change-theme ()
  (interactive)
  (let ((theme (intern (completing-read "Load custom theme: "
                                       (mapcar 'symbol-name (custom-available-themes))))))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t)))

(provide 'rd-functions)
;;; rd-functions.el ends here
