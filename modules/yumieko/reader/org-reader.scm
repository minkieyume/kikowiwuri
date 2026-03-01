(define-module (yumieko reader org-reader)
  #:use-module (orgfile)
  #:use-module (sxml simple)
  #:use-module (haunt post)
  #:use-module (haunt reader)
  #:use-module (srfi srfi-19)
  #:export (nnw-org-reader))

(define (unformat-nnw-date org-metadata)
  (map (lambda (meta)
	 (if (or (eq? (car meta) 'date)
		 (eq? (car meta) 'modified))
	     (cons (car meta)
		   (string->date (cdr meta) "~Y-~m-~dT~H:~M:~S"))
	     meta)) org-metadata))

(define (split-tags org-metadata)
  (map (lambda (meta)
	 (if (eq? (car meta) 'tags)
	     (cons (car meta)
		   (string-split (cdr meta) #\space))
	     meta)) org-metadata))

(define nnw-org-reader
  (make-reader (make-file-extension-matcher "org")
               (lambda (file)
                 (call-with-input-file file
                   (lambda (port)
		     (let ((org (parse-orgfile port)))
		       (values ((compose unformat-nnw-date
					 split-tags)
				(orgfile-get-metadata org))
			       (orgfile->sxml org))))))))
