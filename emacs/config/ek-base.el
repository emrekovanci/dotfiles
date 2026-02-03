;; duplicate line or region
(global-set-key (kbd "C-,") 'duplicate-dwim)

;; move through windows with Shift-<arrow keys>
(windmove-default-keybindings)

;; move-text
(when (require 'move-text nil 'noerror)
  (move-text-default-bindings))

;; multiple-cursors
(when (require 'multiple-cursors nil 'noerror)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))
