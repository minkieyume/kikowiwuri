(define-module (yumieko builder pages)
  #:use-module (haunt builder blog)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19)
  #:use-module (ice-9 match)  
  #:use-module (haunt html)
  #:use-module (haunt post)
  #:use-module (haunt page)
  #:use-module (haunt site)
  #:use-module (haunt utils)
  #:use-module (haunt artifact)
  #:use-module (yumieko theme)
  #:use-module (haunt utils)
  #:use-module (sxml match)
  #:export (archives-page))

(define* (archives-page #:key (theme yumieko-theme))
  (lambda (site posts)
    (serialized-artifact "archives/index.html"
			 (with-layout
			  theme
			  site
			  "归档"
			  `(div (@ (class "content"))
				(h2 "归档")
				(ul
				 ,(map (lambda (post)
					 `(li (a (@ (href ,(string-append
							    "/posts/" (site-post-slug site post))))
						 ,(post-ref post 'title))))
				       (posts/reverse-chronological posts)))))
			 sxml->html)))
