;;; -*- lexical-binding: t -*-

(set-default-coding-systems 'utf-8-unix)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; some mappings
(keymap-global-set "C-," 'duplicate-dwim)

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
(when (require 'move-text nil 'noerror)
  (move-text-default-bindings))

;; multiple-cursors
(when (require 'multiple-cursors nil 'noerror)
  (keymap-global-set "C-S-<mouse-1>" 'mc/add-cursor-on-click)
  (keymap-global-set "C-S-c C-S-c" 'mc/edit-lines)
  (keymap-global-set "C->" 'mc/mark-next-like-this)
  (keymap-global-set "C-<" 'mc/mark-previous-like-this)
  (keymap-global-set "C-c C-<" 'mc/mark-all-like-this))

;; c / c++ things
(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

(add-to-list 'auto-mode-alist '("\\.clangd\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.clang-tidy\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.clang-format\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.codespellrc\\'" . conf-mode))

;; ibuffer
(keymap-global-set "C-x C-b" 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("Dired" (mode . dired-mode))
         ("Org" (mode . org-mode))
         ("Magit" (name . "^magit"))
         ("Tramp" (name . "^\\*tramp.*"))
         ("Term" (or
                  (mode . shell-mode)
                  (derived-mode . compilation-mode)))
         ("Emacs" (or
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

;; dired
(add-hook 'dired-mode-hook 'dired-omit-mode)

;; ansi color in compilation mode
(require 'ansi-color)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(setenv "CARGO_TERM_COLOR" "always")

;; windows things
(when (eq system-type 'windows-nt)
  (setq find-program (shell-quote-argument "C:/Program Files/Git/usr/bin/find.exe"))
  (setq grep-program (shell-quote-argument "C:/Program Files/Git/usr/bin/grep.exe"))
  (setq grep-use-null-device nil)
  (setq xref-search-program 'ripgrep)

  ;; for powershell
  (add-hook 'comint-output-filter-functions #'comint-osc-process-output)

  ;; lazygit
  (defun lazygit ()
    "Open lazygit in pwsh"
    (interactive)
    (let ((default-directory
           (if-let ((project (project-current)))
               (project-root project)
             default-directory)))
      (start-process "lazygit" nil "cmd.exe" "/c" "start" "pwsh.exe" "-NoProfile" "-Command" "lazygit"))))

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
 '(dired-listing-switches "-alh")
 '(dired-omit-files "^\\.git$")
 '(dired-omit-verbose nil)
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(display-line-numbers-type 'relative)
 '(display-line-numbers-width 3)
 '(duplicate-line-final-position -1)
 '(duplicate-region-final-position -1)
 '(fido-mode t)
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(global-goto-address-mode t)
 '(golden-ratio-mode t)
 '(icomplete-prospects-height 1)
 '(icomplete-separator " ")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(lazy-highlight-initial-delay 0)
 '(ls-lisp-dirs-first t)
 '(ls-lisp-emulation 'UNIX)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(3))
 '(package-selected-packages
   '(cmake-mode dockerfile-mode glsl-mode golden-ratio
                gruber-darker-theme lua-mode magit markdown-mode
                move-text multiple-cursors php-mode powershell rg
                rust-mode yaml-mode))
 '(require-final-newline t)
 '(resize-mini-windows nil)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
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
 '(font-lock-keyword-face ((t (:foreground "#ffdd33"))))
 '(font-lock-preprocessor-face ((t (:foreground "#ffdd33"))))
 '(font-lock-type-face ((t (:foreground "#ffdd33"))))
 '(icomplete-first-match ((t (:foreground "goldenrod" :weight bold))))
 '(link ((t (:foreground "#73c936" :underline t))))
 '(markdown-code-face ((t (:inherit ##)))))
