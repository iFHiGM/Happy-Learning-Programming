(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define random-init 0)
(define rand
  (let ((x random-init))
    (define (generate)
      (set! x (rand-update x))
      x)
    (define (reset initial-x)
      (set! x initial-x))
    (define (dispatch operation)
      (cond ((eq? operation 'generate) (generate))
            ((eq? operation 'reset) reset)
            (else (error "Unknown request -- RAND"
                         operation))))
    dispatch))
