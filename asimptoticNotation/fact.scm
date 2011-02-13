(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (* n (factorial (- n 1))))))

(define fact-iter
  (lambda (p c n)
    (if (> c n)
        p
        (fact-iter (* c p) ;tenías razón, era el counter por el producto
                   (+ c 1)
                   n))))

(define factorial2 (lambda (n) (fact-iter 1 1 n)))

(display (factorial 4))
(display (factorial2 4))
