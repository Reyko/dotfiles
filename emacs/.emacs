(require 'package)
  (add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default)))
 '(package-selected-packages (quote (evil dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'dracula)

(setq auto-save-interval 20)

(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "saves/") t)))

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))


(require 'evil)

(evil-mode 1)
