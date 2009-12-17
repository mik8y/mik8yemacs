;;; ##############################
;;; set environment
;;; ##############################

;;; concat ports path in PATH environment
(when (eq system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
  )

;;; when windows system
(when window-system
  (tool-bar-mode t)
  (tooltip-mode t)
  (scroll-bar-mode nil)
  (menu-bar-mode t)
  (blink-cursor-mode t)
  (color-theme-twilight))

;;; enable killing and yanking from emacs to os region 
(setq x-select-enable-clipboard t)

;;; set tab size 
(setq default-tab-width 2)

;; use UTF-8
(set-language-environment "Korean")

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; set input method toggle key to 'Shift-Space'
(global-set-key [?\S- ] 'toggle-input-method)

;;; ##############################
;;; load path
;;; ##############################
;; (progn (cd "~/.emacs.d/elisp") (normal-top-level-add-subdirs-to-load-path))
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/elisp/")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;;; ##############################
;;; adding package in elisp directory
;;; ##############################

;;; emacs for xcode
;;; ##############################
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/emacs-xcode"))

(setq auto-mode-alist
      (cons '("\\.m$" . objc-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mm$" . objc-mode) auto-mode-alist))

;; (defun bh-compile ()
;;   (interactive)
;;   (let ((df (directory-files "."))
;;         (has-proj-file nil)
;;         )
;;     (while (and df (not has-proj-file))
;;       (let ((fn (car df)))
;;         (if (> (length fn) 10)
;;             (if (string-equal (substring fn -10) ".xcodeproj")
;;                 (setq has-proj-file t)
;;               )
;;           )
;;         )
;;       (setq df (cdr df))
;;       )
;;     (if has-proj-file
;;         (compile "xcodebuild -configuration Debug")
;;       (compile "make")
;;       )
;;     )
;;   )

;;; auto-isntall mode
;;; ##############################
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
;; (setq url-proxy-services '(("http" . "localhost:8339")))

;;; zkm-mode
;;; ##############################
(add-to-list 'load-path "~/.emacs.d/elisp/zkm-mode/")
(autoload 'zkm-mode "zkm-mode" "ZKM mode." t)
(setq auto-mode-alist (append '(("\\.zkm$" . zkm-mode))
                              auto-mode-alist))

;;; ##############################
;;; adding by elpa
;;; ##############################
;; asciidoc
(add-to-list 'load-path "~/.emacs.d/elpa/asciidoc-0.1")
(require 'asciidoc)

;;; highlight-symbol
;;; ##############################
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)
(global-set-key [(control meta f3)] 'highlight-symbol-query-replace)

;;; company-mode
;;; ##############################
(add-to-list 'load-path "~/.emacs.d/elpa/company-0.4.3")
(autoload 'company-mode "company" nil t)

;; (add-to-path 'load-path "/path/to/guess-style")
;; (autoload 'guess-style-set-variable "guess-style" nil t)
;; (autoload 'guess-style-guess-variable "guess-style")
;; (autoload 'guess-style-guess-all "guess-style" nil t)

;; (global-guess-style-info-mode 1)

;;; ##############################
;;; user definition function
;;; ##############################

;;; Copying Lines, not killing(http://emacsblog.org/2009/05/18/copying-lines-not-killing/)
;;; ##############################
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))
 
(setq-default kill-read-only-ok t)
(global-set-key "\C-c\C-k" 'copy-line)

;;; Easier Window Switching in Emacs(http://emacsblog.org/2008/05/01/quick-tip-easier-window-switching-in-emacs/)
;;; ##############################
(windmove-default-keybindings 'meta)

;;; ##############################
;;; Customize Setting
;;; ##############################



;;; swap option command key
;;; ##############################
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;; setting anti-aliasing
;;; ##############################
;; (setq mac-allow-anti-aliasing t)    ;; turn on anti-aliasing (default)
;; (setq mac-allow-anti-aliasing nil)  ;; turn off anti-aliasing



;;; Language Environment
;;; ##############################
;; (when enable-multibyte-characters   ; if this emacs is compiled with leim
;;   (set-language-environment "Korean")
;;   (prefer-coding-system 'euc-kr)
;;   )
;; (set-language-environment "Korean")
;; (set-default-coding-systems 'utf-8)
;; (set-keyboard-coding-system 'utf-8)



;;; nsis mode
;;; ##############################
(defsubst nsi-point (position)
  "Returns the value of point at certain commonly referenced POSITIONs.
POSITION can be one of the following symbols:
  bol  -- beginning of line    eol  -- end of line           bod  -- beginning of def or class
  eod  -- end of def or class  bob  -- beginning of buffer   eob  -- end of buffer
  boi  -- back to indentation  bos  -- beginning of statement
This function does not modify point or mark."
  (let ((here (point)))
    (cond
     ((eq position 'bol) (beginning-of-line))
     ((eq position 'eol) (end-of-line))
     ((eq position 'bod) (nsi-beginning-of-def-or-class))
     ((eq position 'eod) (nsi-end-of-def-or-class))
     ;; Kind of funny, I know, but useful for py-up-exception.
     ((eq position 'bob) (beginning-of-buffer))
     ((eq position 'eob) (end-of-buffer))
     ((eq position 'boi) (back-to-indentation))
     ((eq position 'bos) (nsi-goto-initial-line))
     (t (error "Unknown buffer position requested: %s" position))
     )
    (prog1
        (point)
      (goto-char here))))

(autoload 'nsi-mode "nsi-mode" "nsi editing mode." t)
(add-to-list 'auto-mode-alist '("\\.nsi$" . nsi-mode))

;; (defvar extra-stuff-path "c:/extra" "defines the extra path")
;; (setq load-path (cons extra-stuff-path load-path)


;;; ##############################
;;; Temp Area
;;; ##############################
;; (defun mac-toggle-max-window ()
;;   (interactive)
;;   (set-frame-parameter nil 'fullscreen 
;;     (if (frame-parameter nil 'fullscreen)
;;       nil
;;       'fullboth)))

;; (require 'ispell)
;; (defun search-naver-dic ()
;;   (interactive)
;;   (save-excursion
;;     (let* ((word-to-find (car (ispell-get-word t))))
;;       (shell-command-to-string
;;        (concat "firefox -remote "
;; 	       "'openURL(http://endic.naver.com/search.naver?mode=all&query="
;; 	       word-to-find
;; 	       "&x=0&y=0)'")))))

;; (global-set-key [(Hangul_Hanja)] 'search-naver-dic)
