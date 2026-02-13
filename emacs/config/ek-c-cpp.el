(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

(add-to-list 'auto-mode-alist '("\\.clangd\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.clang-tidy\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.clang-format\\'" . yaml-mode))
