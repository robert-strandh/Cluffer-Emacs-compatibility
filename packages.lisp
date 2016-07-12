(cl:in-package #:common-lisp-user)

(defpackage #:cluffer-emacs
  (:use #:common-lisp)
  (:export #:forward-item
	   #:backward-item
	   #:item-before-cursor
	   #:item-after-cursor
	   #:insert-item
	   #:delete-item))
