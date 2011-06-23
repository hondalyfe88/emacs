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


;;;;;;;;;;;;;;;;
;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

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
  (add-hook hook (lambda () (flyspell-mode 1))))

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
(wrap-region-mode t)
(add-hook 'ruby-mode-hook
          '(lambda() (wrap-region-mode t)
))
(add-hook 'markdown-mode-hook
          '(lambda() (wrap-region-mode t)
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

;; Save the state of the desktop and restore it upon reopening emacs
;; Saving to the user's home directory seems to be the best choice.
;; That is what is used as the default location to search for the .emacs.desktop file.
;; Multiple files can be loaded.
(desktop-save-mode 1)

;; I don't like fill unless I want it, so set it to an insanely large number
;(set-fill-column 50000)
(auto-fill-mode -1)

;; git-emacs package. Using magit for now instead
 ;(add-to-list 'load-path "~/.emacs.d/git-emacs")
 ;(autoload 'git-emacs "git-emacs")


;INI File highlighting
(require 'ini-mode)
(add-to-list 'auto-mode-alist '(".*\\.ini$" . ini-mode))
(add-to-list 'auto-mode-alist '(".*\\.gitconfig$" . ini-mode))
