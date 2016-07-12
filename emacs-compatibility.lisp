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

(defun backward-item (cursor)
  (cond ((cluffer:beginning-of-buffer-p cursor)
	 (error 'beginning-of-buffer
		:buffer (cluffer:buffer cursor)))
	((cluffer:beginning-of-line-p cursor)
	 (let* ((this-line-number (cluffer:line-number cursor))
		(buffer (cluffer:buffer cursor))
		(prev-line (cluffer:find-line buffer (1- this-line-number)))
		(end (cluffer:item-count prev-line)))
	   (cluffer:detach-cursor cursor)
	   (cluffer:attach-cursor cursor prev-line end)))
	(t
	 (cluffer:backward-item cursor))))

(defun item-before-cursor (cursor)
  (cond ((cluffer:beginning-of-buffer-p cursor)
	 (error 'beginning-of-buffer
		:buffer (cluffer:buffer cursor)))
	((cluffer:beginning-of-line-p cursor)
	 #\Newline)
	(t
	 (cluffer:item-before-cursor cursor))))

(defun item-after-cursor (cursor)
  (cond ((cluffer:end-of-buffer-p cursor)
	 (error 'end-of-buffer
		:buffer (cluffer:buffer cursor)))
	((cluffer:end-of-line-p cursor)
	 #\Newline)
	(t
	 (cluffer:item-after-cursor cursor))))

(defun insert-item (cursor item)
  (cond ((eql item #\Newline)
	 (cluffer:split-line cursor))
	(t
	 (cluffer:insert-item cursor item))))
