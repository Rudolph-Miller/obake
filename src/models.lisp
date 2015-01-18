(in-package :cl-user)
(defpackage obake.models
  (:use :cl :integral)
  (:import-from :obake.config
                :config))
(in-package :obake.models)

(apply #'connect-toplevel (cdr (assoc :maindb (config :databases))))
(setf integral:*auto-migration-mode* t)

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

(defclass post ()
  ((id :type integer
       :primary-key t
       :auto-increment t
       :reader post-id)
   (title :type (varchar 255)
          :accessor post-title)
   (content :type text
            :accessor post-content)
   (created-at :type timestamp
               :accessor post-created-at)
   (user-id :type integer
            :accessor post-user-id))
  (:metaclass <dao-table-class>)
  (:keys (user-id)))

(defmethod integral:inflate ((object post) (slot-name (eql 'created-at)) value)
  (local-time:universal-to-timestamp value))
(defmethod integral:inflate ((object post) (slot-name (eql 'updated-at)) value)
  (local-time:universal-to-timestamp value))
(defmethod integral:deflate ((object user) (slot-name (eql 'password)) value)
  (bcrypt:hash value))
(defmethod integral:deflate ((object post) (slot-name (eql 'updated-at)) value)
  (local-time:timestamp-to-universal value))

(defmethod user-posts ((user user))
  (select-dao 'post (where (:= :user-id (user-id user)))))
