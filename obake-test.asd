(in-package :cl-user)
(defpackage obake-test-asd
  (:use :cl :asdf))
(in-package :obake-test-asd)

(defsystem obake-test
  :author ""
  :license ""
  :depends-on (:obake
               :prove)
  :components ((:module "t"
                :components
                ((:file "obake"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
