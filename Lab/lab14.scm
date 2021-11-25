(define (split-at lst n)
  (cond ((< (length lst) n) (cons lst nil))
        ((= n 0) (cons '() lst))
        (else (cons (cons (car lst) (car (split-at (cdr lst) (- n 1)))) 
                    (cdr (split-at (cdr lst) (- n 1))))))
)


(define (compose-all funcs)
  (lambda (x) (if (null? funcs) x
                  ((compose-all (cdr funcs)) ((car funcs) x))))
)

