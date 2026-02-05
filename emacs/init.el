;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; configs
(load-file (expand-file-name "config/ek-base.el" user-emacs-directory))
(load-file (expand-file-name "config/ek-c-cpp.el" user-emacs-directory))

;; win32
(when (eq system-type 'windows-nt)
  (load-file (expand-file-name "config/ek-w32-dired.el" user-emacs-directory))
  (load-file (expand-file-name "config/ek-w32-shell.el" user-emacs-directory)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(completion-auto-select 'second-tab)
 '(completions-format 'one-column)
 '(completions-max-height 15)
 '(create-lockfiles nil)
 '(cursor-in-non-selected-windows nil)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes t)
 '(delete-by-moving-to-trash t)
 '(dired-dwim-target t)
 '(dired-listing-switches "-lah --group-directories-first")
 '(display-line-numbers-type 'relative)
 '(display-line-numbers-width 3)
 '(duplicate-line-final-position -1)
 '(duplicate-region-final-position -1)
 '(fido-mode t)
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers t)
 '(global-display-line-numbers-mode t)
 '(golden-ratio-mode t)
 '(history-length 25)
 '(icomplete-prospects-height 1)
 '(icomplete-separator " ")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(lazy-highlight-initial-delay 0)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(cmake-mode glsl-mode golden-ratio gruber-darker-theme lua-mode magit
                move-text multiple-cursors php-mode powershell rg
                rust-mode yaml-mode))
 '(proced-tree-flag t)
 '(project-mode-line t)
 '(require-final-newline t)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(shell-kill-buffer-on-exit t)
 '(show-paren-delay 0)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(use-dialog-box nil)
 '(use-file-dialog nil)
 '(use-short-answers t)
 '(vc-handled-backends '(Git))
 '(visible-bell nil)
 '(which-key-mode t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "CommitMono" :foundry "outline" :slant normal :weight regular :height 142 :width normal))))
 '(icomplete-first-match ((t (:foreground "goldenrod" :weight bold)))))
