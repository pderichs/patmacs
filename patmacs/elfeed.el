;;; elfeed.el -*- lexical-binding: t; -*-

(use-package elfeed
  :commands (elfeed elfeed-update)
  :custom
  (elfeed-search-filter "@2-weeks-ago +unread")
  (elfeed-feeds
   '(("https://planet.emacslife.com/atom.xml" emacs)
     ("https://sachachua.com/blog/feed/" emacs)
     ("https://www.masteringemacs.org/feed" emacs)
     ("https://irreal.org/blog/?feed=rss2" emacs)
     ("https://emacsredux.com/atom.xml" emacs)
     ("https://nullprogram.com/feed/" emacs programming)

     ("https://jvns.ca/atom.xml" programming linux)
     ("https://simonwillison.net/atom/everything/" programming ai)
     ("https://martinfowler.com/feed.atom" programming architecture)
     ("https://blog.pragmaticengineer.com/rss/" programming industry)
     ("https://www.joelonsoftware.com/feed/" programming archive)
     ("https://github.blog/feed/" programming github)

     ("https://lwn.net/headlines/rss" linux opensource)
     ("https://www.phoronix.com/rss.php" linux hardware)
     ("https://archlinux.org/feeds/news/" linux arch)
     ("https://www.debian.org/News/news" linux debian)
     ("https://www.gnome.org/news/feed/" linux desktop)
     ("https://kde.org/announcements/index.xml" linux desktop kde)

     ("https://www.schneier.com/feed/atom/" security privacy)
     ("https://www.krebssecurity.com/feed/" security)
     ("https://www.bellingcat.com/feed/" osint)

     ("https://lobste.rs/rss" programming news)
     ("https://hnrss.org/frontpage" programming news hn)
     ("https://www.heise.de/rss/heise-atom.xml" tech deutsch)
     ("https://www.golem.de/rss.php?feed=RSS2.0" tech deutsch)

     ("https://ciechanow.ski/atom.xml" engineering visual)
     ("https://www.ribbonfarm.com/feed/" essays)
     ("https://aeon.co/feed.rss" essays science)
     ("https://pluralistic.net/feed/" tech society))))

;;; elfeed.el ends here
