;; duplicate line or region
(keymap-global-set "C-," 'duplicate-dwim)

;; move through windows with Shift-<arrow keys>
(windmove-default-keybindings)

;; move-text
(when (require 'move-text nil 'noerror)
  (move-text-default-bindings))

;; multiple-cursors
(when (require 'multiple-cursors nil 'noerror)
  (keymap-global-set "C-S-c C-S-c" 'mc/edit-lines)
  (keymap-global-set "C->" 'mc/mark-next-like-this)
  (keymap-global-set "C-<" 'mc/mark-previous-like-this)
  (keymap-global-set "C-c C-<" 'mc/mark-all-like-this))
