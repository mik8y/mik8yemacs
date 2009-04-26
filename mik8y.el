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

(when window-system
  (tool-bar-mode t)
  (tooltip-mode t)
  (scroll-bar-mode nil)
  (menu-bar-mode t)
  (blink-cursor-mode t)
  )
;; (setq buffers-menu-show-directories t)
(ansi-color-for-comint-mode-on)        
(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; korean environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-input-method "korean-hangul")

(global-set-key [?\S- ] 'toggle-input-method)
;; (global-set-key (kbd "S-SPC") 'toggle-korean-input-method)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; managerment session
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (windmove-default-keybindings 'meta)
;; (desktop-save-mode t)
;; (desktop-read)

;;##############################
;; elisp
;;##############################
;; (setq load-path (cons (expand-file-name "~/.emacs.d/addons/") load-path))
(add-to-list 'load-path (expand-file-name "~/elisp"))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'clojure-mode '(clojure-slime-config))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tool-bar+
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "menu-bar" '(require 'menu-bar+))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fullscreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'fullscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google-dictionary
;; http://turtleforward.blogspot.com/2008/09/google-dictionary-on-emacs.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (load-file "~/elisp/google-dictionary.el")
;; (setq dictionary-program "~/dict")
;; (global-set-key "\C-cs" 'dictionary-search)

