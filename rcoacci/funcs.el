(defun rcoacci/jump-to-definition (@click)
  (interactive "e")
  (let ((p1 (posn-point (event-start @click))))
    (goto-char p1)
    (spacemacs/jump-to-definition))
  )
