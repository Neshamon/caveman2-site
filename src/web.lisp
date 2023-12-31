(in-package :cl-user)
(defpackage caveman2-site.web
  (:use :cl
        :caveman2
        :caveman2-site.config
        :caveman2-site.view
        :caveman2-site.db
        :caveman2-site.model
        :datafly
        :sxql
        :split-sequence
        :md5)
  (:export :*web*))
(in-package :caveman2-site.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))

(defroute "/compare/*" (&key splat)
  (format nil "We saw this in the URL: ~a" (car splat)))