;; https://github.com/jamescherti/minimal-emacs.d/blob/main/init.el
(setq package-archives
    '(("gnu" . "https://elpa.gnu.org/packages/")
      ("nongnu" . "https://elpa.nongnu.org/nongnu/")
      ("melpa" . "https://melpa.org/packages/")))

;; No beeping or blinking
(setq ring-bell-function #'ignore)
(setq visible-bell nil)

;; Allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

;; Line numbers
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-widen t)
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Hotkeys
(global-set-key (kbd "C-<f9>") (lambda () (interactive) (shrink-window-horizontally 10)))
(global-set-key (kbd "C-<f12>") (lambda () (interactive) (enlarge-window-horizontally 10)))
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

;;
(column-number-mode t)                  ; Display column number alongside line number on status bar
(tool-bar-mode -1)                      ; Disable tool bar
(menu-bar-mode -1)                      ; Disable menu bar
(scroll-bar-mode -1)                    ; Disable scroll bar
(setq scroll-step 1)                    ; Scroll one line at a time, rather than half a page
(setq inhibit-startup-screen t)         ; Disable startup screen
(editorconfig-mode 1)                   ; Activate editorconfig
;;(icomplete-mode 1)

;; Auto save & backups etc.
(setq auto-save-default nil)            ; Don't autosave
(setq backup-inhibited 't)              ; Don't create backups of the edited file

;; Font & frame
(add-to-list 'default-frame-alist '(font . "Input 14"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Word wrap
(setq-default word-wrap t)
(setq-default truncate-lines t)         ; Disable wrapping by default due to its performance cost.

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
      '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
           default))
 '(package-selected-packages '(cmake-mode editorconfig gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
