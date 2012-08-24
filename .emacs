; Home site-lisp
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Disable menu
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;; Disable bell (Also seems to reduce artifacts on Cocoa emacs)
(setq ring-bell-function
      (lambda nil nil))

;; Disable backups
(setq backup-inhibited t)
(setq auto-save-default 2)

;; Set sane wrapping behavior
(global-visual-line-mode)

;; Set tabstop
(setq indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq tab-width 2)
(setq py-indent-offet 2)

;; Set default window size
(add-to-list 'default-frame-alist '(height . 57) '(width . 80))
(add-to-list 'default-frame-alist '(top . 0))

;; Load color-theme package
(require 'color-theme)
(color-theme-initialize)
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-color-theme-solarized")

;; Set default color scheme and font
(when window-system
  (menu-bar-mode 1)
  (tool-bar-mode 0)
  (scroll-bar-mode -1)

  ;; Color Themes
  (require 'color-theme-solarized)
  (color-theme-solarized-light)
  ;(color-theme-solarized-dark)
  ;(color-theme-desert)
  ;(color-theme-bespin-mod)
  ;(birds-of-paradise-theme)
  ;(color-theme-pierson)
  ;(color-theme-aalto-light)
  ;(color-theme-bharadwaj)
  ;(color-theme-dark-blue2)
  ;(color-theme-chocolate-rain)
  ;(color-theme-robin-hood)
  ;(color-theme-goldenrod)

  ;; Font
  (set-default-font "Menlo 11")
  (add-to-list 'default-frame-alist '(font . "Menlo 11")))

;; Defaults for console emacs
(when (not window-system)
  (menu-bar-mode 0)
  (set-face-background 'mode-line "white")
  (set-face-foreground 'mode-line "black")
  (set-face-background 'region "white")
  (set-face-foreground 'region "black"))

;; Set Keybindings
(setq ns-command-modifier 'meta)
(setq mac-option-modifier 'meta)
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "C-c o") 'next-multiframe-window)

;; Enable windmove (meta-arrow to change frames)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(windmove-default-keybindings 'meta)

;; Enable "a" key for dired mode
(put 'dired-find-alternate-file 'disabled nil)

;; LaTeX key bindings
(add-hook 'latex-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c i")
			   (lambda ()
			     (interactive)
			     (insert "\\lstinline{")))
	    (local-set-key (kbd "C-c l")
			   (lambda ()
			     (interactive) 
			     (insert "\\begin{lstlisting}\n")
			     (insert "\n")
			     (insert "\\end{lstlisting}\n")
			     (previous-line)
			     (previous-line)
			     (beginning-of-line)))
	    (local-set-key (kbd "C-c e")
			   (lambda ()
			     (interactive)
			     (insert "\\emph{")))
	    (local-set-key (kbd "C-c f")
			   (lambda ()
			     (interactive)
			     (insert "\\begin{framed}\n")
			     (insert "\\noindent \\smallskip ")
			     (insert "\\textbf{TITLE} \\\\")
			     (insert "\n\n")
			     (insert "\\end{framed}")
			     (previous-line)
			     (beginning-of-line)))))

;; Key binding to resize Emacs frame (window) width
(global-set-key (kbd "C-x w")
		(lambda (width)
		  (interactive "p")
		  (if (>= 1 width)
		      (set-frame-width (selected-frame) 80)
		      (set-frame-width (selected-frame) width))))

;; Smooth scrolling for Cocoa Emacs
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Add aspell for spell check
(setq-default ispell-program-name "/usr/local/bin/aspell")

;; Enable autopair
(require 'autopair)

;; Set a DVI viewer for TeX mode
(setq tex-dvi-view-command "open")
(setq tex-dvi-print-command "dvipdfm *; rm *.log; rm *.aux; rm *.dvi")

;; Set up doc-view-mode
(setq-default doc-view-dvipdf-program "/usr/local/bin/dvipdf")
(setq-default doc-view-ghostscript-program "/usr/local/bin/gs")
(setq-default doc-view-ps2pdf-program "/usr/local/bin/ps2pdf")

;; SLIME
(add-to-list 'load-path "~/.slime/")
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl --noinform")
(slime-setup '(slime-fancy))

;; Ruby mode
(require 'ruby-mode)
(require 'inf-ruby)
(define-key ruby-mode-map "<TAB>" 'indent-region)

;; python.org Python mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/python-mode")
(require 'python-mode)
;; Set default python interpreter for python-mode.el
;; Note: had to modify py-choose-shell in python-mode.el
;; to force it to utilize this path for all cases
(setq-default py-shell-name "/usr/local/bin/python")

1;; Google Go mode
(require 'go-mode-load)

;; Nu mode
(require 'nu)
(require 'paredit)
(add-hook 'nu-mode-hook (lambda () (paredit-mode +1)) t)
(require 'parenface)
(set-face-foreground 'paren-face "SteelBlue")
(add-hook 'nu-mode-hook (paren-face-add-support nu-font-lock-keywords))

;; Prolog Mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/prolog/")
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			      auto-mode-alist))
(setq prolog-system 'swi)

;; Set up tramp mode
(require 'tramp)
(setq tramp-default-method "ssh"
      tramp-default-host "127.0.0.1")
(add-to-list 'tramp-default-proxies-alist
	     '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
	     '((regexp-quote (system-name)) nil nil))

;; Enable z-machine interpreter
(require 'malyon)

;; ANSI term paste hack
(defun ansi-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

;; Enable lambda mode
(require 'lambda-mode)
(add-hook 'lisp-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
(global-set-key (kbd "C-c ^") 'lambda-mode)

;; Set ff-find-other-file directories
(setq ff-search-directories
      '("."
	"/usr/include"
	"/usr/local/include/*"
	"~/src/haiku_src/haiku/haiku/headers/private/*"))
(custom-set-variables
 '(py-indent-offset 2))
