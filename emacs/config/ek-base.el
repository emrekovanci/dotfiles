(keymap-global-set "C-x C-g" 'browse-url-at-point)

;; buffer
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "C-c r" 'revert-buffer)

;; duplicate line or region
(keymap-global-set "C-," 'duplicate-dwim)

;; insert new line below/above
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(keymap-global-set "C-<return>" 'open-line-below)
(keymap-global-set "C-S-<return>" 'open-line-above)

;; move through windows with Shift-<arrow keys>
(windmove-default-keybindings)

;; move-text
(when (require 'move-text nil 'noerror)
  (move-text-default-bindings))

;; multiple-cursors
(when (require 'multiple-cursors nil 'noerror)
  (keymap-global-set "C-S-<mouse-1>" 'mc/add-cursor-on-click)
  (keymap-global-set "C-S-c C-S-c" 'mc/edit-lines)
  (keymap-global-set "C->" 'mc/mark-next-like-this)
  (keymap-global-set "C-<" 'mc/mark-previous-like-this)
  (keymap-global-set "C-c C-<" 'mc/mark-all-like-this))
