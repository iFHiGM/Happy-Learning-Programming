;; make-account with password
(define (make-account balance secret-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch passwd m)
    (if (eq? passwd secret-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        (lambda (amount)
          "Incorrect password")))
  dispatch)

;; (define acc (make-account 100 'secret-password))
;; ((acc 'secret-password 'withdraw) 40)

;; ((acc 'some-other-password 'deposit) 50)
