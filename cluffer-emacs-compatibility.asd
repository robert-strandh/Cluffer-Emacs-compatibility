(cl:in-package #:asdf-user)

(defsystem cluffer-emacs-compatibility
  :depends-on (:acclimation
	       :cluffer)
  :serial t
  :components
  ((:file "packages")
   (:file "conditions")))
