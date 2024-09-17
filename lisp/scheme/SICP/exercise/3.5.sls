(define (square x)
  (* x x))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (is-contain-point? x y)
  (<= (+ (square x)
         (square y))
      1.0))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (let ((rectangle-area (* (- x2 x1) (- y2 y1))))
    (* rectangle-area (monte-carlo
                       trials
                       (lambda () (P (random-in-range x1 x2)
                                     (random-in-range y1 y2)))))))

(estimate-integral is-contain-point? -2.0 1.0 -2.0 1.0 1000000)
