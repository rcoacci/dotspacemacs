;(global-unset-key (kbd "<C-mouse-1>"))
(global-unset-key (kbd "<C-down-mouse-1>"))
(global-set-key (kbd "<C-down-mouse-3>") 'mouse-buffer-menu)
(global-set-key (kbd "<mouse-3>") 'mouse-popup-menubar)
(global-set-key (kbd "M-<right>") 'forward-sexp)
(global-set-key (kbd "M-<left>") 'backward-sexp)

(define-key prog-mode-map (kbd "<C-mouse-1>") 'rcoacci/jump-to-definition)

(with-eval-after-load 'evil
  (evil-ex-define-cmd "clo[se]" 'kill-buffer-and-window)
  )
