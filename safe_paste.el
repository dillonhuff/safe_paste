"Reload file: M-x load-file <location>"

(defun simp-beginning-of-buffer ()
  "Move to beginning of buffer"
  (interactive)
  (push-mark)
  (goto-char (point-min)))

(defun my-yank ()
  "Copy in car kill ring"
  (interactive)
  (insert (car kill-ring-yank-pointer)))




