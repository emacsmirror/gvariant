;;; gvariant-tests.el --- Tests for gvariant.el -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'ert)
(require 'gvariant)

(ert-deftest gvariant--test-parsing-boolean ()
  (should (equal (gvariant-parse "true") t))
  (should (equal (gvariant-parse "false") nil))
  (should (equal (gvariant-parse "boolean true") t)))

(ert-deftest gvariant--test-parsing-number ()
  (should (equal (gvariant-parse "123") 123))
  (should (equal (gvariant-parse "+123") 123))
  (should (equal (gvariant-parse "-123") -123))
  (should (equal (gvariant-parse "37.5") 37.5))
  (should (equal (gvariant-parse ".5") .5))
  (should (equal (gvariant-parse "-.5") -.5))
  (should (equal (gvariant-parse "3e1") 30.0))
  (should (equal (gvariant-parse "3.75e1") 37.5))
  (should (equal (gvariant-parse "300e-1") 30.0))
  (should (equal (gvariant-parse "0123") 83))
  (should (equal (gvariant-parse "+0123") 83))
  (should (equal (gvariant-parse "-0123") -83))
  (should (equal (gvariant-parse "0xff") 255))
  (should (equal (gvariant-parse "+0xff") 255))
  (should (equal (gvariant-parse "-0xff") -255))
  (should (equal (gvariant-parse "uint32 12") 12))
  (should (equal (gvariant-parse "int32 12") 12)))

(ert-deftest gvariant--test-parsing-string ()
  (should (equal (gvariant-parse "'foo'") "foo"))
  (should (equal (gvariant-parse "string 'foo'") "foo"))
  (should (equal (gvariant-parse "\"foo\"") "foo"))
  (should (equal (gvariant-parse "'\\a\\t\\b\\n'") "\a\t\b\n"))
  (should (equal (gvariant-parse "'\\u2603\\U0001f984'") "☃🦄")))

(ert-deftest gvariant--test-parsing-array ()
  (should (equal (gvariant-parse "['foo', 'bar']") ["foo" "bar"]))
  (should (equal (gvariant-parse "@as []") [])))

(ert-deftest gvariant--test-parsing-tuple ()
  (should (equal (gvariant-parse "('foo', 123)")
                 '("foo" 123)))
  (should (equal (gvariant-parse "('a', 1, [3], [])")
                 '("a" 1 [3] []))))

(ert-deftest gvariant--test-parsing-dictionary ()
  (should (equal (gvariant-parse
                  "{'a': 'aa', 'b': 'bb'}")
                 '(("a" "aa") ("b" "bb"))))
  (should (equal (gvariant-parse
                  "[{1, \"one\"}, {2, \"two\"}, {3, \"three\"}]")
                 '((1 "one") (2 "two") (3 "three")))))

(provide 'gvariant-tests)
;;; gvariant-tests.el ends here
