;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; some mappings
(keymap-global-set "C-," 'duplicate-dwim)
(keymap-global-set "M-c" 'capitalize-dwim)
(keymap-global-set "M-l" 'downcase-dwim)
(keymap-global-set "M-u" 'upcase-dwim)

;; insert new line above/below
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
(use-package move-text
  :bind (("M-<up>"   . move-text-up)
         ("M-<down>" . move-text-down)))

;; multiple cursors
(use-package multiple-cursors
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("C-S-c C-S-c"   . mc/edit-lines)
         ("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-:"           . mc/mark-all-like-this)))

;; golden ratio
(use-package golden-ratio
  :custom
  (golden-ratio-mode 1))

;; simpleclip
(use-package simpleclip
  :custom
  (simpleclip-mode 1))

;; prog-mode
(defun my-prog-mode-hook ()
  (toggle-truncate-lines)
  (electric-pair-local-mode))

(add-hook 'prog-mode-hook #'my-prog-mode-hook)

;; c / c++
(defun my-c-mode-hook ()
  (setq c-default-style "k&r"
        c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (c-toggle-comment-style -1))

(add-hook 'c-mode-common-hook #'my-c-mode-hook)

;; comint
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(add-hook 'comint-output-filter-functions #'comint-osc-process-output)

;; windows things
(when (eq system-type 'windows-nt)
  (setq find-program (shell-quote-argument "C:/Program Files/Git/usr/bin/find.exe"))

  (defun lazygit ()
    "Open lazygit in Windows Terminal (wt.exe)"
    (interactive)
    (let ((default-directory
           (if-let ((project (project-current)))
               (project-root project)
             default-directory)))
      (shell-command (concat "wt.exe --window 0 -d \"" (expand-file-name default-directory) "\" lazygit")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(comment-empty-lines t)
 '(compilation-ask-about-save nil)
 '(completion-auto-select 'second-tab)
 '(completions-format 'one-column)
 '(context-menu-mode t)
 '(create-lockfiles nil)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(dired-create-destination-dirs 'ask)
 '(dired-create-destination-dirs-on-trailing-dirsep t)
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(display-line-numbers-type 'relative)
 '(display-line-numbers-width 3)
 '(duplicate-line-final-position -1)
 '(duplicate-region-final-position -1)
 '(fido-mode t)
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers t)
 '(global-display-line-numbers-mode t)
 '(history-delete-duplicates t)
 '(icomplete-prospects-height 1)
 '(imenu-auto-rescan t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-allow-scroll 'unlimited)
 '(isearch-lazy-count t)
 '(lazy-highlight-initial-delay 0)
 '(ls-lisp-dirs-first t)
 '(ls-lisp-emulation 'UNIX)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount
   '(3 ((shift) . hscroll) ((meta)) ((control meta) . global-text-scale)
       ((control) . text-scale)))
 '(package-selected-packages
   '(cmake-mode dockerfile-mode glsl-mode go-mode golden-ratio
                gruber-darker-theme markdown-mode move-text
                multiple-cursors php-mode powershell rg rust-mode
                simpleclip yaml-mode))
 '(require-final-newline t)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(scroll-preserve-screen-position t)
 '(sentence-end-double-space nil)
 '(show-paren-delay 0)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(use-dialog-box nil)
 '(use-short-answers t)
 '(vc-handled-backends '(Git))
 '(xref-search-program 'ripgrep))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#d1c7c5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 160 :width normal :foundry "outline" :family "CommitMono"))))
 '(font-lock-function-name-face ((t (:foreground "#d1c7c5"))))
 '(font-lock-variable-name-face ((t (:foreground "#d1c7c5"))))
 '(icomplete-first-match ((t (:foreground "goldenrod" :weight bold))))
 '(link ((t (:foreground "#73c936" :underline t))))
 '(markdown-code-face ((t (:inherit ##)))))
