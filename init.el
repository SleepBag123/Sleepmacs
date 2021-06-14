;; Init File By Krishna Jani for EMACS
;;---------------------------------
;; _____                          
;;| ____|_ __ ___   __ _  ___ ___ 
;;|  _| | '_ ` _ \ / _` |/ __/ __|
;;| |___| | | | | | (_| | (__\__ \
;;|_____|_| |_| |_|\__,_|\___|___/                              
;;---------------------------------
;; Does not include VIM bindings

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(display-battery-mode 1)

;; Package Initialization
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/")
 t)
(package-initialize)

(add-to-list 'default-frame-alist
	     '(font . "CaskaydiaCove Nerd Font-13"))

;; Doom Themes for visual config
(require 'doom-themes)
(load-theme 'doom-nord t)

;; Powerline
(require 'smart-mode-line)
(sml/setup)

;; Configuration for Dashboard
(require 'all-the-icons)
(require 'page-break-lines)
(require 'projectile)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "~/.emacs.d/avatar.png")
(setq dashboard-banner-logo-title "Welcome to Emacs Krishna !!")
(setq dashboard-items '((recents  . 5)))                        
(setq dashboard-set-footer nil)
;; Smartparens

(require 'smartparens-config)
(smartparens-global-mode t)

;; Which Key Package

(require 'which-key)
(which-key-mode 1)

;; Org Pretty bullets

(require 'org-bullets)

;; Activate org-bullets when orgmode enabled

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; EXWM Config
(require 'exwm)
(require 'exwm-config)
(fringe-mode 3)
(server-start)
(exwm-config-ido)
(setq exwm-workspace-number 1)
(exwm-input-set-key (kbd "s-r") #'exwm-reset)
(exwm-input-set-key (kbd "s-k") #'exwm-workspace-delete)
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
(dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
			  `(lambda ()
			     (interactive)
			     (exwm-workspace-switch-create ,i)
			     (message "Workspace %d", i))))
    (exwm-input-set-key (kbd "s-&")
			(lambda (command)
			  (interactive (list (read-shell-command "$ ")))
			  (start-process-shell-command command nil command)))
(exwm-enable)

;; Sudo Edit

(require 'sudo-edit)
(global-set-key (kbd "s-e") 'sudo-edit)


(require 'desktop-environment)
(desktop-environment-mode)

;; This is some source code I found on RD that allows line break in ORGMODE
(add-hook 'org-mode-hook #'(lambda ()

                             ;; make the lines in the buffer wrap around the edges of the screen.
                             
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             (org-indent-mode)))


;; Dmenu

(require 'dmenu)
(global-set-key (kbd "C-c r") 'dmenu)


;; Custom Stuff (DO NOT EDIT)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" default))
 '(package-selected-packages
   '(smart-mode-line desktop-environment which-key smartparens dashboard projectile page-break-lines all-the-icons powerline doom-themes ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#191919" :foreground "#d4d4d4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "CaskaydiaCove Nerd Font")))))
