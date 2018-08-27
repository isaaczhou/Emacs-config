;;; python.el --- python related                     -*- lexical-binding: t; -*-

;; Copyright (C) 2018  vagrant

;; Author: vagrant <vagrant@node1.onionstudio.com.tw>
;; Keywords: languages, abbrev


(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq indent-tabs-mode nil)
  (setq python-indent-offset 4)
  (use-package py-autopep8
    :ensure t
    :hook ((python-mode . py-autopep8-enable-on-save))
    )
  )



;;
;; company jedi use jedi-core
;;
(use-package company-jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook (lambda ()
                                (add-to-list (make-local-variable 'company-backends)
                                             'company-jedi)))
  )

(use-package elpy
  :ensure t
  :commands (elpy-enable)
  :config
  (setq elpy-rpc-backend "jedi")
  )
