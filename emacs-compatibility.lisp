(cl:in-package #:cluffer-emacs)

(defun forward-item (cursor)
  (cond ((cluffer:end-of-buffer-p cursor)
	 (error 'end-of-buffer
		:buffer (cluffer:buffer cursor)))
	((cluffer:end-of-line-p cursor)
	 (let* ((this-line-number (cluffer:line-number cursor))
		(buffer (cluffer:buffer cursor))
		(next-line (cluffer:find-line buffer (1+ this-line-number))))
	   (cluffer:detach-cursor cursor)
	   (cluffer:attach-cursor cursor next-line 0)))
	(t
	 (cluffer:forward-item cursor))))
