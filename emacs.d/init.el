;; (setq debug-on-error 't)

;; No welcome screens
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; Packaging
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
	     '("elpa" . "http://tromey.com/elpa/"))

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar auto-packages
  '(smex
    wc-mode
    centered-cursor-mode
    org-plus-contrib
    markdown-mode
    paredit
    google-translate
    pandoc-mode
    ido-ubiquitous
    idle-highlight-mode
    typopunct
    coffee-mode
    color-theme
    color-theme-molokai
    restclient
    ; ace-jump-moden
    multiple-cursors
    autopair
    smart-tab))

(defun install-auto-packages ()
  (interactive)
  (package-refresh-contents)
  (dolist (p auto-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Pandoc
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'markdown-mode-hook 'visual-line-mode)

;; Interface
(when window-system
  (set-face-attribute 'default nil :height 120)
  (fringe-mode 13)
  (toggle-scroll-bar -1))

(tool-bar-mode -1)
(menu-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq transient-mark-mode t)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(global-set-key (kbd "M-s") 'save-buffer)

;; Paredit
(autoload 'paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))

;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; fuzzy matching

;; IDO-enhanced M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Recent Files Menu
(require 'recentf)
(recentf-mode 1)

;; Word completion
(require 'smart-tab)
(global-smart-tab-mode 1)

;;Typewriter scrolling
(autoload 'centered-cursor-mode "centered-cursor-mode" t)

(require 'autopair)

;; Use C-o and M-o to switch windows
(defun prev-window ()
  (interactive)
  (other-window -1))
(global-set-key "\C-o" 'other-window)
(global-set-key "\M-o" 'prev-window)

(put 'upcase-region 'disabled nil)

;; ORG
(defun my-org-init ()
  (autopair-mode)
  (flyspell-mode)
  (electric-pair-mode))

;;(require 'org-notify)
;;(org-notify-start)

;; (org-notify-add 'appointment
;; 		'(:time "1s" :period "20s" :duration 10 :actions -notify)
;; 		'(:time "15m" :period "2m" :duration 100 :actions -notify))

(add-hook 'org-mode-hook 'my-org-init)

;; Indent
(setq org-startup-indented t)
(setq org-indent-mode t)


(require 'multiple-cursors)

;; ACE
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick jump minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; Clock
(setq org-log-done 'time)
(setq org-startup-indented 't)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 6)

;; Agenda
(setq org-agenda-include-diary 't)
(setq org-agenda-include-all-todo 't)
(setq org-agenda-restore-windows-after-quit 't)
(setq org-deadline-warning-days 7)

(setq org-todo-keywords
      '((type "TODO(t)" "|" "DONE(d)")
	(type "CALL(c)" "|" "CALLED")
	(type "READING" "REREAD" "|" "READ")
	(type "PURCHASE" "|" "PURCHASED")
	(type "BUY" "|" "BOUGHT")
	(type "EMAIL(e)" "|" "EMAILED")
	(type "SIGNATURE" "|" "SIGNED")
	(type "ISSUE" "|" "RESOLVED")
	(type "REMIND(r)" "|" "REMINDED")
	(type "REVIEW" "|" "REVIEWED")
	(type "SCHEDULE" "|" "SCHEDULED")
	(sequence "ASK" "QUESTION(q)" "ASKED" "WAITING(w)" "|"
		  "ANSWERED" "RECEIVED")
	(sequence "FILE(f)" "PRODUCT(p)" "DRAFT" "REVISE" "SUBMIT(s)" "|"
		  "FILED" "DELIVERED(v)")))

;; (add-hook 'after-init-hook '(lambda () (org-agenda-list 1)))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)

;; Lazy window switching
(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key "\C-o" 'other-window)

(global-set-key "\M-o" 'prev-window)

(setq disabled-command-function nil)

(setq org-agenda-files '("~/org"))
