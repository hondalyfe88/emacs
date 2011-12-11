;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aquamacs setup
;; From customizations.el which gets generated in the
;; /Users/mccm06/Library/Preferences/Aquamacs Emacs/customizations.el folder.
(custom-set-variables
 ;; Set the toolbar buttons to be plaintext
 '(ns-tool-bar-display-mode (quote labels) t)
 '(ns-tool-bar-size-mode (quote regular) t)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Matthew's custom setup preferences and mode loads.

(setq load-path (cons "~/.emacs.d" load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; language modes

;;;;;;;;;;;;;;;;
;; scala
;;(add-to-list 'load-path "~/work/emacs/scala")  
;;(require 'scala-mode-auto)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customizations

;; XML Formatter
;; from http://sinewalker.wordpress.com/2008/06/26/pretty-printing-xml-with-emacs-nxml-mode/
(defun nxml-pretty-print-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))


;;;;;;;;;;;;;;;;;;;;;;;
; icicles
(add-to-list 'load-path "~/.emacs.d/icicles")
(require 'icicles)
;Turn on icicles
(icy-mode)

;;;;;;;;;;;;;;;;;;;;;;
; Line numbers
(global-linum-mode)


;;;;;;;;;;;;;;;;
;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-arjen)

;Solarized color theme
;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;(require 'color-theme-solarized)
;(color-theme-scintilla)
(color-theme-gtk-ide)


;; set up alt key to work as META on Mac
(set-keyboard-coding-system 'mac-roman)
;; (mac-key-mode)
;; http://www.emacswiki.org/emacs/AquamacsFAQ#toc6
;;(setq mac-option-modifier 'meta)
;;(setq mac-command-key-is-meta nil)

(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;
;; always use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Merge the kill ring with the clipboard
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load some handy extensions

;;;;;;;;;;;;;;;;
;; ack
(require 'ack)    

;;;;;;;;;;;;;;;;
;; docbook
(autoload 'docbook-xml-mode "docbook-xml-mode" "Major mode for Docbook" t)

;;;;;;;;;;;;;;;;
;; flyspell
;; turn on flyspell mode
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq-default flyspell-mode t)
;; auto-load for flyspell mode
(dolist (hook '(markdown-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
)

;;;;;;;;;;;;;;;;
;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;;;;;;;;;;;;;;;
;; light symbol
(autoload 'light-symbol "light-symbol" "Float-over highlighting for symbols." t)

;;;;;;;;;;;;;;;;
;; magit (git support)
(require 'magit)

;;;;;;;;;;;;;;;;
;; load up modes for msf-abbrev
(require 'ruby-mode)

;;;;;;;;;;;;;;;;
;; load up msf-abbrevs
(add-to-list 'load-path "~/.emacs.d/msf-abbrev")
;; ensure abbrev mode is always on
(setq-default abbrev-mode t)
;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)


;;;;;;;;;;;;;;;;
;; paraedit
(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)

;;;;;;;;;;;;;;;;
;; wrap-region
(add-to-list 'load-path "~/.emacs.d/wrap-region.el")
(require 'wrap-region)
;(wrap-region-mode t)

(add-hook 'ruby-mode-hook
          '(lambda() (wrap-region-mode t)
))

(add-hook 'markdown-mode-hook
          '(lambda()
          (wrap-region-add-punctuation "+" "+")
          (wrap-region-add-punctuation "_" "_")
          (wrap-region-add-punctuation "`" "`")
          ;(wrap-region-add-punctuation "*" "*")
          ;(wrap-region-set-mode-punctuations '("\"" "("))
          (wrap-region-set-mode-punctuations '("\"" "(" "+" "_" "`"))
          (wrap-region-mode t)
          (auto-fill-mode -1)
))

;; Add extra wrappable punctuation to the wrap-region-mode for asciidoc editing
(add-hook 'adoc-mode-hook
          '(lambda()
          (wrap-region-add-punctuation "+" "+")
          (wrap-region-add-punctuation "_" "_")
          (wrap-region-add-punctuation "`" "`")
          ;(wrap-region-add-punctuation "*" "*")
          ;(remhash "'" wrap-region-punctuations-table)
          (wrap-region-set-mode-punctuations '("\"" "(" "+" "_" "`"))
          (wrap-region-mode t)
          (auto-fill-mode -1)
          ;(prin1 `"Im in the adoc-mode-hook" t)
))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; associations

;; add markdown mode automatically
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;;;;;;;;;;;;;;;;
;; html mode for HTML files
(setq auto-mode-alist (cons '("\\.html?$" . html-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;
;; Rake files are ruby too
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load-em up

(require 'shell)
(require 'ruby-mode)

;;;;;;;;;;;;;;;;
;; msf-abbrev
(require 'msf-abbrev)
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/.emacs.d/msf-abbrev/abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; little found functions

;; found world count function
(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doc mode didn't parse code block `stuff` in Asciidoc very well
; (add-to-list 'load-path "~/.emacs.d/doc-mode")
; (autoload 'doc-mode "doc-mode")
; (add-to-list 'auto-mode-alist '("\\.asc$" . doc-mode))
; (add-to-list 'auto-mode-alist '("\\.ascii$" . doc-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ADOC ASCIIDOC package
;; Even shows headers in difference sizes
(add-to-list 'load-path "~/.emacs.d/adoc-mode")
(autoload 'adoc-mode "adoc-mode")
;; Associate it to the .asc file extension
(add-to-list 'auto-mode-alist (cons "\\.asc\\'" 'adoc-mode))
(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))

;; Save the state of the desktop and restore it upon reopening emacs
;; Saving to the user's home directory seems to be the best choice.
;; That is what is used as the default location to search for the .emacs.desktop file.
;; Multiple files can be loaded.
(desktop-save-mode 1)

;; I don't like fill unless I want it, so set it to an insanely large number
;(set-fill-column 50000)
(setq fill-column 50000)
(auto-fill-mode -1)

;; Groovy mode
;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(add-to-list 'load-path "~/.emacs.d/groovy")
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
;; For some reason, these recommendations don't seem to work with Aquamacs
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
;; This does work with Aquamacs
(add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
(add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; This _might_ not work with Aquamacs (not sure what value it offers)
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))
;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;INI File highlighting
(require 'ini-mode)
(add-to-list 'auto-mode-alist '(".*\\.ini$" . ini-mode))
(add-to-list 'auto-mode-alist '(".*\\.gitconfig$" . ini-mode))

;File associations for org-mode
(add-to-list 'auto-mode-alist '("\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\.orgmode$" . org-mode))

;Wire in showoff mode
(add-to-list 'load-path "~/.emacs.d/showoff-mode")
(require 'showoff-mode)

;Keyboard shortcuts
;(global-set-key [f6] 'split-window-horizontally)
;(global-set-key [f7] 'split-window-vertically)
;(global-set-key [kbd "M-d"] 'delete-window)

;(global-set-key [kbd "M-s"] 'save-buffer)
;(global-set-key [kbd "M-z"] 'undo)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(global-set-key (kbd "C-c j") 'flyspell-check-previous-highlighted-word)

;; Turn off the tab bar
(tabbar-mode -1)

;; Use ibuffer for buffer nav
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;(speedbar-change-initial-expansion-list "buffers")
;;(global-set-key  [f8] 'speedbar-get-focus)

(add-hook 'after-change-major-mode-hook 
          '(lambda ()
             (tabbar-mode -1)
             (auto-fill-mode -1)))

;(global-set-key (kbd "M-w") 'kill-buffer)
;(define-key (kbd "M-w") 'kill-buffer)
