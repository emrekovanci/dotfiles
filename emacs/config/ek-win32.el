;;; -*- lexical-binding: t -*-

;; msys2
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
    (start-process "lazygit" nil "cmd.exe" "/c" "start" "pwsh.exe" "-NoProfile" "-Command" "lazygit")))
