(in-package :cl-user)
(defpackage obake-asd
  (:use :cl :asdf))
(in-package :obake-asd)

(defsystem obake
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:sxql
               :cl-syntax
               :jonathan
               :integral
               :local-time
               :monkeylib-bcrypt)
  :components ((:module "src"
                :components
                ((:file "web" :depends-on ("config" "models"))
                 (:file "config")
                 (:file "models" :depends-on ("config")))))
  :description ""
  :in-order-to ((test-op (load-op obake-test))))
