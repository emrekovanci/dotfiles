;; https://github.com/jamescherti/minimal-emacs.d/blob/main/init.el
(setq package-archives
    '(("gnu" . "https://elpa.gnu.org/packages/")
      ("nongnu" . "https://elpa.nongnu.org/nongnu/")
      ("melpa" . "https://melpa.org/packages/")))

(setq custom-file "~/.emacs.custom.el")
(ignore-errors (load custom-file))
(setq enable-local-variables :safe)

;; Replace yes/no prompts with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Hotkeys
(global-set-key (kbd "C-<f9>") (lambda () (interactive) (shrink-window-horizontally 10)))
(global-set-key (kbd "C-<f12>") (lambda () (interactive) (enlarge-window-horizontally 10)))
(setq duplicate-line-final-position 1)
(global-set-key (kbd "C-,") 'duplicate-line)

;; Defaults
(setq-default
 ring-bell-function #'ignore                ; 
 visible-bell nil                           ;
 display-line-numbers-width 3               ;
 display-line-numbers-widen t               ;
 display-line-numbers-type 'relative        ;
 indent-tabs-mode nil                       ; Prefer spaces over tabs
 tab-width 4                                ; Set width for tabs
 scroll-conservatively most-positive-fixnum ; Always scroll by one line
 inhibit-startup-screen t                   ; Disable startup screen
 word-wrap t
 truncate-lines t)                          ; Disable wrapping

(global-display-line-numbers-mode)          ; Display line numbers
(set-default-coding-systems 'utf-8)         ; Default to utf-8 encoding
(column-number-mode 1)                      ; Display column number alongside line number on status bar
(tool-bar-mode -1)                          ; Disable tool bar
(menu-bar-mode -1)                          ; Disable menu bar
(scroll-bar-mode -1)                        ; Disable scroll bar
;;(editorconfig-mode 1)                     ; Activate editorconfig
;;(icomplete-mode 1)

;; Auto save & backups etc.
(setq auto-save-default nil)                ; Don't autosave
(setq backup-inhibited t)                   ; Don't create backups of the edited file

;; Font & frame
(add-to-list 'default-frame-alist '(font . "Input 14"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
