(define (square x)
  (* x x))

;esto funciona así:
;si n es par, son potenciaciones sucesivas:
;  b⁴ = b² * b²
;  b⁸ = b⁴ * b⁴
;si es impar, podemos expresarlo como b*(el número par anterior):
;  b⁹ = b * (b⁸)
;si se fijan, estamos tomando decisiones en el problema, partiéndolo
;en conjuntos, de modo que nos quedamos con sub-problemas la mitad de grandes.
;de esta manera, llegamos más rápido a las sub-soluciones.
;
;cuando uno tiene algo como esto, partir el conjunto de entradas en dos
;sub-conjuntos con tratos distintos, estamos tratando con un algoritmo
;de orden log n/log 2 (logaritmo base dos de n)
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


