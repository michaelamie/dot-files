; Color theme support is required.
(require 'color-theme)

; Code start.
(defun color-theme-bespin-mod ()
  (interactive)
  (color-theme-install
   '(color-theme-bespin-mod
     ((background-color . "#372725")
      (foreground-color . "#BAAE9E")
      (cursor-color . "#A7A7A7"))
     (default ((t (nil))))
     (modeline ((t (:background "#573431" :foreground "#BAAE9E" :box (:line-width 1 :color "#573431" :style none))))) ;
     (font-lock-builtin-face ((t (:foreground "#A6E22A")))) ;
     (font-lock-comment-face ((t (:italic t :foreground "#666666"))));
     (font-lock-constant-face ((t (:foreground "#DDF2A4")))) ;
     (font-lock-doc-string-face ((t (:foreground "#5EA6EA")))) ;
     (font-lock-string-face ((t (:foreground "#54BE0D")))) ;
     (font-lock-function-name-face ((t (:foreground "#937121" :italic t)))) ;
     (font-lock-keyword-face ((t (:foreground "#5EA6EA")))) ;
     (font-lock-type-face ((t (:underline t :foreground "#89BDFF"))))
     (font-lock-variable-name-face ((t (:foreground "#7587A6" :bold t))));
     (font-lock-warning-face ((t (:bold t :foreground "#F9EE98"))))
     (highlight-80+ ((t (:background "#F9EE98"))))
     (hl-line ((t (:background "#2A2A2A"))))
     (region ((t (:background "#1a1a1a"))))
     (ido-subdir ((t (:foreground "#F1266F"))))
     (fringe ((t (:background "#372725")))) ;; hiding fringe
    )
  )
)
(provide 'color-theme-bespin-mod)
;---------------
; Code end.
