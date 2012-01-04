;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPA
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Matthew's custom setup preferences and mode loads.
(setq load-path (cons "~/.emacs.d" load-path))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customizations

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aquamacs
;; From customizations.el which gets generated in the
;; /Users/mccm06/Library/Preferences/Aquamacs Emacs/customizations.el folder.
;;
(custom-set-variables
 ;; Set the toolbar buttons to be plaintext
 '(ns-tool-bar-display-mode (quote labels) t)
 '(ns-tool-bar-size-mode (quote regular) t)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font
;(set-default-font "-apple-monaco*-medium-r-normal--16-*-*-*-*-*-fontset-monaco12")
;(set-default-font "-apple-menlo*-medium-r-normal--16-*-*-*-*-*-fontset-monaco12")
;(set-default-font "-apple-bitstream vera sans mono-medium-r-normal--12-120-72-72-m-120-iso10646-1")
;(set-default-font "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")
(set-default-font "-apple-inconsolata-medium-r-normal--16-*-*-*-*-*-fontset-monaco12")
;; Mac Default
;(set-default-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Special Keys
;; set up alt key to work as META on Mac
(set-keyboard-coding-system 'mac-roman)
;; (mac-key-mode)
;; http://www.emacswiki.org/emacs/AquamacsFAQ#toc6
;;(setq mac-option-modifier 'meta)
;;(setq mac-command-key-is-meta nil)

;;;;;;;;;;;;;;;;;;;;;;;
;; Revert Files
;; Always revert if changes are made to files outside of Emacs
;; From http://stackoverflow.com/questions/665600/how-can-i-get-emacs-to-revert-all-unchanged-buffers-when-switching-branches-in-g
(global-auto-revert-mode)

;;;;;;;;;;;;;;;;;;;;;;
; Line numbers
; http://www.emacswiki.org/emacs/LineNumbers
; Using global-linum-mode in the init.el will cause Aquamacs to prompt you to save
; preferences every time and you don't want to do that or it then
; ONLY uses ~/Library/Preferences/Aquamacs Emacs/customizations.el
; which prevents any regular ~/.emacs.d/init.el from loading.
;(global-linum-mode 1)
; On the other hand, this approach works just fine and doesn't cause any prompting to
; save customizations since it isn't global
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;
;; Disable the ability to convert to lower case
;(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;
;; Tabs
;; always use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;
;; Kill Ring
;; Merge the kill ring with the clipboard
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desktop
;; Save the state of the desktop and restore it upon reopening emacs
;; Saving to the user's home directory seems to be the best choice.
;; That is what is used as the default location to search for the .emacs.desktop file.
;; Multiple files can be loaded.
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill Column
;; I don't like fill unless I want it, so set it to an insanely large number
;(set-fill-column 50000)
(setq fill-column 50000)
(auto-fill-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font Lock
;; Globally enable font-lock syntax highlighting
;; Font Lock mode is a minor mode, always local to a particular buffer,
;; which highlights (or "fontifies") using various faces according to
;; the syntax of the text you are editing. It can recognize comments 
;; and strings in most languages; in several languages, it can also
;; recognize and properly highlight various other important constructs
;; --for example, names of functions being defined or reserved keywords.
;; To turn on Font Lock mode automatically in all modes which support it,
;; use the function global-font-lock-mode
;; http://www.phys.ufl.edu/docs/emacs/emacs_180.html
(global-font-lock-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabbar
;; After loading any new major mode, turn off the
;; tab bar and turn off auto-fill
(add-hook 'after-change-major-mode-hook 
          '(lambda ()
             (tabbar-mode -1)
             (auto-fill-mode -1)))
;; Turn off the tab bar when Emacs is launched
(tabbar-mode -1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Libraries

;;;;;;;;;;;;;;;;;;;;;;;
;; Speedbar
;;(speedbar-change-initial-expansion-list "buffers")
;;(global-set-key  [f8] 'speedbar-get-focus)

;;;;;;;;;;;;;;;;;;;;;;;
; icicles
(add-to-list 'load-path "~/.emacs.d/icicles")
(require 'icicles)
;Turn on icicles
(icy-mode)

;;;;;;;;;;;;;;;;
;; Color theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-arjen)

;Solarized color theme
;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;(require 'color-theme-solarized)
;(color-theme-scintilla)
(color-theme-gtk-ide)

;;;;;;;;;;;;;;;;
;; ack
;; Code regex searching tool
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
;; Floatover highlighting for symbols
(autoload 'light-symbol "light-symbol" "Float-over highlighting for symbols." t)

;;;;;;;;;;;;;;;;
;; magit
;; Git support
(require 'magit)

;;;;;;;;;;;;;;;;
;; Ruby
(require 'ruby-mode)


;;;;;;;;;;;;;;;;
;; paraedit
;; Parenthesis matching
(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)

;;;;;;;;;;;;;;;;
;; wrap-region
;; Paired character entry (wrapping with characters) feature
(add-to-list 'load-path "~/.emacs.d/wrap-region.el")
(require 'wrap-region)
;(wrap-region-mode t)

(add-hook 'ruby-mode-hook
          '(lambda() (wrap-region-mode t)
))

;; For Markdown, customize what characters are wrapped
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HTML
(setq auto-mode-alist (cons '("\\.html?$" . html-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rake
;; Rake files are actually Ruby too
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell
;; System shell embedded within Emacs
(require 'shell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doc mode
;; Didn't parse code block `stuff` in Asciidoc very well
;; DISABLING FOR NOW
; (add-to-list 'load-path "~/.emacs.d/doc-mode")
; (autoload 'doc-mode "doc-mode")
; (add-to-list 'auto-mode-alist '("\\.asc$" . doc-mode))
; (add-to-list 'auto-mode-alist '("\\.ascii$" . doc-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ADOC ASCIIDOC package
;; Even shows headers in difference sizes
(add-to-list 'load-path "~/.emacs.d/adoc-mode")
(autoload 'adoc-mode "adoc-mode")
;; Associate it to the .asc file extension
(add-to-list 'auto-mode-alist (cons "\\.asc\\'" 'adoc-mode))
(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Groovy mode
;(add-to-list 'load-path "~/.emacs.d/groovy")
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
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

;;;;;;;;;;;;;;;;;;;;;;
;; INI File highlighting
(require 'ini-mode)
(add-to-list 'auto-mode-alist '(".*\\.ini$" . ini-mode))
(add-to-list 'auto-mode-alist '(".*\\.gitconfig$" . ini-mode))

;;;;;;;;;;;;;;;;;;;;;;
;; Load showoff mode
;; https://github.com/developernotes/showoff-mode
(add-to-list 'load-path "~/.emacs.d/showoff-mode")
(require 'showoff-mode)

;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode
;; File Associations
(add-to-list 'auto-mode-alist '("\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\.orgmode$" . org-mode))

;;;;;;;;;;;;;;;;;;;;;;;;
;; MOBILE ORG
;; http://mobileorg.ncogni.to/doc/getting-started/using-dropbox/
;;
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(custom-set-variables
 '(org-agenda-files (quote ("~/org")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SR Speedbar
;; Opens in same frame
;; http://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-x C-P") 'sr-speedbar-toggle)
(make-face 'speedbar-face)
(set-face-font 'speedbar-face "Inconsolata-11")
(setq speedbar-mode-hook '(lambda () (buffer-face-set 'speedbar-face)))
(setq speedbar-use-images nil)
(setq speedbar-show-unknown-files 1)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard Shortcuts
;(global-set-key (kbd "M-w") 'kill-buffer)
;(define-key (kbd "M-w") 'kill-buffer)

;(global-set-key [f6] 'split-window-horizontally)
;(global-set-key [f7] 'split-window-vertically)
;(global-set-key [kbd "M-d"] 'delete-window)

;(global-set-key [kbd "M-s"] 'save-buffer)
;(global-set-key [kbd "M-z"] 'undo)

;; Flyspell checking
(global-set-key (kbd "C-c j") 'flyspell-check-previous-highlighted-word)

;; Use ibuffer for buffer navigation
(global-set-key (kbd "C-x C-b") 'ibuffer)


(global-set-key (kbd "C-x C-G") 'magit-status)

(global-set-key (kbd "C-x C-r") 'eval-region)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Code

;;;;;;;;;;;;;;;;;;;;;;
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

(global-set-key (kbd "C-c C-P") 'nxml-pretty-print-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Word count function
(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Final setup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on speedbar on the whole window
;(setq sr-speedbar-width-x 25)
;(setq sr-speedbar-width-console 25)
;(setq sr-speedbar-right-side nil)
;(setq sr-speedbar-max-width 25)
(setq speedbar-frame-parameters
      '((minibuffer)
	(width . 40)
	(border-width . 0)
	(menu-bar-lines . 0)
	(tool-bar-lines . 0)
	(unsplittable . t)
	(left-fringe . 0)))
(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 70)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

;(sr-speedbar-toggle)


;;;;;;;;;;;;;;;;;;;;;;;
;; Initial splits
;; Full length window on left. Two short vertical stacks on right.
(split-window-horizontally)
(other-window 1)
(split-window-vertically)
