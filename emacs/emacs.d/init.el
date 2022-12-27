(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; set a default font
(add-to-list 'default-frame-alist '(font . "Iosevka SS18-16"))

(load-theme 'solarized-light t)
