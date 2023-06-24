(in-package :cl-user)

(defpackage caveman2-site.model
  (:use 
   :cl
   :cl-json
   :drakma
   :vecto
   :md5
   :split-sequence)
  (:import-from :caveman2-site.config
                :config)
  (:export :get-language-sub-stats
           :pie-chart))

(in-package :caveman2-site.model)

(defclass language ()
  (subscribers
   :accessor subs
   :initarg :subs
   :initform 0)
  (last-updated
   :accessor last-updated
   :initarg :last-updated
   :initform 0)
  (about
   :accessor about
   :initarg :about
   :initform "Some details about the langauge")
  (:documentation "Language details and stats"))

(defun pie-chart (slices)
  ""
  slices)

(defun char-vector-to-string (vector)
  (format nil "~{~a~}" (mapcar #'code-char (coerce vector 'list))))

(defun remote-json-request (uri)
  "Pull in remote JSON. Drakma returns it as a large vector of character codes
so it must be parsed to string form for cl-json"
  (let* ((json-response-raw (http-request uri))
         (json-response-string (char-vector-to-string json-response-raw))
         (json (decode-json-from-string json-response-string)))
    json))