;;; -*- lexical-binding: t -*-

;; msys2
(setq find-program (shell-quote-argument "C:/Program Files/Git/usr/bin/find.exe"))
(setq grep-program (shell-quote-argument "C:/Program Files/Git/usr/bin/grep.exe"))
(setq grep-use-null-device nil)
(setq xref-search-program 'ripgrep)

;; for powershell
(add-hook 'comint-output-filter-functions #'comint-osc-process-output)
