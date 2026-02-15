;;; -*- lexical-binding: t -*-

(keymap-global-set "C-x C-b" 'ibuffer)

(setq ibuffer-display-summary nil)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
  '(("default"
     ("dired" (mode . dired-mode))
     ("org" (mode . org-mode))
     ("magit" (name . "^magit"))
     ("emacs" (or
               (mode . emacs-lisp-mode)
               (mode . lisp-interaction-mode)
               (mode . help-mode)
               (mode . apropos-mode)
               (mode . Info-mode)
               (mode . messages-buffer-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-auto-mode 1)
    (ibuffer-switch-to-saved-filter-groups "default")))
