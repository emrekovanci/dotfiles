(with-eval-after-load 'dired-aux
  ;; change default compression suffix to .7z
  (setq dired-compress-file-default-suffix ".7z")
  (setq dired-compress-directory-default-suffix ".7z")

  ;; windows11 has built-in tar.exe
  (add-to-list 'dired-compress-file-alist '("\\.tar\\.gz\\'" . "tar -czvf %o %i"))
  (add-to-list 'dired-compress-files-alist '("\\.tar\\.gz\\'" . "tar -czvf %o %i"))

  ;; 7zip support
  (add-to-list 'dired-compress-file-alist '("\\.7z\\'" . "7z a %o %i"))
  (add-to-list 'dired-compress-files-alist '("\\.7z\\'" . "7z a %o %i"))

  ;; extract zip files with 7zip
  (add-to-list 'dired-guess-shell-alist-user '("\\.zip\\'" "7z x"))

  ;; extract .tar.gz files with built-in tar
  (add-to-list 'dired-guess-shell-alist-user '("\\.tar\\.gz\\'" "tar -xzvf")))
