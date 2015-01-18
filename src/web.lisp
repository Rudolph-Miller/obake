(in-package :cl-user)
(defpackage obake.web
  (:use :cl
        :jonathan
        :obake.config
        :sxql
        :obake.models)
  (:export :*web*))
(in-package :obake.web)

(syntax:use-syntax :annot)

(set-app :obake)

@GETAPI
(defun sample ()
  (list :key1 :value1))

@GETAPI
(defun header ()
  (list :image "http://lisperati.com/lisplogo_alien_256.png"
        :title "obake"))

@GETAPI
(defun items ()
  (list :items '((:title "title1" :content "content1")
                 (:title "title2" :content "content2"))))
