;; msys2
(add-to-list 'exec-path "C:\\Program Files\\Git\\usr\\bin\\")
(when (setq bash-exec (executable-find "bash"))
  (setq mingw-bin-dir (file-name-directory bash-exec))
  (setenv "PATH" (concat mingw-bin-dir ";" (getenv "PATH")))
  (setq grep-use-null-device nil)
  (setq find-program (shell-quote-argument (concat mingw-bin-dir "find.exe")))
  (setq grep-program (shell-quote-argument (concat mingw-bin-dir "grep.exe"))))

;; for powershell
(add-hook 'comint-output-filter-functions #'comint-osc-process-output)

