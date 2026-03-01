(use-modules (haunt asset)
	     (haunt post)
	     (haunt publisher)
             (haunt builder blog)
             (haunt builder atom)
	     (haunt builder rss)
             (haunt builder assets)
             (haunt reader commonmark)
	     (haunt publisher rsync)
             (haunt site)
	     (yumieko reader org-reader)
	     (yumieko builder tags)
	     (yumieko builder pages)
	     (yumieko theme))

(load "/home/minkieyume/Creator/remote/密码/secret/secret-ip.scm")

(site #:title "明琪的日记"
      #:domain "yumieko.kikowiwu.com"
      #:default-metadata
      '((author . "Minkie Yume")
        (email  . "minkieyume@kikowiwu.com"))
      #:readers (list commonmark-reader nnw-org-reader)
      #:builders (list (blog #:theme yumieko-theme
			     #:post-prefix "posts"
			     #:collections `(("最近日记" "index.html" ,posts/reverse-chronological))
			     #:posts-per-page 10)
                       (atom-feed #:subtitle "最近日记")
		       (rss-feed #:subtitle "最近日记" #:file-name "rss2.xml")
		       (archives-page)
		       (tag-page)
		       (tags->page)
                       (static-directory "images")
		       (static-directory "assets")
		       (static-directory "main" "/"))
      #:publishers (list (rsync-publisher #:user "minkieyume"
					  #:destination "/var/lib/www/yumieko.kikowiwu.com"
					  #:host %chikocloud-sg)))
