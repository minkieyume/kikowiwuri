(use-modules (haunt asset)
             (haunt builder blog)
             (haunt builder atom)
             (haunt builder assets)
             (haunt reader commonmark)
             (haunt site)
	     (yumieko theme))

(site #:title "明琪的日记"
      #:domain "yura.kikowiwu.com"
      #:default-metadata
      '((author . "MinkieChiko")
        (email  . "minkieyume@kikowiwu.com"))
      #:readers (list commonmark-reader)
      #:builders (list (blog #:theme yumieko-theme)
                       (atom-feed)
                       (atom-feeds-by-tag)
                       (static-directory "images")))
