(in-package :cl-user)
(defpackage obake-asd
  (:use :cl :asdf))
(in-package :obake-asd)

(defsystem obake
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:datafly
               :sxql
               :cl-syntax
               :jonathan)
  :components ((:module "src"
                :components
                ((:file "web" :depends-on ("config" "db"))
                 (:file "db" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op obake-test))))
