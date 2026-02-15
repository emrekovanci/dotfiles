;;; -*- lexical-binding: t -*-

(setq-default buffer-file-coding-system 'utf-8-unix)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; configs
(load-file (expand-file-name "config/ek-base.el" user-emacs-directory))
(load-file (expand-file-name "config/ek-ibuffer.el" user-emacs-directory))
(load-file (expand-file-name "config/ek-c-cpp.el" user-emacs-directory))

;; dired
(add-hook 'dired-mode-hook 'dired-omit-mode)

;; win32
(when (eq system-type 'windows-nt)
  (load-file (expand-file-name "config/ek-win32.el" user-emacs-directory)))

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
 '(context-menu-mode t)
 '(create-lockfiles nil)
 '(cursor-in-non-selected-windows nil)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes t)
 '(delete-by-moving-to-trash t)
 '(dired-create-destination-dirs 'always)
 '(dired-create-destination-dirs-on-trailing-dirsep t)
 '(dired-dwim-target t)
 '(dired-isearch-filenames 'dwim)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-lah --group-directories-first")
 '(dired-omit-files "^\\(\\.git$\\|\\.$\\)")
 '(dired-omit-verbose nil)
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-line-numbers-type 'relative)
 '(display-line-numbers-width 3)
 '(duplicate-line-final-position -1)
 '(duplicate-region-final-position -1)
 '(fido-mode t)
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers t)
 '(global-display-line-numbers-mode t)
 '(golden-ratio-mode t)
 '(icomplete-prospects-height 1)
 '(icomplete-separator " ")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(lazy-highlight-initial-delay 0)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(cmake-mode glsl-mode golden-ratio gruber-darker-theme lua-mode
                move-text multiple-cursors php-mode powershell rg
                rust-mode yaml-mode))
 '(require-final-newline t)
 '(resize-mini-windows nil)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(shell-kill-buffer-on-exit t)
 '(show-paren-delay 0)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(use-dialog-box nil)
 '(use-short-answers t)
 '(vc-handled-backends '(Git))
 '(which-key-mode t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "CommitMono" :foundry "outline" :slant normal :weight regular :height 142 :width normal))))
 '(font-lock-constant-face ((t (:foreground "#ffdd33"))))
 '(font-lock-keyword-face ((t (:foreground "#ffdd33" :weight regular))))
 '(font-lock-preprocessor-face ((t (:foreground "#ffdd33"))))
 '(font-lock-type-face ((t (:foreground "#ffdd33"))))
 '(icomplete-first-match ((t (:foreground "goldenrod" :weight bold)))))
