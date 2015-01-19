(in-package :cl-user)
(defpackage obake.web
  (:use :cl
        :jonathan
        :obake.config
        :obake.models
        :sxql
        :obake.models)
  (:export :*web*))
(in-package :obake.web)

(syntax:use-syntax :annot)

(set-app :obake)

(defun ensure-signin ()
  (when (null (gethash :user *session*))
    (throw-code 403)))

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

@POSTAPI
(defun sign-in (&key |email| |password|)
  (let ((user (user-sign-in |email| |password|)))
    (setf (gethash :user *session*) user)))

@DELETEAPI
(defun sign-out ()
  (setf (gethash :user *session*) nil))
