; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; autorequire
(defun my/autorequire (pkg)
  (unless (require pkg nil t)
    (when (not package-archive-contents)
      (package-refresh-contents))
    (package-install pkg)
    (require pkg)))

; specify backups directory
(setq backup-directory-alist
      `((".*" . , "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
      `((".*", "~/.emacs.d/backups/" t)))
(setq backup-by-copying t)

; generic things
(menu-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq tab-width 4)
(setq indent-tabs-mode nil)

; moe-theme
(my/autorequire 'moe-theme)
(defun my/moe-modifications ()
  (set-face-attribute 'default nil :background "#000000"))
(add-hook 'window-setup-hook 'my/moe-modifications)
(moe-dark)

; winner
(when (fboundp 'winner-mode)
  (winner-mode 1))

; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; ido
(ido-mode t)

; smex
(my/autorequire 'smex)
(setq smex-save-file "~/.emacs.d/smex.save")
(smex-initialize)
(global-set-key [(meta x)] 'smex)

; auto-complete
(my/autorequire 'auto-complete)
(setq ac-delay 0)
(setq ac-quick-help-delay 0)
(setq ac-auto-show-menu t)
(ac-config-default)

; jedi
(my/autorequire 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; flycheck
(my/autorequire 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(global-set-key [(control b)] 'flycheck-list-errors)
