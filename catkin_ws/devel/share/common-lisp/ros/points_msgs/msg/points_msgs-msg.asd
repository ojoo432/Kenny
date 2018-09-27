
(cl:in-package :asdf)

(defsystem "points_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "plane_coefficients" :depends-on ("_package_plane_coefficients"))
    (:file "_package_plane_coefficients" :depends-on ("_package"))
    (:file "points_density" :depends-on ("_package_points_density"))
    (:file "_package_points_density" :depends-on ("_package"))
    (:file "points_density_array" :depends-on ("_package_points_density_array"))
    (:file "_package_points_density_array" :depends-on ("_package"))
  ))