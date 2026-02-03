(with-eval-after-load 'dired-aux
  (setq dired-compress-file-default-suffix ".zip")
  (setq dired-compress-directory-default-suffix ".zip")
  (add-to-list 'dired-guess-shell-alist-user '("\\.zip\\'" "7z x"))
  (add-to-list 'dired-compress-file-alist '("\\.zip\\'" . "7z a %o %i"))
  (add-to-list 'dired-compress-files-alist '("\\.zip\\'" . "7z a %o %i")))
