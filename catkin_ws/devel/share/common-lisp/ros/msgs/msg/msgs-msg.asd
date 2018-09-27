
(cl:in-package :asdf)

(defsystem "msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "points_density" :depends-on ("_package_points_density"))
    (:file "_package_points_density" :depends-on ("_package"))
  ))