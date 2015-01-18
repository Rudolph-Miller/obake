(in-package :cl-user)
(defpackage obake.models
  (:use :cl
        :integral
        :annot.class)
  (:import-from :obake.config
                :config))
(in-package :obake.models)

(syntax:use-syntax 'annot)

(apply #'connect-toplevel (cdr (assoc :maindb (config :databases))))
(setf integral:*auto-migration-mode* t)

;; Class definitions

@export
@export-accessors
(defclass user ()
  ((id :type integer
       :primary-key t
       :auto-increment t
       :reader user-id)
   (name :type (varchar 255)
         :accessor user-name
         :initarg :name)
   (email :type (varchar 255)
          :accessor user-email
          :initarg :name)
   (password :type (varchar 255)
                       :accessor user-password))
  (:metaclass <dao-table-class>))

@export
@export-accessors
(defclass post ()
  ((id :type integer
       :primary-key t
       :auto-increment t
       :reader post-id)
   (title :type (varchar 255)
          :accessor post-title
          :initarg :title)
   (content :type text
            :accessor post-content
            :initarg :content)
   (created-at :type timestamp
               :reader post-created-at)
   (user-id :type integer
            :accessor post-user-id
            :initarg :user-id))
  (:metaclass <dao-table-class>)
  (:keys (user-id)))

;; Inflation & Deflation

(defmethod integral:inflate ((object post) (slot-name (eql 'created-at)) value)
  (local-time:universal-to-timestamp value))
(defmethod integral:inflate ((object post) (slot-name (eql 'updated-at)) value)
  (local-time:universal-to-timestamp value))
(defmethod integral:deflate ((object user) (slot-name (eql 'password)) value)
  (bcrypt:hash value))
(defmethod integral:deflate ((object post) (slot-name (eql 'updated-at)) value)
  (local-time:timestamp-to-universal value))

;; Relations

@export
(defmethod user-posts ((user user))
  (select-dao 'post (where (:= :user-id (user-id user)))))

;; User

@export
(defun sign-in (email password)
  (let ((user (car (select-dao 'user (where (:= :user.email email)) (limit 1)))))
    (when (and user (bcrypt:password= password (user-password user)))
        user)))

;; Posts

@export
(defun all-posts ()
  (select-dao 'post))
