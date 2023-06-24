(defsystem "caveman2-site-test"
  :defsystem-depends-on ("prove-asdf")
  :author "John Matthews"
  :license ""
  :depends-on ("caveman2-site"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "caveman2-site"))))
  :description "Test system for caveman2-site"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
