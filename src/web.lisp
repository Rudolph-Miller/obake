(in-package :cl-user)
(defpackage obake.web
  (:use :cl
        :caveman2
        :jonathan
        :obake.config
        :obake.models
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
  `(:items ,(all-posts)))

@GETAPI
(defun admin ()
  (loop for key being the hash-keys of *session*
     do (print key)
       do (print (gethash key *session*)))
  (list :a :b))
