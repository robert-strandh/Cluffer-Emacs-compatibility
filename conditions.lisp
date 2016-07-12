(cl:in-package #:cluffer-emacs)

(define-condition buffer-error-mixin ()
  ((%buffer :initarg :buffer :reader buffer)))

(define-condition beginning-of-buffer
    (error buffer-error-mixin acclimation:condition)
  ())

(define-condition end-of-buffer
    (error buffer-error-mixin acclimation:condition)
  ())
