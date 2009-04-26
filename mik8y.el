;;
;; mik8y.el
;; Login : <mik8y@g8rh8d>
;; Started on  Wed Apr 15 11:12:17 2009 mik8y
;; $Id$
;; 
;; Copyright (C) @2009@ mik8y
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
;;
;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; [START] load-path
;; By default Emacs doesn’t include subdirectories of a directory which is added to load-path. But you can do it by issuing a command in startup file:

;; (normal-top-level-add-subdirs-to-load-path)

;; which will add all subdirs of current directory and all subdirectories of those directories recursively. Note: current directory is not necessarily the one where your script is executed at the moment. So you first need to change directory to the required one:

;; (progn (cd "~/elisp") (normal-top-level-add-subdirs-to-load-path))
;; (progn (cd "~/.emacs.d/elpa") (normal-top-level-add-subdirs-to-load-path))

;; In this example it is assumed that you want to add all subdirs of the ~/elisp directory.

;; However, this will make your emacs run as if you had started it from ~/elisp, which is annoying. The following code snippet, found at http://mail.gnu.org/archive/html/help-gnu-emacs/2003-07/msg00504.html avoids this problem:

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/elisp/")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;; If you only want some of the subdirectories added you can use

;; (normal-top-level-add-to-load-path
;;  '("emms" "erc" "planner" "w3"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; [END] loadpath

(when window-system
  (tool-bar-mode t)
  (tooltip-mode t)
  (scroll-bar-mode nil)
  (menu-bar-mode t)
  (blink-cursor-mode t)
  (require 'fullscreen)
  (fullscreen-toggle)
  )
;; (setq buffers-menu-show-directories t)
(ansi-color-for-comint-mode-on)        
(setq make-backup-files nil)

(setq x-select-enable-clipboard t)
(setq default-tab-width 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; korean environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-input-method "korean-hangul")

(global-set-key [?\S- ] 'toggle-input-method)
;; (global-set-key (kbd "S-SPC") 'toggle-korean-input-method)
(global-set-key [(f11)] 'fullscreen-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; managerment session
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (windmove-default-keybindings 'meta)
;; (desktop-save-mode t)
;; (desktop-read)

;;##############################
;; elisp
;;##############################


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remember
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'remember)

;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;; (require 'remember-planner)
;; (setq remember-handler-functions '(remember-planner-append))
;; (setq remember-annotation-functions planner-annotation-functions)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; webloger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq url-http-response-status (string-to-number "200"))
;; (setq url-default-working-buffer "*URL*")
;; (require 'weblogger)
;; (load-file "weblogger-1.2.1/weblogger.el")
;; (require 'weblogger)
;; (global-set-key "\C-cbs" 'weblogger-start-entry)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'clojure-mode '(clojure-slime-config))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tool-bar+
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "menu-bar" '(require 'menu-bar+))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google-dictionary
;; http://turtleforward.blogspot.com/2008/09/google-dictionary-on-emacs.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (load-file "~/elisp/google-dictionary.el")
;; (setq dictionary-program "~/dict")
;; (global-set-key "\C-cs" 'dictionary-search)

;; (gnus)

;; (load-library "g")

( color-theme-twilight)