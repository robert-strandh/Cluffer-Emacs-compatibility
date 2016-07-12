(cl:in-package #:asdf-user)

(defsystem cluffer-emacs-compatibility
  :description "Library for Emacs compatibility of a Cluffer editor buffer."
  :author "Robert Strandh <robert.strandh@gmail.com>"
  :license "FreeBSD, see file LICENSE.text"
  :depends-on (:acclimation
	       :cluffer)
  :serial t
  :components
  ((:file "packages")
   (:file "conditions")
   (:file "emacs-compatibility")))
