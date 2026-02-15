;;; -*- lexical-binding: t -*-

(setq ibuffer-display-summary nil)

(setq ibuffer-saved-filter-groups
  '(("default"
     ("dired" (mode . dired-mode))
     ("org" (mode . org-mode))
     ("magit" (name . "^magit"))
     ("emacs" (or
               (name . "^\\*scratch\\*$")
               (name . "^\\*Messages\\*$"))))))

(add-hook 'ibuffer-mode-hook
 (lambda ()
  (ibuffer-switch-to-saved-filter-groups "default")))
