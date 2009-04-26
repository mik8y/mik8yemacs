(setq user-mail-address "mikmy9@gmail.com")
(setq user-full-name "mik8y")

(setq gnus-select-method '(nntp "news.gnus.org"))

;; (add-to-list 'gnus-secondary-select-methods '(nntp "localhost"))

;; (add-to-list 'gnus-secondary-select-methods '(nntp
;; "news.gnus.org"))

;; (add-to-list 'gnus-secondary-select-methods '(nnml ""))

;; (setq mail-sources '((pop :server "pop.provider.org"

;;                           :user "you"

;;                           :password "secret")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gmail via imap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
                                                     (nnimap-address "imap.gmail.com")
                                                     (nnimap-server-port 993)
                                                     (nnimap-stream ssl)
                                                     ;; (nnimap-authinfo-file "~/.authinfo")
                                                     ))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "mikmy9@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "thinkfree.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gmail via pop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq mail-sources
;;       '((pop :server "pop.gmail.com"
;;              :port 995
;;              :user "mikmy9@gmail.com"
;;              :password "rekc4h"
;;              :stream ssl)))

(setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
(setq gnus-posting-styles
      '((".*"
         ("CC" "mikmy9@gmail.com")
         (address "mikmy9@gmail.com"))))
