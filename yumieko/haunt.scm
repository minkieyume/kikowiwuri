(use-modules (haunt asset)
	     (haunt post)
             (haunt builder blog)
             (haunt builder atom)
	     (haunt builder rss)
             (haunt builder assets)
             (haunt reader commonmark)
             (haunt site)
	     (yumieko theme))

(site #:title "明琪的日记"
      #:domain "yumieko.kikowiwu.com"
      #:default-metadata
      '((author . "Minkie Yume")
        (email  . "minkieyume@kikowiwu.com"))
      #:readers (list commonmark-reader)
      #:builders (list (blog #:theme yumieko-theme
			     #:post-prefix "posts"
			     #:collections `(("最近日记" "index.html" ,posts/reverse-chronological))
			     #:posts-per-page 10)
                       (atom-feed #:subtitle "最近日记")
		       (rss-feed #:subtitle "最近日记
" #:file-name "rss2.xml")
                       (static-directory "images")
		       (static-directory "assets")
		       (static-directory "main" "/")))
